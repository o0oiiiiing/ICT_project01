package com.ict.forest.khj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount() {
		try {
			return sqlSessionTemplate.selectOne("qna_table.count");
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public List<QnaVO> getQnaList(int offset, int limit) {
		try {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("offset", offset);
			map.put("limit", limit);
			
			return sqlSessionTemplate.selectList("qna_table.qna_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getQnaInsert(QnaVO qnavo) {
		try {
			return sqlSessionTemplate.insert("qna_table.qna_insert", qnavo);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public QnaVO getQnaDetail(String qna_idx) {
		try {
			
			return sqlSessionTemplate.selectOne("qna_table.qna_detail", qna_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getQnaReplyInsert(QnaReplyVO qnarvo) {
		try {
			return sqlSessionTemplate.insert("qna_table.qna_reply_insert", qnarvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int getQnaRSUpdate(String qna_idx) {
		try {
			return sqlSessionTemplate.update("qna_table.qna_rs_update", qna_idx);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
}



















