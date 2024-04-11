package com.ict.forest.khj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.khj.dao.QnaDAO;
import com.ict.forest.khj.dao.QnaReplyVO;
import com.ict.forest.khj.dao.QnaVO;

@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public int getTotalCount() {
		return qnaDAO.getTotalCount();
	}
	
	@Override
	public List<QnaVO> getQnaList(int offset, int limit) {
		return qnaDAO.getQnaList(offset, limit);
	}
	
	@Override
	public int getQnaInsert(QnaVO qnavo) {
		return qnaDAO.getQnaInsert(qnavo);
	}
	
	@Override
	public QnaVO getQnaDetail(String qna_idx) {
		return qnaDAO.getQnaDetail(qna_idx);
	}
	
	@Override
	public int getQnaReplyInsert(QnaReplyVO qnarvo) {
		return qnaDAO.getQnaReplyInsert(qnarvo);
	}
	
	@Override
	public int getQnaRSUpdate(String qna_idx) {
		return qnaDAO.getQnaRSUpdate(qna_idx);
	}
}
