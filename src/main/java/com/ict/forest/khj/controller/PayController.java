package com.ict.forest.khj.controller;











import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
// khj 결제하기
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.BuyVO;
import com.ict.forest.jjh.dao.UserVO;
import com.ict.forest.khj.dao.PayVO;
import com.ict.forest.khj.service.PayService;
@Controller
public class PayController {
	// 주형씨거 BuyVO에 담긴 배열 변수들
	//private String[] p_idx, user_idx, p_name, p_type, p_brand, p_volume, p_price, p_count, p_option;
	
	
	
	@Autowired
	private PayService payService;
	
	// 고객센터 faq 이동 이동
	@GetMapping("faq")
	public ModelAndView help() {
		ModelAndView mv = new ModelAndView("khj-view/customer_center");
		return mv;
	}
	
	// 상품 결제페이지 이동
	@RequestMapping("pay")
	public ModelAndView getPay(BuyVO bvo, HttpServletRequest request) {
		// 	private String order_idx, p_idx, user_idx, p_name, p_type, p_brand, p_volume, p_price, p_count,
		// p_option, delivery_status, delivery_start, delivery_end, buy_chk, p_main_img, pay_date;
		
		ModelAndView mv = new ModelAndView("khj-view/pay");
		HttpSession session = request.getSession();
		SessionUser ssuvo2 = (SessionUser) session.getAttribute("ssuvo");
		String user_idx = ssuvo2.getUser_idx();
	
		List<PayVO> pay_list = new ArrayList<PayVO>();
		for (int i = 0; i < bvo.getP_idx().length; i++) {
			PayVO payvo = new PayVO();
			payvo.setP_idx(bvo.getP_idx()[i]);
			payvo.setUser_idx(user_idx);
			payvo.setP_name(bvo.getP_name()[i]);
			payvo.setP_type(bvo.getP_type()[i]);
			payvo.setP_brand(bvo.getP_brand()[i]);
			payvo.setP_volume(bvo.getP_volume()[i]);
			payvo.setP_price(bvo.getP_price()[i]);
			payvo.setP_count(bvo.getP_count()[i]);
			if (bvo.getP_option() != null) {
				payvo.setP_option(bvo.getP_option()[i]);
			}else {
				payvo.setP_option("1");
			}
			payvo.setP_main_img(bvo.getP_main_img()[i]);
			payvo.setDelivery_status("0");
			payvo.setDelivery_end("0000-00-00");
			payvo.setBuy_chk("0");
			pay_list.add(payvo);
			}
		UserVO uvo = payService.getPayAddr(user_idx);
		
	 
		mv.addObject("uvo", uvo);
		mv.addObject("pay_list", pay_list);
		return mv;
	}
	
	@PostMapping("pay_ok")
	public ModelAndView getPayOK(BuyVO bvo, String minus_pay_point) {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		
		
		for (int i = 0; i < bvo.getP_idx().length; i++) {
			PayVO payvo = new PayVO();
			payvo.setP_idx(bvo.getP_idx()[i]);
			payvo.setUser_idx(bvo.getUser_idx()[i]);
			payvo.setP_name(bvo.getP_name()[i]);
			payvo.setP_type(bvo.getP_type()[i]);
			payvo.setP_brand(bvo.getP_brand()[i]);
			payvo.setP_volume(bvo.getP_volume()[i]);
			payvo.setP_price(bvo.getP_price()[i]);
			payvo.setP_count(bvo.getP_count()[i]);
			payvo.setP_option(bvo.getP_option()[i]);
			payvo.setP_main_img(bvo.getP_main_img()[i]);
			payvo.setZip_code(bvo.getZip_code());
			payvo.setMain_addr(bvo.getMain_addr());
			payvo.setDetail_addr(bvo.getDetail_addr());
			payvo.setEx_addr(bvo.getEx_addr());
			
			int result = payService.getPayInsert(payvo);
			
		}
		System.out.println(minus_pay_point); 
		
		String user_idx = bvo.getUser_idx()[0];
		int result = payService.getPayPoint(user_idx, minus_pay_point);
		if(result > 0) {
			
			return mv;
		}
		return new ModelAndView("khj-view/error");
		
	}
}
