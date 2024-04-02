package com.ict.forest.pdh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.pdh.dao.ProductsDAO;
import com.ict.forest.pdh.dao.ProductsVO;

@Service
public class ProductsServiceImpl implements ProductsService{
	@Autowired
	private ProductsDAO productsDAO;
	
	@Override
	public List<ProductsVO> getProductsList(String p_type) {
		return productsDAO.getProductsList(p_type);
	}

}
