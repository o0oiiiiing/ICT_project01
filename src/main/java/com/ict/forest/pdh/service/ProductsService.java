package com.ict.forest.pdh.service;

import java.util.List;

import com.ict.forest.pdh.dao.PagingVO;
import com.ict.forest.pdh.dao.ProductsVO;

public interface ProductsService {
	// 전체 상품 수 count
	public int getTotalCount(String p_type);
	
	// 브랜드별 상품 수 count
	public int getTotalCountBrand(PagingVO pagingVO);
	
	// 전체 상품 리스트
	public List<ProductsVO> getProductsList(PagingVO pagingVO);
	
	// 브랜드별 상품 리스트
	public List<ProductsVO> getProductsListBrand(PagingVO pagingVO);
	
	// 베스트 셀러
	public List<ProductsVO> getBestSeller();
}
