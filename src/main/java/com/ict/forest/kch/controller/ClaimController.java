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
		// ��ü�������� ���� ������. 
		if(claimPaging.getTotalRecord() <= claimPaging.getNumPerPage()) {
			claimPaging.setTotalPage(1);
		}else {
			claimPaging.setTotalPage(claimPaging.getTotalRecord()/claimPaging.getNumPerPage());
			if(claimPaging.getTotalRecord()/claimPaging.getNumPerPage() != 0) {
				claimPaging.setTotalPage(claimPaging.getTotalPage()+1);
				
			}
		}
		// ���������� ���ϱ� => begin, end ���Ѵ�.
		String cPage = request.getParameter("cPage");
		// ���� ó�� ������ cPage�� �����Ƿ� null �̴�. 
		// ���� ó�� ���� ������ 1������ �̴�. 
		if(cPage == null) {
			claimPaging.setNowPage(1);
		}else {
			claimPaging.setNowPage(Integer.parseInt(cPage));
		}
		// ����Ŭ�� begin, end
		// �����ƴ� limit, offset 
		// offset = limit * (���������� -1)
		// limit = numPerPage
		claimPaging.setOffset(claimPaging.getNumPerPage()*(claimPaging.getNowPage()-1));
		
		// ���ۺ�ϰ� ����� ���ϱ�
		claimPaging.setBeginBlock(
				(int)(((claimPaging.getNowPage() -1) / 
						claimPaging.getPagePerBlock()) * 
						claimPaging.getPagePerBlock() +1));
		claimPaging.setEndBlock(claimPaging.getBeginBlock() + claimPaging.getPagePerBlock() -1);
		
		// ���ǻ���
		// endBlock �� totalPage �� endBlock �� ũ�� endBlock�� totalPage �� �����Ѵ�. 
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








































