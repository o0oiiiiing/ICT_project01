package com.ict.forest.khj.service;

import java.util.List;

import com.ict.forest.khj.dao.QnaVO;

public interface QnaService {
	
	public int getTotalCount();
	public List<QnaVO> getQnaList(int offset , int limit);
	public int getQnaInsert(QnaVO qnavo);
}
