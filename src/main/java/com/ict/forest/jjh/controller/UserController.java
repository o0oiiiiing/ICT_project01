package com.ict.forest.jjh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.UserAddrVO;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.service.UserService;
import com.jcraft.jsch.Session;

@Controller
public class UserController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private UserService userService;
	
	@PostMapping("join_ok")
	public ModelAndView joinOK(UserVO uvo, UserAddrVO uavo) {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		uvo.setUser_pwd(passwordEncoder.encode(uvo.getUser_pwd()));
		try {
			int res1 = userService.userJoin(uvo);
			int res2 = userService.userJoinAddr(uavo);
			if (res1 > 0 || res2 > 0) {
				mv.addObject("join_ok", "true");
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("common/error");
	}
	
	@PostMapping("login")
	public ModelAndView login(HttpServletRequest request, UserVO uvo) {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		UserVO uvo2 = userService.userLogin(uvo.getUser_id());
		if (uvo2 != null && passwordEncoder.matches(uvo.getUser_pwd(), uvo2.getUser_pwd())) {
			HttpSession session = request.getSession();
			SessionUser ssuvo = new SessionUser();
			ssuvo.setLogin("true");
			ssuvo.setUser_type(uvo2.getUser_type());
			ssuvo.setUser_idx(uvo2.getUser_idx());
			ssuvo.setUser_id(uvo2.getUser_id());
			session.setAttribute("ssuvo", ssuvo);
			return mv;
		}else {
			request.setAttribute("login_false", "false");
			System.out.println(request.getAttribute("login_false"));
			return mv;
		}
	}
	
	// 마이페이지 이동
	@GetMapping("mypage")
	public ModelAndView mypage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("jjh-view/mypage");
		HttpSession session = request.getSession();
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		UserVO uvo = userService.userDetail(ssuvo.getUser_idx());
		List<UserAddrVO> uaddrlist = userService.userAddr(ssuvo.getUser_idx());
		mv.addObject("uvo", uvo);
		mv.addObject("uaddrlist", uaddrlist);
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		HttpSession session = request.getSession();
		session.removeAttribute("ssuvo");
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
	
	// 회원가입 페이지 이동
	@GetMapping("join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView("kch-view/join");
		return mv;
	}
	
}
