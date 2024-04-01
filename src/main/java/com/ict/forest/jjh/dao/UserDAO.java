package com.ict.forest.jjh.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int userJoin(UserVO uvo) {
		try {
			System.out.println("dao1");
			return sqlSessionTemplate.insert("user_table.user_insert", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int userJoinAddr(UserAddrVO uavo) {
		try {
			System.out.println("dao2");
			
			return sqlSessionTemplate.insert("user_table.user_addr_insert", uavo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public UserVO userLogin(String user_id) {
		try {
			return sqlSessionTemplate.selectOne("user_table.user_login", user_id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public UserVO userDetail(String user_idx) {
		try {
			return sqlSessionTemplate.selectOne("user_table.user_detail", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public List<UserAddrVO> userAddr(String user_idx) {
		try {
			return sqlSessionTemplate.selectList("user_table.user_addr", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
}
