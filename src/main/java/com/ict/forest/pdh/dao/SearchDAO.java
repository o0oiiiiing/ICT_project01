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
	
	public List<ProductsVO> getSearchList(MapVO MapVO) {
		try {
			return sqlSessionTemplate.selectList("product_table.search_list", MapVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getSearchCount(MapVO MapVO) {
		try {
			return sqlSessionTemplate.selectOne("product_table.search_count", MapVO);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
}
