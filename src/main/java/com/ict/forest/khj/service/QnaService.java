package com.ict.forest.khj.service;

import java.util.List;

import com.ict.forest.khj.dao.QnaReplyVO;
import com.ict.forest.khj.dao.QnaVO;

public interface QnaService {
	
	public int getTotalCount();
	public List<QnaVO> getQnaList(int offset , int limit);
	public int getQnaInsert(QnaVO qnavo);
	public QnaVO getQnaDetail(String qna_idx);
	public int getQnaReplyInsert(QnaReplyVO qnarvo);
	public int getQnaRSUpdate(String qna_idx);
}
