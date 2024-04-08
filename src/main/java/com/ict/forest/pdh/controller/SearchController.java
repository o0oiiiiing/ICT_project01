package com.ict.forest.pdh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.Paging_pdh;
import com.ict.forest.pdh.dao.BrandVO;
import com.ict.forest.pdh.dao.KeywordVO;
import com.ict.forest.pdh.dao.PagingVO;
import com.ict.forest.pdh.dao.ProductsVO;
import com.ict.forest.pdh.dao.TypeVO;
import com.ict.forest.pdh.dao.VolumeVO;
import com.ict.forest.pdh.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	@Autowired
	private Paging_pdh paging;
	
	@PostMapping("search")
	public ModelAndView getSearchList(KeywordVO kvo, TypeVO tvo, BrandVO bvo, VolumeVO vvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("pdh-view/search_products");
			
			Map<String, String[]> map = new HashMap<String, String[]>();
			map.put("p_name", kvo.getKeyword());
			map.put("p_type", tvo.getProduct());
			map.put("p_volume", vvo.getCapacity());
			map.put("p_brand", bvo.getBrand());
			mv.addObject("map", map);
			
			
			// 페이징
			int count = searchService.getSearchCount(map);
			paging.setTotalRecord(count);
			System.out.println(count);

			// 전체 페이지 수 구하기
			if (paging.getTotalRecord() <= paging.getNumPerPage()) {
				paging.setTotalPage(1);
			} else {
				paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
				if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
					paging.setTotalPage(paging.getTotalPage() + 1);
				}
			}
			// 현재 페이지 구하기
			String cPage = request.getParameter("cPage");
			if (cPage == null) {
				paging.setNowPage(1);
			} else {
				paging.setNowPage(Integer.parseInt(cPage));
			}

			// offset 구하기
			paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

			// 시작 블록
			paging.setBeginBlock(
					(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);

			// 끝 블록
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

			// 끝 블록이 전체 페이지수보다 큰 경우 (한 블록에 n개의 페이지가 들어가야 하는데 페이지수가 그거에 못미칠 때)
			if (paging.getEndBlock() > paging.getTotalPage()) {
				// 끝 블록을 전체 페이수로 맞춘다.
				paging.setEndBlock(paging.getTotalPage());
			}
			PagingVO pagingVO = new PagingVO();
			pagingVO.setLimit(paging.getNumPerPage());
			pagingVO.setOffset(paging.getOffset());
			
			List<ProductsVO> products_list2 = searchService.getSearchList(map);
			List<ProductsVO> products_list = products_list2.subList(pagingVO.getOffset(), pagingVO.getOffset()+pagingVO.getLimit());
			System.out.println("db 이후 : "+products_list);
			if (products_list != null) {
				mv.addObject("products_list", products_list);
				mv.addObject("paging", paging);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("pdh-view/error");
	}
}
