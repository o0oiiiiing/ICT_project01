package com.ict.forest.khj.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

public class Controller {
	
	// ������ faq �̵� �̵�
	@GetMapping("faq")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("khj-view/customer_center");
		return mv;
	}
	
	// ������qna �̵� �̵�
	@GetMapping("qna")
	public ModelAndView qna() {
		ModelAndView mv = new ModelAndView("khj-view/qna");
		return mv;
	}
	// ������qna �̵� �̵�
	@GetMapping("claim")
	public ModelAndView claim() {
		ModelAndView mv = new ModelAndView("khj-view/claim");
		return mv;
	}
	
	// ��ǰ ���������� �̵�
	@GetMapping("pay")
	public ModelAndView pay() {
		ModelAndView mv = new ModelAndView("khj-view/pay");
		return mv;
	}
	
}
