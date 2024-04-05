package com.ict.forest.kch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.kch.dao.KchDAO;
import com.ict.forest.kch.dao.KchVO;

@Service
public class KchServiceImpl implements KchService{

	@Autowired KchDAO kchDAO;

	@Override
	public int getInfoUpdateOK(KchVO kvo) {
		return kchDAO.getInfoUpdateOK(kvo);
	}

	@Override
	public int findId(KchVO kvo) {
		return kchDAO.findId(kvo);
	}

	@Override
	public KchVO kchdetail(String user_idx) {
		return kchDAO.kchdetail(user_idx);
	}

	@Override
	public KchVO kchfindname(String user_name) {
		return kchDAO.kchfindname(user_name);
	}

	@Override
	public KchVO kchfindemail(String user_email) {
		return kchDAO.kchfindemail(user_email);
	}

	@Override
	public KchVO nfind(String user_name) {
		return kchDAO.nfind(user_name);
	}
	
	@Override
	public KchVO kchfindpw(String user_id) {
		return kchDAO.pfind(user_id);
	}
	
	
}
