package com.ict.forest.pdh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductsDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int getTotalCount(String p_type) {
		try {
			return sqlSessionTemplate.selectOne("product_table.total_count", p_type);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public List<ProductsVO> getProductsList(PagingVO pagingVO) {
		try {
			return sqlSessionTemplate.selectList("product_table.products_list", pagingVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
