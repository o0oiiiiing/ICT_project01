package com.ict.forest.jjh.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.ProductVO;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.dao.WishVO;
import com.ict.forest.jjh.service.ProductService;
import com.ict.forest.jjh.service.UserService;

@RestController
public class AjaxController {
	@Autowired
	private ProductService productService;
	@Autowired UserService userService;
	
	// 장바구니 추가
	@RequestMapping(value = "cartAjax", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String cartAdd(HttpSession session, String p_idx) {
		ProductVO pvo = productService.productdetail(p_idx);
		List<ProductVO> cart = (List<ProductVO>) session.getAttribute("cart");
		cart.add(pvo);
		session.setAttribute("cart", cart);
		System.out.println(p_idx);
		System.out.println(cart);
		String count = String.valueOf(cart.size());
		return count;
	}
	// 장바구니 제거
	@RequestMapping(value = "cartDelAjax", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String cartDelAjax(HttpServletRequest request, HttpSession session, String p_idx) {
		List<ProductVO> cart = (List<ProductVO>) session.getAttribute("cart");
		List<ProductVO> cart2 = cart.stream().filter(x->!x.getP_idx().equals(p_idx)).collect(Collectors.toList());
		session.setAttribute("cart", cart2);
		String count = String.valueOf(cart2.size());
		return count;
	}
	
	// 위시리스트 추가
	@RequestMapping(value = "wishAddAjax", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String wishAdd(HttpSession session, String p_idx) {
		ProductVO pvo = productService.productdetail(p_idx);
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		WishVO wvo = new WishVO();
		wvo.setP_idx(pvo.getP_idx());
		wvo.setUser_idx(ssuvo.getUser_idx());
		wvo.setP_name(pvo.getP_name());
		wvo.setP_brand(pvo.getP_brand());
		wvo.setP_volume(pvo.getP_volume());
		wvo.setP_price(pvo.getP_price());
		wvo.setP_main_img(pvo.getP_main_img());
		int res = userService.wishInsert(wvo);
		if (res > 0) {
			return "success";
		}

		return null;
	}
	// 위시리스트 제거
	@RequestMapping(value = "wishDelAjax", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String wishDelAjax(HttpServletRequest request, HttpSession session, String p_idx) {
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		int res = userService.wishDelete(ssuvo.getUser_idx(), p_idx);
		if (res > 0) {
			return "success";
		}
		return null;
	}
	
	@RequestMapping(value = "point", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public String point(HttpSession session, UserVO uvo) {
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		uvo.setUser_idx(ssuvo.getUser_idx());
		int res = userService.pointPlus(uvo);
		return "success";
	}
}
