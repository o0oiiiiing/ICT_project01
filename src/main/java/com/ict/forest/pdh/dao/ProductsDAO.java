package com.ict.forest.pdh.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductsDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductsVO> getProductsList(String p_type) {
		return sqlSessionTemplate.selectList("product_table.products_list", p_type);
	}
}
