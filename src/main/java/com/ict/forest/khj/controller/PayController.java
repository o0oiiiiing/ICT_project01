package com.ict.forest.khj.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
// khj 결제하기
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.jjh.dao.BuyVO;
import com.ict.forest.khj.dao.PayVO;
import com.ict.forest.khj.service.PayService;
@Controller
public class PayController {
	// 주형씨거 BuyVO에 담긴 배열 변수들
	//private String[] p_idx, user_idx, p_name, p_type, p_brand, p_volume, p_price, p_count, option;
	
	
	
	@Autowired
	private PayService payService;
	
	// 고객센터 faq 이동 이동
	@GetMapping("faq")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("khj-view/customer_center");
		return mv;
	}
	
	// 고객센터qna 이동 이동
	@GetMapping("qna")
	public ModelAndView qna() {
		ModelAndView mv = new ModelAndView("khj-view/qna");
		return mv;
	}
	// 고객센터qna 이동 이동
	@GetMapping("claim")
	public ModelAndView claim() {
		ModelAndView mv = new ModelAndView("khj-view/claim");
		return mv;
	}
	
	
	// 상품 결제페이지 이동
	@GetMapping("pay")
	public ModelAndView getPay(BuyVO buyvo) {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		
		// 	private String order_idx, p_idx, user_idx, p_name, p_type, p_brand, p_volume, p_price, p_count,
		// p_option, delivery_status, delivery_start, delivery_end, buy_chk, p_main_img, pay_date;
		
		
		
		
		String[] p_idx = {"1","5","4","2","3"};
		String[] user_idx = {"1","1","1","1","1"};
		String[] p_name = {"향수1","향수5","향수4","향수2","향수3"};
		String[] p_type = {"3","2","15","66","33"};
		String[] p_brand = {"34","1","65","22","76"};
		String[] p_volume = {"1","2","3","4","5"};
		String[] p_price = {"1000","5000","4000","2000","3000"};
		String[] p_count = {"7","3","11","4","1"};
		String[] option = {"5","1","2","4","6"};
		
		buyvo.setP_idx(p_idx);
		buyvo.setUser_idx(user_idx);
		buyvo.setP_name(p_name);
		buyvo.setP_type(p_type);
		buyvo.setP_brand(p_brand);
		buyvo.setP_volume(p_volume);
		buyvo.setP_price(p_price);
		buyvo.setP_count(p_count);
		buyvo.setP_option(option);
		
		String[] p_idx2 = buyvo.getP_idx();
		String[] user_idx2 = buyvo.getUser_idx();
		String[] p_name2 = buyvo.getP_name();
		String[] p_type2 = buyvo.getP_type();
		String[] p_brand2 = buyvo.getP_brand();
		String[] p_volume2 = buyvo.getP_volume();
		String[] p_price2 = buyvo.getP_price();
		String[] p_count2 = buyvo.getP_count();
		String[] option2 = buyvo.getP_option();
		
			
		for (int i = 0; i < p_idx2.length; i++) {
			PayVO payVO1 = new PayVO();
			// 	private String order_idx, p_idx, user_idx, p_name, p_type, p_brand, p_volume, 
			//  p_price, p_count, p_option, delivery_status,
			//  delivery_start, delivery_end, buy_chk, p_main_img, pay_date;
			
			payVO1.setP_idx(p_idx2[i]); 
			payVO1.setUser_idx(user_idx2[i]);
			payVO1.setP_name(p_name2[i]);
			payVO1.setP_type(p_type2[i]);
			payVO1.setP_brand(p_brand2[i]);
			payVO1.setP_volume(p_volume2[i]);   
			payVO1.setP_price(p_price2[i]);  
			payVO1.setP_count(p_count2[i]);   
			payVO1.setP_option(option2[i]);   
			payVO1.setDelivery_status("1");
			payVO1.setDelivery_start("2024-04-05");
			payVO1.setDelivery_end("0");
			payVO1.setBuy_chk("0");
			String p_main_img = payService.getPMainImg(p_idx[i]);
			if(p_main_img != null || p_main_img != "") {
				payVO1.setP_main_img(p_main_img);
			}
			
			int pay_ins = payService.getPayInsert(payVO1);
			if(pay_ins > 0) {
				continue;
			}else {
				return new ModelAndView("khj-view/error");
			}
		}
		return mv;
		

	}
}
