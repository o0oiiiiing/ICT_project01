package com.ict.forest.kch.service;

import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.kch.dao.KchVO;

public interface KchService {

	public int getInfoUpdateOK(KchVO kvo);
	
	public int findId(KchVO kvo);
	
	public KchVO kchdetail(String user_idx);

	public KchVO kchfindname(String user_name);
	
	public KchVO kchfindemail(String user_email);
	
	public KchVO nfind(String user_name);

	public KchVO kchfindpw(String user_id);
}
