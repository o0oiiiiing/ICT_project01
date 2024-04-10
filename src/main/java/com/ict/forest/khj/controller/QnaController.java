package com.ict.forest.khj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
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
		
		// ����¡ 
		// ��ü �Խù��� ��
		int count = qnaService.getTotalCount();
		pagingKhj.setTotalRecord(count);
		
		// ��ü �������� ��
				if (pagingKhj.getTotalRecord() <= pagingKhj.getNumPerPage()) {
					pagingKhj.setTotalPage(1);
				} else {
					pagingKhj.setTotalPage(pagingKhj.getTotalRecord() / pagingKhj.getNumPerPage());
					if (pagingKhj.getTotalRecord() % pagingKhj.getNumPerPage() != 0) {
						pagingKhj.setTotalPage(pagingKhj.getTotalPage() + 1);
					}
				}

				// ���� ������ ����
				String cPage = request.getParameter("cPage");
				if (cPage == null) {
					pagingKhj.setNowPage(1);
				} else {
					pagingKhj.setNowPage(Integer.parseInt(cPage));
				}

				// begin, end ���ϱ� (Oracle)
				// offset ���ϱ�
				// offset = limit * (����������-1);
				pagingKhj.setOffset(pagingKhj.getNumPerPage() * (pagingKhj.getNowPage() - 1));

				// ���� ��� // �����
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
		HttpSession session = request.getSession();
		 SessionUser suvo = (SessionUser) session.getAttribute("ssuvo"); 
		 
		 
		 QnaVO qnavo = new QnaVO();
		 qnavo.setQna_idx(suvo.getUser_idx());
		 qnavo.setUser_id(suvo.getUser_id());
		 qnavo.setUser_type(suvo.getUser_type());
		 
		 mv.addObject("suvo", suvo);
		 if(suvo.getUser_type().equalsIgnoreCase("0")) {
			 mv.addObject("qnavo", qnavo);
			 return mv;
		 }else {
			 System.out.println("�Ϲ� ������ �ƴմϴ�. qna ���� �۾���� �Ϲ� ������ �̿��� �� �ֽ��ϴ�.");
			 return new ModelAndView("khj-view/error");
		 }
		
	}
	
	@PostMapping("qna_write_ok")
	public ModelAndView getQnaWriteOK(QnaVO qnavo,HttpServletRequest request) {
		try {
			ModelAndView mv = new ModelAndView("redirect:qna_list");
			HttpSession session = request.getSession();
			SessionUser suvo = (SessionUser) session.getAttribute("ssuvo");
			qnavo.setUser_idx(suvo.getUser_idx());
			qnavo.setUser_type(suvo.getUser_type());
			
			
			String qna_pw = passwordEncoder.encode(qnavo.getQna_pw());
			if(qna_pw != null) {
				qnavo.setQna_pw(qna_pw);
				
			}
			int result = qnaService.getQnaInsert(qnavo);
			if(result > 0) {
				return mv;
			}
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("khj-view/error");
	}
}























