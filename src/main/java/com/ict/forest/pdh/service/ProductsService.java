package com.ict.forest.pdh.service;

import java.util.List;

import com.ict.forest.pdh.dao.ProductsVO;

public interface ProductsService {
	// 전체 상품 가져오기
	public List<ProductsVO> getProductsList(String p_type);
}
