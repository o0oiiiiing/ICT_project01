package com.ict.forest.jjh.service;

import com.ict.forest.jjh.dao.SellerProductImgVO;
import com.ict.forest.jjh.dao.SellerProductVO;

public interface SellerService {
	public int productInsert(SellerProductVO spvo);
	public int productImgInsert(SellerProductImgVO spivo);
}
