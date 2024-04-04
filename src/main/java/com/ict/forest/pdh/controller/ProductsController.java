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
		List<String> recent = new ArrayList<String>();
		List<String> cart = new ArrayList<String>();
		session.setAttribute("recent", recent);
		session.setAttribute("cart", cart);
		return new ModelAndView("redirect:home"); 
	}
	
	@RequestMapping("home")
	public ModelAndView home() {
		return new ModelAndView("pdh-view/home");
	}
	
	@GetMapping("products_list")
	public ModelAndView getProductsList(String p_type, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("pdh-view/products");
			
			// ����¡
			int count = productsService.getTotalCount(p_type);
			paging.setTotalRecord(count);
			
			// ��ü ������ �� ���ϱ�
			if (paging.getTotalRecord() <= paging.getNumPerPage()) {
				paging.setTotalPage(1);
			} else {
				paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
				if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
					paging.setTotalPage(paging.getTotalPage() + 1);
				}
			}
			// ���� ������ ���ϱ�
			String cPage = request.getParameter("cPage");
			if (cPage == null) {
				paging.setNowPage(1);
			} else {
				paging.setNowPage(Integer.parseInt(cPage));
			}
			
			// offset ���ϱ�
			paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

			// ���� ���
			paging.setBeginBlock(
					(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);
			
			// �� ���
			paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

			// �� ����� ��ü ������������ ū ��� (�� ��Ͽ� n���� �������� ���� �ϴµ� ���������� �װſ� ����ĥ ��)
			if (paging.getEndBlock() > paging.getTotalPage()) {
				// �� ����� ��ü ���̼��� �����.
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
}
