package com.ict.forest.khj.service;


import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.khj.dao.PayVO;

public interface PayService {
	public String getPMainImg(String p_idx);
	public int getPayInsert(PayVO payvo);
	public UserVO getPayAddr(String user_idx);
	public int getPayPoint(String user_idx, String minus_pay_point);
	
}
