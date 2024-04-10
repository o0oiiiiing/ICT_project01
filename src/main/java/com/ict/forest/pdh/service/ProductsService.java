package com.ict.forest.pdh.service;

import java.util.List;

import com.ict.forest.pdh.dao.PagingVO;
import com.ict.forest.pdh.dao.ProductsVO;

public interface ProductsService {
	// ��ü ��ǰ �� count
	public int getTotalCount(PagingVO pagingVO);
	
	// ��ü ��ǰ ����Ʈ
	public List<ProductsVO> getProductsList(PagingVO pagingVO);
	
	// ����Ʈ ����
	public List<ProductsVO> getBestSeller();
}
