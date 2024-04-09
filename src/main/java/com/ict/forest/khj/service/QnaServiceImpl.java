package com.ict.forest.khj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.khj.dao.QnaDAO;
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
}
