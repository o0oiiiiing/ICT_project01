package com.ict.forest.kch.service;

import com.ict.forest.kch.dao.KchVO;

public interface KchService {

	public int getInfoUpdateOK(KchVO kvo);
	
	public int findId(KchVO kvo);
	
	public KchVO kchdetail(String user_idx);
}
