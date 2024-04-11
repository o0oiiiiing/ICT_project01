package com.ict.forest.kch.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.kch.dao.CCommentVO;
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
	
	@RequestMapping("claim")
	public ModelAndView claimList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("ex_page/claim");
		System.out.println("1111111111111111111111111111111111");
		int count = claimService.getTotalCount();
		System.out.println("ī��Ʈ : "+count);
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
		mv.addObject("claimlist", claimlist);
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
	
	
	@PostMapping("claim_ok")
	public ModelAndView getBbsWriteOK(ClaimVO claimvo, HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:claim");
			
			String pwd = passwordEncoder.encode(claimvo.getClaim_pw());
			claimvo.setClaim_pw(pwd);
			HttpSession session = request.getSession();
			SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
			String user_idx = ssuvo.getUser_idx();
			claimvo.setUser_idx(user_idx);
			claimvo.setUser_id(ssuvo.getUser_id());
			System.out.println("�����a"+claimvo.getClaim_idx());
			int result = claimService.claimInsert(claimvo);
			if(result > 0) {
				mv.addObject(user_idx);
				return mv;
			}
			return new ModelAndView("pdh-view/error");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("pdh-view/error");
	}
	/*
	@PostMapping("claim_delete")
	public ModelAndView getBbsDelete(@ModelAttribute("cPage")String cPage,
			@ModelAttribute("claim_idx")String claim_idx) {
		return new ModelAndView("ex_page/claimdelete");
	}
	
	@PostMapping("claim_delete_ok")
	public ModelAndView getBbsDeleteOK(String claim_pwd,
			@ModelAttribute("cPage")String cPage,
			@ModelAttribute("claim_idx")String claim_idx) {
		ModelAndView mv = new ModelAndView();
		// ��й�ȣ üũ
		ClaimVO claimvo = claimService.claimDetail(claim_idx);
		String dpwd = claimvo.getClaim_pw();
		
		if(! passwordEncoder.matches(claim_pwd, dpwd)) {
			mv.setViewName("ex_page/claimdelete");
			mv.addObject("pwdchk", "fail");
			return mv;
		}else {
			// ���� ���� (����� ���� ��� �׳� �����ϸ� �ܷ�Ű ������ ���� �߻�)
			// active �÷��� ���� 1�� �����Ѵ�. 
			int result = claimService.claimDelete(claim_idx);
			if(result > 0) {
				mv.setViewName("redirect:claim");
				return mv;
			}
		}
		return new ModelAndView("pdh-view/error");
		
	}
	*/
	
	@GetMapping("claim_detail")
	public ModelAndView getBbsDetail(String claim_idx, String cPage) {
		try {
			ModelAndView mv = new ModelAndView("ex_page/claim_detail");
			
			
			ClaimVO claimvo = claimService.claimDetail(claim_idx);
				// ��� ��������
				List<CCommentVO> comm_list = claimService.CommentList(claim_idx);
				mv.addObject("comm_list", comm_list);
				mv.addObject("claimvo", claimvo);
				mv.addObject("cPage", cPage);
				return mv;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("ex_page/claim_detail");
	}
	
	
	@PostMapping("commentInsert")
	public ModelAndView CommentInsert(CCommentVO ccvo, ClaimVO claimvo,
			@ModelAttribute("claim_idx")String claim_idx) {
		ModelAndView mv = new ModelAndView("redirect:claim_detail");
		claimvo.setClaim_idx(claim_idx);
		int result = claimService.CommentInsert(ccvo);
		
		return mv;
	}
	
	@PostMapping("commentDelete")
	public ModelAndView getCommentDelete(String cc_idx, @ModelAttribute("claim_idx")String claim_idx) {
		ModelAndView mv = new ModelAndView("redirect:claim_detail");
		int result = claimService.CommentDelete(cc_idx);
		return mv;
	}
	
	
	
	
}








































