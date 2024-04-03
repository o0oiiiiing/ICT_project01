package com.ict.forest.khj.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

public class Controller {
	
	// 고객센터 faq 이동 이동
	@GetMapping("faq")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("khj-view/customer_center");
		return mv;
	}
	
	// 고객센터qna 이동 이동
	@GetMapping("qna")
	public ModelAndView qna() {
		ModelAndView mv = new ModelAndView("khj-view/qna");
		return mv;
	}
	// 고객센터qna 이동 이동
	@GetMapping("claim")
	public ModelAndView claim() {
		ModelAndView mv = new ModelAndView("khj-view/claim");
		return mv;
	}
	
	// 상품 결제페이지 이동
	@GetMapping("pay")
	public ModelAndView pay() {
		ModelAndView mv = new ModelAndView("khj-view/pay");
		return mv;
	}
	
}
