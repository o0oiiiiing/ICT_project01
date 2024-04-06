package com.ict.forest.khj.controller;







import java.util.ArrayList;
import java.util.List;

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
	public ModelAndView getPay() {
		ModelAndView mv = new ModelAndView("khj-view/pay");
		BuyVO buyvo = new BuyVO();
		
		// 	private String order_idx, p_idx, user_idx, p_name, p_type, p_brand, p_volume, p_price, p_count,
		// p_option, delivery_status, delivery_start, delivery_end, buy_chk, p_main_img, pay_date;
		
//		System.out.println(buyvo.getP_idx());
//		System.out.println(buyvo.getUser_idx());
//		System.out.println(buyvo.getP_name());
//		System.out.println(buyvo.getP_type());
//		System.out.println(buyvo.getP_brand());
//		System.out.println(buyvo.getP_volume());
//		System.out.println(buyvo.getP_price());
//		System.out.println(buyvo.getP_count());
	
		
		
		String[] p_idx = {"20","23","26","29","30"};
		String[] user_idx = {"1","1","1","1","1"};
		String[] p_name = {"향수1","향수5","향수4","향수2","향수3"};
		String[] p_type = {"3","2","15","66","33"};
		String[] p_brand = {"34","1","65","22","76"};
		String[] p_volume = {"1","2","3","4","5"};
		String[] p_price = {"1000","5000","4000","2000","3000"};
		String[] p_count = {"7","3","11","4","1"};
		String[] option = {"5","1","2","4","6"};
		String p_main_img2 = payService.getPMainImg(p_idx[0]);
		System.out.println(p_main_img2);
		
		buyvo.setP_idx(p_idx);
		buyvo.setUser_idx(user_idx);
		buyvo.setP_name(p_name);
		buyvo.setP_type(p_type);
		buyvo.setP_brand(p_brand);
		buyvo.setP_volume(p_volume);
		buyvo.setP_price(p_price);
		buyvo.setP_count(p_count);
		buyvo.setOption(option);
		
		String[] p_idx2 = buyvo.getP_idx();
		String[] user_idx2 = buyvo.getUser_idx();
		String[] p_name2 = buyvo.getP_name();
		String[] p_type2 = buyvo.getP_type();
		String[] p_brand2 = buyvo.getP_brand();
		String[] p_volume2 = buyvo.getP_volume();
		String[] p_price2 = buyvo.getP_price();
		String[] p_count2 = buyvo.getP_count();
		String[] option2 = buyvo.getOption();
		
		
		List<PayVO> pay_list = new ArrayList();
	
		int total_price = 0;
		for (int i = 0; i < p_idx2.length; i++) {
			PayVO payVO1 = new PayVO();
//			 	private String order_idx, p_idx, user_idx, p_name, p_type, p_brand, p_volume, 
//			  p_price, p_count, p_option, delivery_status,
//			  delivery_start, delivery_end, buy_chk, p_main_img, pay_date;
			
			payVO1.setP_idx(p_idx2[i]); 
			payVO1.setUser_idx(user_idx2[i]);
			payVO1.setP_name(p_name2[i]);
			payVO1.setP_type(p_type2[i]);
			payVO1.setP_brand(p_brand2[i]);
			payVO1.setP_volume(p_volume2[i]);   
			payVO1.setP_price(p_price2[i]);  
			payVO1.setP_count(p_count2[i]);   
			payVO1.setP_option(option2[i]);   
			
//			 payVO1.setDelivery_status("0"); payVO1.setDelivery_start("2024-04-05");
//			  payVO1.setDelivery_end("0"); payVO1.setBuy_chk("0");
			 
			String p_main_img = payService.getPMainImg(p_idx2[i]);
			if((p_main_img != null) && !p_main_img.equals("")) {
				payVO1.setP_main_img(p_main_img);
			}else {
				return new ModelAndView("khj-view/error");
			}
			pay_list.add(payVO1);
			
			
			
//			  int pay_ins = payService.getPayInsert(payVO1); if(pay_ins > 0) { continue;
//			  }else { return new ModelAndView("khj-view/error"); }
			 
			
		}
		for (PayVO k : pay_list) {
			System.out.println(k.getP_main_img());
			System.out.println(k.getP_name());
			System.out.println(k.getP_count());
			System.out.println(k.getP_price());
			
		}
		mv.addObject("pay_list", pay_list);
		
		
		return mv;
		

	}
}
