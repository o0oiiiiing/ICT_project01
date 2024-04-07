package com.ict.forest.jjh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.BuyVO;
import com.ict.forest.jjh.dao.ProductVO;
import com.ict.forest.jjh.dao.UserAddrVO;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.dao.WishVO;
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
	public ModelAndView cart(HttpSession session) {
		ModelAndView mv = new ModelAndView("jjh-view/cart");
		// cart 유무 처리
		return mv;
	}
	
	// 위시리스트 이동
	@GetMapping("wish")
	public ModelAndView wish(HttpSession session) {
		ModelAndView mv = new ModelAndView("jjh-view/wish");
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		List<WishVO> list_wvo = userService.wishList(ssuvo.getUser_idx());
		List<ProductVO> cart = (List<ProductVO>) session.getAttribute("cart");
		for (WishVO j : list_wvo) {
			for (ProductVO k : cart) {
				if (j.getP_idx().equals(k.getP_idx())) {
					System.out.println("위시 안에 idx"+j.getP_idx());
					System.out.println("카트 안에 idx"+k.getP_idx());
					System.out.println("----------------");
					j.setCart_status("1");
				}
			}
		}
		mv.addObject("list_wvo", list_wvo);
		return mv;
	}
	
	// 회원가입 페이지 이동
	@GetMapping("join")
	public ModelAndView join() {
		ModelAndView mv = new ModelAndView("kch-view/join");
		return mv;
	}
	@GetMapping("addrplus")
	public ModelAndView addrAdd() {
		ModelAndView mv = new ModelAndView("jjh-view/addrplus");
		return mv;
	}
	@PostMapping("addrAdd")
	public ModelAndView addrAdd(HttpSession session, UserAddrVO uavo) {
		ModelAndView mv = new ModelAndView("redirect:mypage");
		SessionUser ssuvo =  (SessionUser) session.getAttribute("ssuvo");
		System.out.println(ssuvo.getUser_idx());
		System.out.println(uavo.getMain_addr());
		
		if (uavo.getAddr_type() != null) {
			int res = userService.addrTypeChange(ssuvo.getUser_idx());
			System.out.println(res);
			uavo.setUser_idx(ssuvo.getUser_idx());
			int res2 = userService.userAddrAdd(uavo);
			System.out.println(res2);
		}else {
			uavo.setUser_idx(ssuvo.getUser_idx());
			uavo.setAddr_type("0");
			int res3 = userService.userAddrAdd(uavo);
		}
		return mv;
	}
	@RequestMapping("point_go")
	public ModelAndView point_go() {
		ModelAndView mv = new ModelAndView("jjh-view/point");
		return mv;
	}

	/*
	 * @PostMapping("point") public ModelAndView point(HttpSession session, UserVO
	 * uvo, String backpage) { ModelAndView mv = new
	 * ModelAndView("redirect:"+backpage); SessionUser ssuvo = (SessionUser)
	 * session.getAttribute("ssuvo"); uvo.setUser_idx(ssuvo.getUser_idx()); int res
	 * = userService.pointPlus(uvo); return mv; }
	 */
	@PostMapping("test")
	public ModelAndView test(BuyVO bvo) {
		ModelAndView mv = new ModelAndView("kch-view/join");
		for (String k : bvo.getP_idx()) {
			System.out.println(k);
		}
		
		return mv;
	}
	
}
