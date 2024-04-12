package com.ict.forest.khj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.service.UserService;
import com.ict.forest.khj.dao.PagingKhj;
import com.ict.forest.khj.dao.QnaReplyVO;
import com.ict.forest.khj.dao.QnaVO;
import com.ict.forest.khj.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private PagingKhj pagingKhj;
	@Autowired
	private UserService userService;
	
	@GetMapping("qna")
	public ModelAndView getQnaList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("khj-view/qna");
		
		// 페이징 
		// 전체 게시물의 수
		int count = qnaService.getTotalCount();
		System.out.println("총 게시물 수 : " + count);
		pagingKhj.setTotalRecord(count);
		
		// 전체 페이지의 수
				if (pagingKhj.getTotalRecord() <= pagingKhj.getNumPerPage()) {
					pagingKhj.setTotalPage(1);
				} else {
					pagingKhj.setTotalPage(pagingKhj.getTotalRecord() / pagingKhj.getNumPerPage());
					if (pagingKhj.getTotalRecord() % pagingKhj.getNumPerPage() != 0) {
						pagingKhj.setTotalPage(pagingKhj.getTotalPage() + 1);
					}
				}

				// 현재 페이지 구함
				String cPage = request.getParameter("cPage");
				if (cPage == null) {
					pagingKhj.setNowPage(1);
				} else {
					pagingKhj.setNowPage(Integer.parseInt(cPage));
				}

				// begin, end 구하기 (Oracle)
				// offset 구하기
				// offset = limit * (현재페이지-1);
				pagingKhj.setOffset(pagingKhj.getNumPerPage() * (pagingKhj.getNowPage() - 1));

				// 시작 블록 // 끝블록
				pagingKhj.setBeginBlock(
						(int) ((pagingKhj.getNowPage() - 1) / pagingKhj.getPagePerBlock()) * pagingKhj.getPagePerBlock() + 1);
				pagingKhj.setEndBlock(pagingKhj.getBeginBlock() + pagingKhj.getPagePerBlock() - 1);

				if (pagingKhj.getEndBlock() > pagingKhj.getTotalPage()) {
					pagingKhj.setEndBlock(pagingKhj.getTotalPage());
				}
			List<QnaVO> qna_list = qnaService.getQnaList(pagingKhj.getOffset(), pagingKhj.getNumPerPage());
			System.out.println("list"+qna_list.size());
			mv.addObject("qna_list", qna_list);
			mv.addObject("paging", pagingKhj);
			
			return mv;
	}
	
	@GetMapping("qna_write")
	public ModelAndView getQnaWrite(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("khj-view/qna_write");
		return mv;
	}
	
	@PostMapping("qna_write_ok")
	public ModelAndView getQnaWriteOK(QnaVO qnavo,HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:qna");
			HttpSession session = request.getSession();
			SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
			qnavo.setUser_idx(ssuvo.getUser_idx());
			UserVO uvo = userService.userDetail(ssuvo.getUser_idx());
			qnavo.setUser_pwd(uvo.getUser_pwd());
			qnavo.setUser_type(ssuvo.getUser_type());
			int result = qnaService.getQnaInsert(qnavo);
			if(result > 0) {
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("khj-view/error");
	}
	
	@GetMapping("qna_reply_write")
	public ModelAndView getQnaReplyWrite(String qna_idx, HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("khj-view/qna_reply_write");
			QnaVO qnavo = qnaService.getQnaDetail(qna_idx);
			mv.addObject("qna_idx", qna_idx);
			mv.addObject("qnavo", qnavo);
			return mv;
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("khj-view/error");
		
	}
	
	@PostMapping("qna_reply_write_ok")
	public ModelAndView getQnaReplyInsert(QnaReplyVO qnarvo, HttpSession session) {
		try {
			ModelAndView mv = new ModelAndView("redirect:qna");
			SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
			qnarvo.setUser_idx(ssuvo.getUser_idx());
			int result = qnaService.getQnaReplyInsert(qnarvo);
			int result2 = qnaService.getQnaRSUpdate(qnarvo.getQna_idx()); 
			return mv;
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("khj-view/error");
	}
}























