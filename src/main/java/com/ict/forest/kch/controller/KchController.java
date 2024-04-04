package com.ict.forest.kch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@GetMapping("update")
	public ModelAndView getInfoUpdateOK(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("kch-view/update");
		HttpSession ssu = request.getSession();
		SessionUser ssuvo = (SessionUser) ssu.getAttribute("ssuvo");
		UserVO uvo = userService.userDetail(ssuvo.getUser_idx());
		List<UserAddrVO> uaddrlist = userService.userAddr(ssuvo.getUser_idx());
		System.out.println(mv);
		mv.addObject("uvo", uvo);
		mv.addObject("uaddrlist", uaddrlist);
		return mv;
	}
	
	// 아이디 및 비번 찾기 이동
	@GetMapping("find")
	public ModelAndView find() {
		ModelAndView mv = new ModelAndView("kch-view/find");
		return mv;
	}
	
	
	
	 @PostMapping("find_user_id") 
	 public ModelAndView findUserId(@RequestParam("name_id")String name_id,
			 @RequestParam("email_id")String email_id, UserVO uvo
			 ) {
		 //System.out.println(name_id);
		 //System.out.println(email_id);
		 ModelAndView mv = new ModelAndView("kch-view/findresult");
		 String dname = "";
		 String demail = "";
		 uvo.setUser_f_email(demail);
		 System.out.println(dname);
		 if (name_id == dname && email_id == demail) {
			mv.addObject("uvo", uvo);
			 return mv; 
		}
		 return new ModelAndView("pdh-view/error");
	 }
	 
	/*
	@PostMapping("find_user_id") 
	public ModelAndView findUserId(HttpServletRequest request, KchVO kvo) {
		ModelAndView mv = new ModelAndView("kch-view/findresult");
		
		return mv;
		
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












