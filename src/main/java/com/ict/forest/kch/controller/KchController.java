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
import com.ict.forest.khj.dao.QnaVO;

@Controller
public class KchController {

	@Autowired
	private KchService kchservice;
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 고객센터 faq 이동 이동
	@GetMapping("faq")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("kch-view/customer_center");
		return mv;
	}
	
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
	
	// 비밀번호 변경창으로 이동
	@GetMapping("update_pwd")
	public ModelAndView updataPwd() {
		return new ModelAndView("kch-view/pwdupdate"); 
	}
	
	// 비밀번호 변경 컨트롤러
	@PostMapping("update_pwd_ok")
	public ModelAndView updataPwdOk(HttpSession session, KchVO kvo) {
		ModelAndView mv = new ModelAndView("redirect:home");
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		kvo.setUser_idx(ssuvo.getUser_idx());
		kvo.setUser_pwd(passwordEncoder.encode(kvo.getUser_pwd()));
		int res = kchservice.expwdUpdate(kvo);
		session.removeAttribute("ssuvo");
		return mv;
		
	}
	
	
	// 아이디 및 비번 찾기 이동
	@GetMapping("find")
	public ModelAndView find() {
		ModelAndView mv = new ModelAndView("kch-view/find");
		return mv;
	}
		 
	 
	

}










