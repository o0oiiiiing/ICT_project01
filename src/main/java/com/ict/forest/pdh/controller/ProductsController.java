package com.ict.forest.pdh.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.Paging_pdh;
import com.ict.forest.jjh.dao.ProductVO;
import com.ict.forest.pdh.dao.PagingVO;
import com.ict.forest.pdh.dao.ProductsVO;
import com.ict.forest.pdh.service.ProductsService;
import com.jcraft.jsch.Session;

@Controller
public class ProductsController {
	@Autowired
	private ProductsService productsService;

	@Autowired
	private Paging_pdh paging;

	@RequestMapping("/")
	public ModelAndView start(HttpSession session) {
		List<ProductVO> recent = new ArrayList<ProductVO>();
		List<ProductVO> cart = new ArrayList<ProductVO>();
		session.setAttribute("recent", recent);
		session.setAttribute("cart", cart);
		return new ModelAndView("redirect:home");
	}

	// 페이지 홈
	@RequestMapping("home")
	public ModelAndView getBestSeller() {
		try {
			ModelAndView mv = new ModelAndView("pdh-view/home");
			List<ProductsVO> best_seller = productsService.getBestSeller();
			if (best_seller != null) {
				mv.addObject("best_seller", best_seller);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("pdh-view/error");

	}

	// 전체 상품 리스트
	@GetMapping("products_list")
	public ModelAndView getProductsList(String p_type, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("pdh-view/products");

			// 페이징
			int count = productsService.getTotalCount(p_type);
			paging.setTotalRecord(count);

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
			pagingVO.setP_type(p_type);

			List<ProductsVO> products_list = productsService.getProductsList(pagingVO);
			if (products_list != null) {
				mv.addObject("products_list", products_list);
				mv.addObject("p_type", p_type);
				mv.addObject("paging", paging);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("pdh-view/error");
	}

	// 브랜드별 상품 리스트
	@GetMapping("products_list_brand")
	public ModelAndView getProductsListBrand(String p_type, String p_brand, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("pdh-view/products");

			PagingVO pagingVO = new PagingVO();
			pagingVO.setP_type(p_type);
			pagingVO.setP_brand(p_brand);

			// 페이징
			int count = productsService.getTotalCountBrand(pagingVO);
			paging.setTotalRecord(count);

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
			pagingVO.setLimit(paging.getNumPerPage());
			pagingVO.setOffset(paging.getOffset());

			List<ProductsVO> products_list = productsService.getProductsListBrand(pagingVO);
			if (products_list != null) {
				mv.addObject("products_list", products_list);
				mv.addObject("p_type", p_type);
				mv.addObject("p_brand", p_brand);
				mv.addObject("paging", paging);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("pdh-view/error");
	}
}
