package com.ict.forest.pdh.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.pdh.dao.ProductsVO;
import com.ict.forest.pdh.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService{
	@Autowired
	private SearchDAO searchDAO;
	
	@Override
	public List<ProductsVO> getSearchList(Map<String, String[]> map) {
		return searchDAO.getSearchList(map);
	}

}
