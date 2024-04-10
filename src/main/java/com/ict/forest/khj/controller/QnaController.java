package com.ict.forest.khj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.khj.dao.PagingKhj;
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
	
	@GetMapping("qna_list")
	public ModelAndView getQnaList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("khj-view/qna");
		
		// 페이징 
		// 전체 게시물의 수
		int count = qnaService.getTotalCount();
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
		
		return mv;
	}
	
	@GetMapping("qna_write")
	public ModelAndView getQnaWrite(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("khj-view/qna_write");
		System.out.println(request.getSession().getAttribute("user_idx"));
		
	}
}























