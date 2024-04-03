package com.ict.forest.jjh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.jjh.dao.ProductDAO;
import com.ict.forest.jjh.dao.ProductSubImgVO;
import com.ict.forest.jjh.dao.ProductVO;
import com.ict.forest.jjh.dao.ReviewVO;

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
	@Override
	public ProductVO productdetail(String p_idx) {
		return productDAO.productdetail(p_idx);
	}
	
	@Override
	public List<ProductSubImgVO> productSubImgList(String p_idx) {
		return productDAO.productSubImgList(p_idx);
	}
	
	@Override
	public List<ReviewVO> productReviewList(String p_idx) {
		return productDAO.productReviewList(p_idx);
	}
	
	
}
