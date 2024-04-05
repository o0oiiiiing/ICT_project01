package com.ict.forest.khj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
// khj 결제하기
@Repository
public class PayDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public String getPMainImg(String p_idx) {
		try {
			
			return sqlSessionTemplate.selectOne("pay_table.p_main_img" , p_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int getPayInsert(PayVO payVO1) {
		try {
			
			return sqlSessionTemplate.insert("pay_table", payVO1);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
}
