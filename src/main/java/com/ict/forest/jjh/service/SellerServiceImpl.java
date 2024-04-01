package com.ict.forest.jjh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.jjh.dao.SellerDAO;
import com.ict.forest.jjh.dao.SellerProductImgVO;
import com.ict.forest.jjh.dao.SellerProductVO;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	private SellerDAO sellerDAO;
	
	@Override
	public int productInsert(SellerProductVO spvo) {
		return sellerDAO.productInsert(spvo);
	}

	@Override
	public int productImgInsert(SellerProductImgVO spivo) {
		return sellerDAO.productImgInsert(spivo);
	}
	
}
