package com.ict.forest.jjh.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int productInsert(SellerProductVO spvo) {
		return -1;
	}

	public int productImgInsert(SellerProductImgVO spivo) {
		return -1;
	}
	
}
