package com.ict.forest.pdh.service;

import java.util.List;

import com.ict.forest.pdh.dao.ProductsVO;

public interface ProductsService {
	// ��ü ��ǰ ��������
	public List<ProductsVO> getProductsList(String p_type);
}
