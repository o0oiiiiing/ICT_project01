package com.ict.forest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ForestController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/")
	public ModelAndView main() {
		return new ModelAndView("pdh-view/home");
	}
	
	// 검색창 이동
	@GetMapping("search")
	public ModelAndView seach() {
		ModelAndView mv = new ModelAndView("pdh-view/search");
		return mv;
	}
	
	// 전체 상품페이지 이동 이동
	@GetMapping("products")
	public ModelAndView products() {
		ModelAndView mv = new ModelAndView("pdh-view/products");
		return mv;
	}
	
	// 장바구니 이동
	@GetMapping("cart")
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView("jjh-view/cart");
		return mv;
	}
	
	// 위시리스트 이동
	@GetMapping("wish")
	public ModelAndView wish() {
		ModelAndView mv = new ModelAndView("jjh-view/wish");
		return mv;
	}
	
	// 마이페이지 이동
	@GetMapping("mypage")
	public ModelAndView mypage() {
		ModelAndView mv = new ModelAndView("jjh-view/mypage");
		return mv;
	}
	
	// 상세 상품페이지 이동 이동
	@GetMapping("detailproduct")
	public ModelAndView detailproduct() {
		ModelAndView mv = new ModelAndView("jjh-view/detailproduct");
		return mv;
	}
	
	// 상세 상품페이지 이동 이동
	@GetMapping("login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("kch-view/login");
		return mv;
	}
	
	// 상세 상품페이지 이동 이동
	@GetMapping("find")
	public ModelAndView find() {
		ModelAndView mv = new ModelAndView("kch-view/find");
		return mv;
	}
	
	// 상세 상품페이지 이동 이동
	@GetMapping("join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView("kch-view/join");
		return mv;
	}
	// 상세 상품페이지 이동 이동
	@GetMapping("update")
	public ModelAndView update() {
		ModelAndView mv = new ModelAndView("kch-view/update");
		return mv;
	}
	// 상세 상품페이지 이동 이동
	@GetMapping("help")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("khj-view/customer_center");
		return mv;
	}
	
	// 상세 상품페이지 이동 이동
	@GetMapping("pay")
	public ModelAndView pay() {
		ModelAndView mv = new ModelAndView("khj-view/pay01");
		return mv;
	}
	
	
}
