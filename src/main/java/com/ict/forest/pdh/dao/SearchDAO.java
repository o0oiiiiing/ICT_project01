package com.ict.forest.pdh.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ProductsVO> getSearchList(Map<String, String[]> map) {
		try {
			return sqlSessionTemplate.selectList("product_table.search_list", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getSearchCount(Map<String, String[]> map) {
		try {
			return sqlSessionTemplate.selectOne("product_table.search_count", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
}
