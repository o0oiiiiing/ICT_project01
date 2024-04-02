package com.ict.forest.jjh.service;

import com.ict.forest.jjh.dao.ProductSubImgVO;
import com.ict.forest.jjh.dao.ProductVO;

public interface ProductService {
	public int productInsert(ProductVO pvo);
	public int productImgInsert(ProductSubImgVO pivo);
}
