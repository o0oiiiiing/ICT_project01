package com.ict.forest.jjh.dao;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private String p_idx, user_idx, p_name, p_type, p_brand, p_volume, p_price, buy_rate, total_quatity, p_main_img, p_content, regdate;
	private MultipartFile main_img;
	
	
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_idx() {
		return p_idx;
	}
	public void setP_idx(String p_idx) {
		this.p_idx = p_idx;
	}
	public String getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_brand() {
		return p_brand;
	}
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	public String getP_volume() {
		return p_volume;
	}
	public void setP_volume(String p_volume) {
		this.p_volume = p_volume;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getBuy_rate() {
		return buy_rate;
	}
	public void setBuy_rate(String buy_rate) {
		this.buy_rate = buy_rate;
	}
	public String getTotal_quatity() {
		return total_quatity;
	}
	public void setTotal_quatity(String total_quatity) {
		this.total_quatity = total_quatity;
	}
	public String getP_main_img() {
		return p_main_img;
	}
	public void setP_main_img(String p_main_img) {
		this.p_main_img = p_main_img;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public MultipartFile getMain_img() {
		return main_img;
	}
	public void setMain_img(MultipartFile main_img) {
		this.main_img = main_img;
	}
	
	

	
}
