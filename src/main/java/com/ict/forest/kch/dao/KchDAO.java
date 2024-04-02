package com.ict.forest.kch.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KchDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getInfoUpdateOK(KchVO kchvo) {
		try {
			
			return sqlSessionTemplate.update("user_table.user_update", kchvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
}
