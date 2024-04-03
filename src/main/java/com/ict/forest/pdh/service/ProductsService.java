package com.ict.forest.pdh.service;

import java.util.List;

import com.ict.forest.pdh.dao.PagingVO;
import com.ict.forest.pdh.dao.ProductsVO;

public interface ProductsService {
	// ��ü �� count
	public int getTotalCount(String p_type);
	
	// ��ü ��ǰ ����Ʈ
	public List<ProductsVO> getProductsList(PagingVO pagingVO);
}
