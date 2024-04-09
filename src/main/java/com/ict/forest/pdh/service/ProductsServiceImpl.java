package com.ict.forest.pdh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.pdh.dao.PagingVO;
import com.ict.forest.pdh.dao.ProductsDAO;
import com.ict.forest.pdh.dao.ProductsVO;

@Service
public class ProductsServiceImpl implements ProductsService {
	@Autowired
	private ProductsDAO productsDAO;

	@Override
	public int getTotalCount(PagingVO pagingVO) {
		return productsDAO.getTotalCount(pagingVO);
	}
	
	@Override
	public List<ProductsVO> getProductsList(PagingVO pagingVO) {
		return productsDAO.getProductsList(pagingVO);
	}

	@Override
	public List<ProductsVO> getBestSeller() {
		return productsDAO.getBestSeller();
	}


}
