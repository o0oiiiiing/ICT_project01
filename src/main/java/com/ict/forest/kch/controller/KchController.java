package com.ict.forest.kch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		
	
	@PostMapping("find_user_id")
	public ModelAndView findUserId() {
		
		return new ModelAndView("findresult");
	}
}














