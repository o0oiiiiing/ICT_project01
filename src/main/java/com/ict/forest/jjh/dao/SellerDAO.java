package com.ict.forest.jjh.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int productInsert(SellerProductVO spvo) {
		try {
			return sqlSessionTemplate.insert("product_table.p_insert", spvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int productImgInsert(SellerProductImgVO spivo) {
		try {
			return sqlSessionTemplate.insert("product_table.p_img_insert", spivo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
}
