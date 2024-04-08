package com.ict.forest.kch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.UserAddrVO;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.service.UserService;
import com.ict.forest.kch.dao.KchVO;
import com.ict.forest.kch.service.KchService;

@Controller
public class KchController {

	@Autowired
	private KchService kchservice;
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 회원정보수정하기 창이동
	@GetMapping("update")
	public ModelAndView getInfoUpdateOK(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("kch-view/update");
		HttpSession ssu = request.getSession();
		SessionUser ssuvo = (SessionUser) ssu.getAttribute("ssuvo");
		KchVO kvo = kchservice.kchdetail(ssuvo.getUser_idx());
		List<UserAddrVO> uaddrlist = kchservice.userAddr(ssuvo.getUser_idx());
		mv.addObject("kvo", kvo);
		mv.addObject("uaddrlist", uaddrlist);
		return mv;
	}
	// 회원정보 수정 
	
	@PostMapping("info_update_ok")
	public ModelAndView infoUpdateOK(KchVO kvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String user_pwd = kvo.getUser_pwd();
		
		KchVO kvo2 = kchservice.kchdetail(kvo.getUser_idx());
		String dpwd = kvo2.getUser_pwd();
		if (! passwordEncoder.matches(user_pwd, dpwd)) {
			mv.setViewName("kch-view/update");
			mv.addObject("pwdchk", "fail");
			mv.addObject("user_idx", kvo.getUser_idx());
			mv.addObject("kvo", kvo);
			return mv;
		}else {
			int result = kchservice.infoUpdateOK(kvo);
			if (result>0) {
				mv.setViewName("redirect:mypage?user_idx="+kvo.getUser_idx());
				return mv;
			}
		}
		
		return new ModelAndView("pdh-view/error");
	}
	
		
	
	
	// 아이디 및 비번 찾기 이동
	@GetMapping("find")
	public ModelAndView find() {
		ModelAndView mv = new ModelAndView("kch-view/find");
		return mv;
	}
	
	
	// 아이디 찾기
	 @PostMapping("find_user_id") 
	 public ModelAndView findUserId(HttpServletRequest request, KchVO kvo,
			 String user_name, String email_id) {
			ModelAndView mv = new ModelAndView("kch-view/findresult");
			KchVO kvo2 = kchservice.kchfindname(kvo.getUser_name());
			if (kvo2 != null && (email_id.equals(kvo2.getUser_f_email() + "@" + kvo2.getUser_b_email()) )) {
				HttpSession session = request.getSession();
				SessionUser ssuvo = new SessionUser();
				ssuvo.setUser_id(kvo2.getUser_id());
				session.setAttribute("ssuvo", ssuvo);
				mv.addObject("kvo2" , kvo2);
				return mv;
			}else {
				mv.addObject("chk", "fail");
				return new ModelAndView("kch-view/find");
			}
	 }
	
	 /*	 
	 @PostMapping("find_user_pw")
	 public ModelAndView findUserPw(HttpServletRequest request, KchVO kvo,
			 String user_id, String email_id) {
		 ModelAndView mv = new ModelAndView("");
		 KchVO kvo2 = kchservice.kchfindpw(kvo.getUser_id());
		 if (kvo2 != null && (email_id.equals(kvo2.getUser_f_email() + "@" + kvo2.getUser_b_email()))) {
			HttpSession session = request.getSession();
			SessionUser ssuvo = new SessionUser();
			ssuvo.setUser_id(kvo2.getUser_id());
			session.setAttribute("ssuvo", ssuvo);
			mv.addObject("kvo2", kvo2);
			return mv;
		}else {
			return new ModelAndView("kch-view/find");
		}
	 }
	 */
	 
	 
	 
	 
	 
	 
	 
	 
	 
	@GetMapping("claim_ok")
	public ModelAndView getClaimOK(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ex_page/claim_write");
		HttpSession ssu = request.getSession();
		SessionUser ssuvo = (SessionUser) ssu.getAttribute("ssuvo");
		UserVO uvo = userService.userDetail(ssuvo.getUser_idx());
		List<UserAddrVO> uaddrlist = userService.userAddr(ssuvo.getUser_idx());
		System.out.println(mv);
		mv.addObject("uvo", uvo);
		mv.addObject("uaddrlist", uaddrlist);
		return mv;
}

}












