package com.ict.forest.jjh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.forest.jjh.dao.BuyListVO;
import com.ict.forest.jjh.dao.ReviewVO;
import com.ict.forest.jjh.dao.UserAddrVO;
import com.ict.forest.jjh.dao.UserDAO;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.jjh.dao.WishVO;
import com.ict.forest.khj.dao.PayVO;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDAO userDAO;

	@Override
	public int userJoin(UserVO uvo) {
		return userDAO.userJoin(uvo);
	}
	
	@Override
	public int userJoinAddr(UserAddrVO uavo) {
		return userDAO.userJoinAddr(uavo);
	}
	
	@Override
	public UserVO userLogin(String user_id) {
		return userDAO.userLogin(user_id);
	}
	
	@Override
	public UserVO userDetail(String user_idx) {
		return userDAO.userDetail(user_idx);
	}
	
	@Override
	public List<UserAddrVO> userAddr(String user_idx) {
		return userDAO.userAddr(user_idx);
	}
	@Override
	public int wishInsert(WishVO wvo) {
		return userDAO.wishInsert(wvo);
	}
	
	@Override
	public List<WishVO> wishList(String user_idx) {
		return userDAO.wishList(user_idx);
	}
	
	@Override
	public int wishCount(String user_idx) {
		return userDAO.wishCount(user_idx);
	}
	@Override
	public int wishDelete(String user_idx, String p_idx) {
		return userDAO.wishDelete(user_idx, p_idx);
	}
	@Override
	public int addrTypeChange(String user_idx) {
		return userDAO.addrTypeChange(user_idx);
	}
	@Override
	public int userAddrAdd(UserAddrVO uavo) {
		return userDAO.userAddrAdd(uavo);
	}
	@Override
	public int pointPlus(UserVO uvo) {
		return userDAO.pointPlus(uvo);
	}
	@Override
	public List<PayVO> order_list(String user_idx) {
		return userDAO.order_list(user_idx);
	}
	
	@Override
	public int complitedil(String user_idx, String order_idx, String delivery_end) {
		return userDAO.complitedil(user_idx, order_idx, delivery_end);
	}
	
	@Override
	public int update_buy_chk(String order_idx) {
		return userDAO.update_buy_chk(order_idx);
	}
	
	@Override
	public List<BuyListVO> buy_list(String user_idx) {
		return userDAO.buy_list(user_idx);
	}
	
	@Override
	public int review_insert(ReviewVO revo) {
		return userDAO.review_insert(revo);
	}
}
