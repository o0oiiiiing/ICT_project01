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
import com.ict.forest.jjh.dao.ProductDAO;
import com.ict.forest.jjh.dao.ProductSubImgVO;
import com.ict.forest.jjh.dao.ProductVO;
import com.ict.forest.jjh.service.ProductService;
import com.ict.forest.jjh.service.UserService;
import com.jcraft.jsch.Session;

@Controller
public class ProductController {
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private ProductService productService;
	
	@GetMapping("product_write")
	public ModelAndView productWrite() {
		ModelAndView mv = new ModelAndView("seller/product_write");
		return mv;
	}
	
	@PostMapping("product_insert")
	public ModelAndView productInsert(HttpServletRequest request, ProductVO pvo, ProductSubImgVO pivo) {
		ModelAndView mv = new ModelAndView("pdh-view/home");
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
}
