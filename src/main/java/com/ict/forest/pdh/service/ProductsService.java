package com.ict.forest.pdh.service;

import java.util.List;

import com.ict.forest.pdh.dao.PagingVO;
import com.ict.forest.pdh.dao.ProductsVO;

public interface ProductsService {
	// 전체 수 count
	public int getTotalCount(String p_type);
	
	// 전체 상품 리스트
	public List<ProductsVO> getProductsList(PagingVO pagingVO);
}
