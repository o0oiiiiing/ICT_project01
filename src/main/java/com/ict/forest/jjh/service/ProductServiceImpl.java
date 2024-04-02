package com.ict.forest.jjh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.jjh.dao.ProductDAO;
import com.ict.forest.jjh.dao.ProductSubImgVO;
import com.ict.forest.jjh.dao.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public int productInsert(ProductVO pvo) {
		return productDAO.productInsert(pvo);
	}

	@Override
	public int productImgInsert(ProductSubImgVO pivo) {
		return productDAO.productImgInsert(pivo);
	}
	
}
