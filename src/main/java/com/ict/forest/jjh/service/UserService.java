package com.ict.forest.jjh.service;

import java.util.List;

import com.ict.forest.jjh.dao.UserAddrVO;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.dao.WishVO;
import com.ict.forest.khj.dao.PayVO;

public interface UserService {
	public int userJoin(UserVO uvo);
	public int userJoinAddr(UserAddrVO uavo);
	public UserVO userLogin(String user_id);
	public UserVO userDetail(String user_idx);
	public List<UserAddrVO> userAddr(String user_idx);	
	public int wishInsert(WishVO wvo);
	public List<WishVO> wishList(String user_idx);
	public int wishCount(String user_idx);
	public int wishDelete(String user_idx, String p_idx);
	public int addrTypeChange(String user_idx);
	public int userAddrAdd(UserAddrVO uavo);
	public int pointPlus(UserVO uvo);
	public List<PayVO> order_list(String user_idx);
	public int complitedil(String user_idx, String order_idx, String delivery_end);
	
}
