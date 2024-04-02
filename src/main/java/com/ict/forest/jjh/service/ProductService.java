package com.ict.forest.jjh.service;

import com.ict.forest.jjh.dao.ProductImgVO;
import com.ict.forest.jjh.dao.ProductVO;

public interface ProductService {
	public int productInsert(ProductVO pvo);
	public int productImgInsert(ProductImgVO pivo);
}
