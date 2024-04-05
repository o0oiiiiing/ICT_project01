package com.ict.forest.pdh.service;

import java.util.List;

import com.ict.forest.pdh.dao.PagingVO;
import com.ict.forest.pdh.dao.ProductsVO;

public interface ProductsService {
	// ��ü ��ǰ �� count
	public int getTotalCount(String p_type);
	
	// �귣�庰 ��ǰ �� count
	public int getTotalCountBrand(PagingVO pagingVO);
	
	// ��ü ��ǰ ����Ʈ
	public List<ProductsVO> getProductsList(PagingVO pagingVO);
	
	// �귣�庰 ��ǰ ����Ʈ
	public List<ProductsVO> getProductsListBrand(PagingVO pagingVO);
	
	// ����Ʈ ����
	public List<ProductsVO> getBestSeller();
}
