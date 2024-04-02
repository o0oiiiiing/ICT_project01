package com.ict.forest.kch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.kch.dao.KchDAO;
import com.ict.forest.kch.dao.KchVO;

@Service
public class KchServiceImpl implements KchService{

	@Autowired KchDAO kchDAO;

	@Override
	public int getInfoUpdateOK(KchVO kchvo) {
		return kchDAO.getInfoUpdateOK(kchvo);
	}
	
	
}
