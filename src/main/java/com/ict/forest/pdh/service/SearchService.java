package com.ict.forest.pdh.service;

import java.util.List;
import java.util.Map;

import com.ict.forest.pdh.dao.ProductsVO;

public interface SearchService {
	public List<ProductsVO> getSearchList(Map<String, String[]> map);
}
