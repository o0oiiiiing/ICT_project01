package com.ict.forest.khj.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.forest.jjh.dao.UserVO;
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
	
	public int getPayInsert(PayVO payvo) {
		try {
			
			return sqlSessionTemplate.insert("pay_table.pay_insert", payvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public UserVO getPayAddr(String user_idx) {
		return sqlSessionTemplate.selectOne("pay_table.pay_user", user_idx);
	}
	
	public int getPayPoint(String user_idx, String minus_pay_point) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_idx", user_idx);
		map.put("minus_pay_point", minus_pay_point);
		return sqlSessionTemplate.update("pay_table.minus_pay_point", map);
	}
}
