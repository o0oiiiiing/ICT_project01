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
	
	public int findId(KchVO kvo) {
		try {
			return sqlSessionTemplate.selectOne("user2_table.find_id", kvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public KchVO kchdetail(String user_idx) {
		try {
			return sqlSessionTemplate.selectOne("user2_table.kchdetail", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
