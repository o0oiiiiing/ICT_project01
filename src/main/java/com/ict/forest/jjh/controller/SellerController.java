package com.ict.forest.jjh.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

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
import com.ict.forest.jjh.dao.SellerDAO;
import com.ict.forest.jjh.dao.SellerProductImgVO;
import com.ict.forest.jjh.dao.SellerProductVO;
import com.ict.forest.jjh.service.SellerService;
import com.ict.forest.jjh.service.UserService;
import com.jcraft.jsch.Session;

@Controller
public class SellerController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private SellerService sellerService;
	
	@GetMapping("product_write")
	public ModelAndView productWrite() {
		ModelAndView mv = new ModelAndView("seller/product_write");
		return mv;
	}
	
	@PostMapping("product_insert")
	public ModelAndView productInsert(HttpServletRequest request, SellerProductVO spvo, SellerProductImgVO spivo) {
		ModelAndView mv = new ModelAndView("pdh-view/home");
		try {
			String path = request.getSession().getServletContext().getRealPath("resources/upload");
			MultipartFile main_img = spivo.getMain_img();
			MultipartFile[] sub_imgs = spivo.getSub_imgs();
			HttpSession ssu = request.getSession();
			SessionUser ssuvo = (SessionUser) ssu.getAttribute("ssuvo");
			if (main_img.isEmpty()) {
				spivo.setP_img("");
			}else {
				// 파일 이름 지정
				UUID uuid = UUID.randomUUID();
				String f_name = uuid.toString()+"_"+main_img.getOriginalFilename();
				spivo.setP_img(f_name);
				// 파일 업로드(복사)
				byte[] in = main_img.getBytes();
				File out = new File(path, f_name);
				FileCopyUtils.copy(in, out);
				spvo.setUser_idx(ssuvo.getUser_idx());
				spivo.setUser_idx(ssuvo.getUser_idx());
				System.out.println(spvo.getP_price());
				System.out.println(spvo.getP_saleprice());
				spivo.setP_img_type("0");
				int res_p = sellerService.productInsert(spvo);
				int res_m = sellerService.productImgInsert(spivo);
			}
			if (sub_imgs!=null) {
				for (MultipartFile k : sub_imgs) {
					// 파일 이름 지정
					UUID uuid = UUID.randomUUID();
					String f_name = uuid.toString()+"_"+k.getOriginalFilename();
					spivo.setP_img(f_name);
					spivo.setP_img_type("1");
					spivo.setUser_idx(ssuvo.getUser_idx());
					// 파일 업로드(복사)
					byte[] in = k.getBytes();
					File out = new File(path, f_name);
					FileCopyUtils.copy(in, out);
					
					int res_m = sellerService.productImgInsert(spivo);
				}
			}
			return mv;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
}
