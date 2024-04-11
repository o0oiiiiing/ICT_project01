package com.ict.forest.pdh.service;

import java.util.List;

import com.ict.forest.pdh.dao.MapVO;
import com.ict.forest.pdh.dao.ProductsVO;

public interface SearchService {
	public List<ProductsVO> getSearchList(MapVO MapVO);
	
	public int getSearchCount(MapVO MapVO);
}
