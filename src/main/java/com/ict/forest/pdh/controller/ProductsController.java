package com.ict.forest.pdh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.pdh.dao.ProductsVO;
import com.ict.forest.pdh.service.ProductsService;

@Controller
public class ProductsController {
	@Autowired
	private ProductsService productsService;
	
	@GetMapping("products")
	public ModelAndView getProductsList(String p_type) {
		try {
			ModelAndView mv = new ModelAndView("pdh-view/products");
			List<ProductsVO> products_list = productsService.getProductsList(p_type);
			if (products_list != null) {
				mv.addObject("products_list", products_list);
				return mv;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ModelAndView("pdh-view/error");
	}
}
