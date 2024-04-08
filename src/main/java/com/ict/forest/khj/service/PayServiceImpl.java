package com.ict.forest.khj.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.khj.dao.PayDAO;
import com.ict.forest.khj.dao.PayVO;

// khj  결제하기
@Service
public class PayServiceImpl implements PayService{
@Autowired
private PayDAO payDAO;
	
	@Override
	public String getPMainImg(String p_idx) {
		return payDAO.getPMainImg(p_idx);
	}

	@Override
	public int getPayInsert(PayVO payvo) {
		return payDAO.getPayInsert(payvo);
	}
	
	@Override
		public int getPayOKUpdate(PayVO payvo) {
			return payDAO.getPayOKUpdate(payvo);
		}

}
