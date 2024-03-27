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
	
	// �˻�â �̵�
	@GetMapping("search")
	public ModelAndView seach() {
		ModelAndView mv = new ModelAndView("pdh-view/search");
		return mv;
	}
	
	// ��ü ��ǰ������ �̵� �̵�
	@GetMapping("products")
	public ModelAndView products() {
		ModelAndView mv = new ModelAndView("pdh-view/products");
		return mv;
	}
	
	// ��ٱ��� �̵�
	@GetMapping("cart")
	public ModelAndView cart() {
		ModelAndView mv = new ModelAndView("jjh-view/cart");
		return mv;
	}
	
	// ���ø���Ʈ �̵�
	@GetMapping("wish")
	public ModelAndView wish() {
		ModelAndView mv = new ModelAndView("jjh-view/wish");
		return mv;
	}
	
	// ���������� �̵�
	@GetMapping("mypage")
	public ModelAndView mypage() {
		ModelAndView mv = new ModelAndView("jjh-view/mypage");
		return mv;
	}
	
	// �� ��ǰ������ �̵� �̵�
	@GetMapping("detailproduct")
	public ModelAndView detailproduct() {
		ModelAndView mv = new ModelAndView("jjh-view/detailproduct");
		return mv;
	}
	
	// �� ��ǰ������ �̵� �̵�
	@GetMapping("login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("kch-view/login");
		return mv;
	}
	
	// �� ��ǰ������ �̵� �̵�
	@GetMapping("find")
	public ModelAndView find() {
		ModelAndView mv = new ModelAndView("kch-view/find");
		return mv;
	}
	
	// �� ��ǰ������ �̵� �̵�
	@GetMapping("join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView("kch-view/join");
		return mv;
	}
	// �� ��ǰ������ �̵� �̵�
	@GetMapping("update")
	public ModelAndView update() {
		ModelAndView mv = new ModelAndView("kch-view/update");
		return mv;
	}
	// �� ��ǰ������ �̵� �̵�
	@GetMapping("help")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("khj-view/customer_center");
		return mv;
	}
	
	// �� ��ǰ������ �̵� �̵�
	@GetMapping("pay")
	public ModelAndView pay() {
		ModelAndView mv = new ModelAndView("khj-view/pay01");
		return mv;
	}
	
	
}
