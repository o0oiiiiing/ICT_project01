package com.ict.forest.kch.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.jjh.dao.UserAddrVO;

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
	
	public KchVO kchfindname(String user_name) {
		try {
			return sqlSessionTemplate.selectOne("user2_table.findname", user_name);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public KchVO kchfindemail(String user_email) {
		try {
			return sqlSessionTemplate.selectOne("user2_table.findemail", user_email);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	
	}
	
	public KchVO nfind(String user_name) {
		try {
			return sqlSessionTemplate.selectOne("user2_table.nfind", user_name);
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public KchVO pfind(String user_id) {
		try {
			return sqlSessionTemplate.selectOne("user2_table.pfind",user_id);
			
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
	
	public int infoUpdateOK(KchVO kvo) {
		try {
			return sqlSessionTemplate.update("user2_table.user_info_up", kvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int npwdUpdate(KchVO kvo) {
		try {
			return sqlSessionTemplate.update("user2_table.user_npwd", kvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	public int expwdUpdate(KchVO kvo) {
		try {
			return sqlSessionTemplate.update("user2_table.user_expwd", kvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public KchVO kchfindpw(String user_id) {
		try {
			return sqlSessionTemplate.selectOne("user2_table.kchfindpw", user_id);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
}
