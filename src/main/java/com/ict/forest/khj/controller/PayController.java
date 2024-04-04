package com.ict.forest.khj.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
// khj 결제하기
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.protobuf.Service;
import com.ict.forest.khj.dao.PayTestVO;
import com.ict.forest.khj.dao.PayVO;
import com.ict.forest.khj.service.PayService;
@Controller
public class PayController {
	@Autowired
	private PayService payService;
	
	@GetMapping("pay")
	public ModelAndView getPay(PayTestVO paytestvo) {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		
		String[] pt_user_idx = {"1","1","1","1","1"};
		String[] pt_p_idx = {"1","5","4","2","3"};
		String[] pt_p_name = {"향수1","향수5","향수4","향수2","향수3"};
		String[] pt_p_count = {"7","3","11","4","1"};
		
		String[] pt_user_idx2 = paytestvo.getPt_p_idx();
		String[] pt_p_idx2 = paytestvo.getPt_p_idx();
		String[] pt_p_name2 = paytestvo.getPt_p_idx();
		String[] pt_p_count2 = paytestvo.getPt_p_idx();
		
		List<PayVO> pay_list = null;
		
		for (int i = 0; i < pt_user_idx2.length; i++) {
			PayVO payvo2 = new PayVO();
			payvo2.setUser_idx(pt_user_idx2[i]);
			payvo2.setP_idx(pt_p_idx2[i]);
			payvo2.setP_name(pt_p_name2[i]);
			payvo2.setP_count(pt_p_count2[i]);
			
		}
		
		
//		paytestvo.setP_brand("10_brand");
//		paytestvo.setP_count("3");
//		paytestvo.setP_idx("10");
//		paytestvo.setP_main_img("10_main_img");
//		paytestvo.setP_name("10_name");
//		paytestvo.setP_option("10_option");
//		paytestvo.setP_price("55500");
//		paytestvo.setP_saleprice("33300");
//		paytestvo.setP_type("10_type");
//		paytestvo.setP_volume("10_volume");
//		paytestvo.setUser_idx("2");
		
		
		
		
		
		
		
		return mv;
	}
}
