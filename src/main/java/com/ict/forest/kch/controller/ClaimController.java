package com.ict.forest.kch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.kch.dao.ClaimVO;
import com.ict.forest.kch.service.ClaimService;
import com.ict.forest.kch.service.KchService;

@Controller
public class ClaimController {

	@Autowired
	private ClaimService claimService;
	
	@Autowired
	private KchService kchService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private ClaimPaging claimPaging;
	
	@RequestMapping("claim_wr")
	public ModelAndView claimList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ex_page/claim_wr");
		
		int count = claimService.getTotalCount();
		claimPaging.setTotalRecord(count);
		// 전체페이지의 수를 구하자. 
		if(claimPaging.getTotalRecord() <= claimPaging.getNumPerPage()) {
			claimPaging.setTotalPage(1);
		}else {
			claimPaging.setTotalPage(claimPaging.getTotalRecord()/claimPaging.getNumPerPage());
			if(claimPaging.getTotalRecord()/claimPaging.getNumPerPage() != 0) {
				claimPaging.setTotalPage(claimPaging.getTotalPage()+1);
				
			}
		}
		// 현재페이지 구하기 => begin, end 구한다.
		String cPage = request.getParameter("cPage");
		// 제일 처음 들어오면 cPage가 없으므로 null 이다. 
		// 제일 처음 오면 무조건 1페이지 이다. 
		if(cPage == null) {
			claimPaging.setNowPage(1);
		}else {
			claimPaging.setNowPage(Integer.parseInt(cPage));
		}
		// 오라클은 begin, end
		// 마리아는 limit, offset 
		// offset = limit * (현재페이지 -1)
		// limit = numPerPage
		claimPaging.setOffset(claimPaging.getNumPerPage()*(claimPaging.getNowPage()-1));
		
		// 시작블록과 끝블록 구하기
		claimPaging.setBeginBlock(
				(int)(((claimPaging.getNowPage() -1) / 
						claimPaging.getPagePerBlock()) * 
						claimPaging.getPagePerBlock() +1));
		claimPaging.setEndBlock(claimPaging.getBeginBlock() + claimPaging.getPagePerBlock() -1);
		
		// 주의사항
		// endBlock 과 totalPage 중 endBlock 이 크면 endBlock를 totalPage 로 지정한다. 
		if (claimPaging.getEndBlock() > claimPaging.getTotalPage()) {
			claimPaging.setEndBlock(claimPaging.getTotalPage());
		}
		
		List<ClaimVO> claimlist = claimService.claimList(claimPaging.getOffset(), claimPaging.getNumPerPage());
		System.out.println(claimlist.size());
		mv.addObject("bbs_list", claimlist);
		mv.addObject("paging", claimPaging);
		
		return mv;		
	}
	
	
	@GetMapping("claim_wr")
	public ModelAndView claim_wr(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ex_page/claim_write");
		HttpSession session = request.getSession();
		SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
		mv.addObject("ssuvo", ssuvo);
		return mv;
	}
	
	
	@PostMapping("bbs_write_ok.do")
	public ModelAndView getBbsWriteOK(ClaimVO claimvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:bbs_list.do");
			
			String pwd = passwordEncoder.encode(claimvo.getClaim_pw());
			claimvo.setClaim_pw(pwd);
			
			int result = claimService.claimInsert(claimvo);
			if(result > 0) {
				return mv;
			}
			return new ModelAndView("pdh-view/error");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("pdh-view/error");
	}
	
	
	
	
	
}








































