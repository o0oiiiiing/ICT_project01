package com.ict.forest.khj.service;

import com.ict.forest.khj.dao.PayVO;

public interface PayService {
	public String getPMainImg(String p_idx);
	public int getPayInsert(PayVO payvo);
	public int getPayOKUpdate(PayVO payvo);
}
