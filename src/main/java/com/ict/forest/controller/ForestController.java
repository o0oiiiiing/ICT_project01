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
	
	// ù ȭ�� ���� 
	@RequestMapping("/")
	public ModelAndView main() {
		return new ModelAndView("pdh-view/home");
	}
	
	
	// �������� �̵�
	@GetMapping("home")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("pdh-view/home");
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
	
	// �� ��ǰ������ �̵� �̵�
	@GetMapping("detailproduct")
	public ModelAndView detailproduct() {
		ModelAndView mv = new ModelAndView("jjh-view/detailproduct");
		return mv;
	}
	
	// ���̵� �� ��� ã�� �̵�
	@GetMapping("find")
	public ModelAndView find() {
		ModelAndView mv = new ModelAndView("kch-view/find");
		return mv;
	}
	
	// ȸ������ ������ �̵�
	@GetMapping("join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView("kch-view/join");
		return mv;
	}
	// ȸ������ ������ �̵�
	@GetMapping("update")
	public ModelAndView update() {
		ModelAndView mv = new ModelAndView("kch-view/update");
		return mv;
	}
	// ���̵�ã�� ��� ������ �̵�
	@GetMapping("findresult")
	public ModelAndView findresult() {
		ModelAndView mv = new ModelAndView("kch-view/findresult");
		return mv;
	}
	// ������faq �̵� �̵�
	@GetMapping("help")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("khj-view/customer_center");
		return mv;
	}
	// ������faq �̵� �̵�
	@GetMapping("qna")
	public ModelAndView qna() {
		ModelAndView mv = new ModelAndView("khj-view/qna");
		return mv;
	}
	
	// ��ǰ ���������� �̵�
	@GetMapping("pay")
	public ModelAndView pay() {
		ModelAndView mv = new ModelAndView("khj-view/pay");
		return mv;
	}
	
	
}
