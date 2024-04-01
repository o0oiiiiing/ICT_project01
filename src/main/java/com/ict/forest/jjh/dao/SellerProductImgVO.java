package com.ict.forest.jjh.dao;

import org.springframework.web.multipart.MultipartFile;

public class SellerProductImgVO {
	private String p_img_idx, p_idx, user_idx, p_img, p_img_type;
	private MultipartFile main_img;
	private MultipartFile[] sub_imgs;
	
	
	public String getP_img_type() {
		return p_img_type;
	}
	public void setP_img_type(String p_img_type) {
		this.p_img_type = p_img_type;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_img_idx() {
		return p_img_idx;
	}
	public void setP_img_idx(String p_img_idx) {
		this.p_img_idx = p_img_idx;
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
	public MultipartFile getMain_img() {
		return main_img;
	}
	public void setMain_img(MultipartFile main_img) {
		this.main_img = main_img;
	}
	public MultipartFile[] getSub_imgs() {
		return sub_imgs;
	}
	public void setSub_imgs(MultipartFile[] sub_imgs) {
		this.sub_imgs = sub_imgs;
	}
}
