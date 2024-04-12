package com.ict.forest.jjh.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.common.SessionUser;
import com.ict.forest.jjh.dao.ProductSubImgVO;
import com.ict.forest.jjh.dao.ProductVO;
import com.ict.forest.jjh.dao.ReviewVO;
import com.ict.forest.jjh.dao.WishVO;
import com.ict.forest.jjh.service.ProductService;
import com.ict.forest.jjh.service.UserService;

@Controller
public class ProductController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;
	
	@GetMapping("product_write")
	public ModelAndView productWrite() {
		ModelAndView mv = new ModelAndView("jjh-view/product_write");
		return mv;
	}
	
	@PostMapping("product_insert")
	public ModelAndView productInsert(HttpServletRequest request, ProductVO pvo, ProductSubImgVO pivo) {
		ModelAndView mv = new ModelAndView("jjh-view/mypage");
		try {
			String path = request.getSession().getServletContext().getRealPath("resources/upload");
			MultipartFile main_img = pvo.getMain_img();
			MultipartFile[] sub_imgs = pivo.getSub_imgs();
			HttpSession session = request.getSession();
			SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
			if (main_img.isEmpty()) {
				pvo.setP_main_img("");
			}else {
				// 파일 이름 지정
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString()+"_"+main_img.getOriginalFilename();
				pvo.setP_main_img(f_name);
				// 파일 업로드(복사)
				byte[] in = main_img.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
				pvo.setUser_idx(ssuvo.getUser_idx());
				int res_p = productService.productInsert(pvo);
			}
			if (sub_imgs.length > 0) {
				for (MultipartFile k : sub_imgs) {
					// 파일 이름 지정
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString()+"_"+k.getOriginalFilename();
					pivo.setP_img(f_name);
					pivo.setUser_idx(ssuvo.getUser_idx());
					// 파일 업로드(복사)
					byte[] in = k.getBytes();
					File out = new File(path, f_name);
					FileCopyUtils.copy(in, out);
					
					int res_m = productService.productImgInsert(pivo);
				}
			}
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	
	// 상세 상품페이지 이동 이동
	// 여기서 최근 상품
	@GetMapping("detailproduct")
	public ModelAndView detailproduct(HttpSession session, String p_idx) {
		ModelAndView mv = new ModelAndView("jjh-view/detailproduct");
		ProductVO pvo = productService.productdetail(p_idx);
		List<ProductSubImgVO> pivo_list = productService.productSubImgList(p_idx);
		List<ReviewVO> review_list = productService.productReviewList(p_idx);
		if (review_list.size() > 0) {
			double score_avg = 0;
			for (ReviewVO k : review_list) {
				score_avg = score_avg + Double.parseDouble(k.getScore());
			}
			score_avg =  (int)((score_avg/review_list.size())*10)/10.0;
			mv.addObject("score_avg", score_avg);
					
		}
		System.out.println(review_list);
		System.out.println(p_idx);
		for (ReviewVO k : review_list) {
			System.out.println("score: "+k.getScore());
		}
		List<ProductVO> recent = (List<ProductVO>) session.getAttribute("recent");
		
		// 최근 본 상품 처리
		List<ProductVO> recent2 = recent.stream().filter(x->!x.getP_idx().equals(p_idx)).collect(Collectors.toList());
		for (ProductVO k : recent2) {
			System.out.println(k.getP_idx());
		}
		System.out.println("받은 p_idx="+p_idx);
		recent2.add(0,pvo);
		System.out.println(recent2);

		if (recent2.size() == 6) {
			recent2.remove(recent2.size()-1);
		}
		
		session.removeAttribute("recent");
		session.setAttribute("recent", recent2);
		
		// cart 유무 처리
		if (((List<ProductVO>) session.getAttribute("cart")).size() > 0) {
			List<ProductVO> cart = (List<ProductVO>) session.getAttribute("cart");
			if (cart.stream().anyMatch(x->x.getP_idx().equals(pvo.getP_idx()))) {
				System.out.println("카트처리");
				mv.addObject("cart_status", "1");
			}
		}
		// wish 유무 처리
		if (session.getAttribute("ssuvo") != null) {
			SessionUser ssuvo = (SessionUser) session.getAttribute("ssuvo");
			List<WishVO> list_wvo = userService.wishList(ssuvo.getUser_idx());			
			if (list_wvo.stream().anyMatch(x->x.getP_idx().equals(pvo.getP_idx()))) {
				mv.addObject("wish_status", "1");
			}
		}
		
		
		mv.addObject("pvo", pvo);
		mv.addObject("pivo_list", pivo_list);
		mv.addObject("review_list", review_list);
		return mv;
	}
	
}
