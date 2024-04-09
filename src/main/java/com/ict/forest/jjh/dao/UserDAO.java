package com.ict.forest.jjh.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.forest.khj.dao.PayVO;

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
	
	public int wishInsert(WishVO wvo) {
		try {
			return sqlSessionTemplate.insert("user_table.wish_insert", wvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public List<WishVO> wishList(String user_idx) {
		try {
			return sqlSessionTemplate.selectList("user_table.wish_list", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int wishCount(String user_idx) {
		try {
			return sqlSessionTemplate.selectOne("user_table.wish_count", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public int wishDelete(String user_idx, String p_idx) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("user_idx", user_idx);
			map.put("p_idx", p_idx);			
			return sqlSessionTemplate.delete("user_table.wish_delete", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0; 
	}
	
	public int addrTypeChange(String user_idx) {
		try {
			return sqlSessionTemplate.update("user_table.addr_type_chage", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public int userAddrAdd(UserAddrVO uavo) {
		try {
			return sqlSessionTemplate.insert("user_table.user_addr_add_insert", uavo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int pointPlus(UserVO uvo) {
		try {
			return sqlSessionTemplate.update("user_table.point_plus", uvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
	
	public List<PayVO> order_list(String user_idx) {
		try {
			return sqlSessionTemplate.selectList("user_table.order_list", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int complitedil(String user_idx, String order_idx) {
		try {
			Map<String, String> map = new HashMap<String, String>();
			map.put("user_idx", user_idx);
			map.put("order_idx", order_idx);
			return sqlSessionTemplate.update("user_table.complite_dil", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}
}
