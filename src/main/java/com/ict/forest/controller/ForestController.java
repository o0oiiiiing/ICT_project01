package com.ict.forest.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.Paging;
import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.service.UserService;

@Controller
public class ForestController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private Paging paging;
	
	// 첫 화면 설정 
	@RequestMapping("/")
	public ModelAndView main() {
		return new ModelAndView("pdh-view/home");
	}
	
	
	// 메인으로 이동
	@GetMapping("home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("pdh-view/home");
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
	
	// 상세 상품페이지 이동 이동
	@GetMapping("detailproduct")
	public ModelAndView detailproduct() {
		ModelAndView mv = new ModelAndView("jjh-view/detailproduct");
		return mv;
	}
	
	// 아이디 및 비번 찾기 이동
	@GetMapping("find")
	public ModelAndView find() {
		ModelAndView mv = new ModelAndView("kch-view/find");
		return mv;
	}
	
	// 회원가입 페이지 이동
	@GetMapping("join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView("kch-view/join");
		return mv;
	}
	// 회원수정 페이지 이동
	@GetMapping("update")
	public ModelAndView update() {
		ModelAndView mv = new ModelAndView("kch-view/update");
		return mv;
	}
	// 아이디찾기 결과 페이지 이동
	@GetMapping("findresult")
	public ModelAndView findresult() {
		ModelAndView mv = new ModelAndView("kch-view/findresult");
		return mv;
	}
	// 고객센터faq 이동 이동
	@GetMapping("help")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("khj-view/customer_center");
		return mv;
	}
	// 고객센터faq 이동 이동
	@GetMapping("qna")
	public ModelAndView qna() {
		ModelAndView mv = new ModelAndView("khj-view/qna");
		return mv;
	}
	
	// 상품 결제페이지 이동
	@GetMapping("pay")
	public ModelAndView pay() {
		ModelAndView mv = new ModelAndView("khj-view/pay");
		return mv;
	}
	
	
}
