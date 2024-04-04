package com.ict.forest.jjh.dao;

import java.util.List;

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

	public int productImgInsert(ProductSubImgVO pivo) {
		try {
			return sqlSessionTemplate.insert("product_table.p_sub_img_insert", pivo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public ProductVO productdetail(String p_idx) {
		try {
			return sqlSessionTemplate.selectOne("product_table.p_detail", p_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public List<ProductSubImgVO> productSubImgList(String p_idx) {
		try {
			return sqlSessionTemplate.selectList("product_table.p_sub_img_list",p_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public List<ReviewVO> productReviewList(String p_idx) {
		try {
			return sqlSessionTemplate.selectList("product_table.review_list", p_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	
}
