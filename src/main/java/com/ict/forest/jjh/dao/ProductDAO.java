package com.ict.forest.jjh.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int productInsert(ProductVO pvo) {
		try {
			return sqlSessionTemplate.insert("product_table.p_insert", pvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int productImgInsert(ProductImgVO pivo) {
		try {
			return sqlSessionTemplate.insert("product_table.p_img_insert", pivo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
}
