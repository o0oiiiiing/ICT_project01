package com.ict.forest.pdh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.forest.pdh.dao.BrandVO;
import com.ict.forest.pdh.dao.KeywordVO;
import com.ict.forest.pdh.dao.TypeVO;
import com.ict.forest.pdh.dao.VolumeVO;
import com.ict.forest.pdh.service.SearchService;

@Controller
public class SearchController {
	@Autowired
	private SearchService searchService;
	
	@PostMapping("search")
	public ModelAndView getSearchList(KeywordVO kvo, TypeVO tvo, BrandVO bvo, VolumeVO vvo) {
		ModelAndView mv = new ModelAndView("pdh-view/products");
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put(kvo.getType(), kvo.getKeyword());
		map.put(tvo.getType(), tvo.getProduct());
		map.put(bvo.getType(), bvo.getBrand());
		map.put(vvo.getType(), vvo.getCapacity());
		for (Map.Entry<String, String[]> k : map.entrySet()) {
			System.out.println(k.getKey());
			for (String j : k.getValue()) {
				System.out.println(j);
			}
		}
		
		return null;
	}
}
