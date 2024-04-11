package com.ict.forest.jjh.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.BuyListVO;
import com.ict.forest.jjh.dao.BuyVO;
import com.ict.forest.jjh.dao.ProductVO;
import com.ict.forest.jjh.dao.ReviewVO;
import com.ict.forest.jjh.dao.UserAddrVO;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.dao.WishVO;
import com.ict.forest.jjh.service.UserService;
import com.ict.forest.khj.dao.PayVO;
import com.jcraft.jsch.Session;

@Controller
public class UserController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private UserService userService;
	
	@PostMapping("join_ok")
	public ModelAndView joinOK(HttpServletRequest request, UserVO uvo, UserAddrVO uavo) {
		ModelAndView mv = new ModelAndView("redirect:home");
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
		ModelAndView mv = new ModelAndView("redirect:home");
		UserVO uvo2 = userService.userLogin(uvo.getUser_id());
		if (uvo2 != null && passwordEncoder.matches(uvo.getUser_pwd(), uvo2.getUser_pwd())) {
			// 배송 완료 날짜 처리
			List<PayVO> list_pvo = userService.order_list(uvo2.getUser_idx());
			if (list_pvo != null) {
				for (PayVO k : list_pvo) {
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
					
					LocalDateTime dbtime = LocalDateTime.parse(k.getDelivery_start(), formatter);
					LocalDateTime dbtime2 = dbtime.plusHours(9);
					LocalDateTime systime = LocalDateTime.now();
					long diffmin = ChronoUnit.MINUTES.between(dbtime2, systime);
					if (diffmin > 3) {
						String delivery_end = dbtime.plusHours(3).toString();
						int res = userService.complitedil(uvo2.getUser_idx(), k.getOrder_idx(), delivery_end);
					}
					
				}
			}
			
			// user정보 session저장
			HttpSession session = request.getSession();
			SessionUser ssuvo = new SessionUser();
			ssuvo.setLogin("true");
			ssuvo.setUser_type(uvo2.getUser_type());
			ssuvo.setUser_idx(uvo2.getUser_idx());
			ssuvo.setUser_id(uvo2.getUser_id());
			ssuvo.setUser_name(uvo2.getUser_name());
			session.setAttribute("ssuvo", ssuvo);
			return mv;
		}else {
			mv.addObject("login_false", "false");
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
	@RequestMapping("popup_go")
	public ModelAndView popup_go() {
		ModelAndView mv = new ModelAndView("jjh-view/popup");
		return mv;
	}
	@GetMapping("order")
	public ModelAndView order(HttpSession session) {
		ModelAndView mv = new ModelAndView("jjh-view/order_page");
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		List<PayVO> order_list = userService.order_list(ssuvo.getUser_idx());
		mv.addObject("order_list", order_list);
		return mv;
	}
	
	@GetMapping("buy_chk")
	public ModelAndView buy_chk(String order_idx) {
		ModelAndView mv = new ModelAndView("redirect:order");
		System.out.println("idx : "+ order_idx);
		int res = userService.update_buy_chk(order_idx);
		System.out.println("res : "+ res);
		if (res > 0) {
			return mv;
		}
		return new ModelAndView("common/error");
	}
	@GetMapping("buy_list")
	public ModelAndView buy_list(HttpSession session) {
		ModelAndView mv = new ModelAndView("jjh-view/buy_page");
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		List<BuyListVO> buy_list =userService.buy_list(ssuvo.getUser_idx());
		mv.addObject("buy_list", buy_list);
		return mv;
		
	}
	@PostMapping("review_insert")
	public ModelAndView review_insert(HttpSession session, HttpServletRequest request, ReviewVO revo) {
		System.out.println("1");
		try {
			ModelAndView mv = new ModelAndView("redirect:buy_list");
			String path = request.getSession().getServletContext().getRealPath("resources/review");
			MultipartFile file = revo.getReview_p_img();
			System.out.println(revo.getUser_id());
			SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
			if (file.isEmpty()) {
				revo.setReview_img("");
			}else {
				System.out.println("1");
				// 파일 이름 지정
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString()+"_"+file.getOriginalFilename();
				revo.setReview_img(f_name);
				// 파일 업로드(복사)
				byte[] in = file.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
			}
			revo.setUser_idx(ssuvo.getUser_idx());
			int res = userService.review_insert(revo);
			System.out.println("res : "+res);
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("common/error");
	}
	
}
