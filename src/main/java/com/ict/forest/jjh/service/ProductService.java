package com.ict.forest.jjh.service;

import java.util.List;

import com.ict.forest.jjh.dao.ProductSubImgVO;
import com.ict.forest.jjh.dao.ProductVO;
import com.ict.forest.jjh.dao.ReviewVO;

public interface ProductService {
	public int productInsert(ProductVO pvo);
	public int productImgInsert(ProductSubImgVO pivo);
	public ProductVO productdetail(String p_idx);
	public List<ProductSubImgVO> productSubImgList(String p_idx);
	public List<ReviewVO> productReviewList(String p_idx);	
}
