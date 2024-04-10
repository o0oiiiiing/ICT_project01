package com.ict.forest.khj.dao;

public class PayVO {

	private String order_idx, p_idx, user_idx, p_name, p_type, p_brand, p_volume, p_price, p_count,
	p_option, delivery_status, delivery_start, delivery_end, buy_chk, p_main_img, pay_date, 
	zip_code, main_addr, detail_addr, ex_addr;
	
	public int total_price() {
		return Integer.parseInt(p_price) * Integer.parseInt(p_count);
	}
	public String getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
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


	public String getP_count() {
		return p_count;
	}

	public void setP_count(String p_count) {
		this.p_count = p_count;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	public String getDelivery_status() {
		return delivery_status;
	}

	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}

	public String getDelivery_start() {
		return delivery_start;
	}

	public void setDelivery_start(String delivery_start) {
		this.delivery_start = delivery_start;
	}

	public String getDelivery_end() {
		return delivery_end;
	}

	public void setDelivery_end(String delivery_end) {
		this.delivery_end = delivery_end;
	}

	public String getBuy_chk() {
		return buy_chk;
	}

	public void setBuy_chk(String buy_chk) {
		this.buy_chk = buy_chk;
	}

	public String getP_main_img() {
		return p_main_img;
	}

	public void setP_main_img(String p_main_img) {
		this.p_main_img = p_main_img;
	}

	
	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getMain_addr() {
		return main_addr;
	}

	public void setMain_addr(String main_addr) {
		this.main_addr = main_addr;
	}

	public String getDetail_addr() {
		return detail_addr;
	}

	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	public String getEx_addr() {
		return ex_addr;
	}

	public void setEx_addr(String ex_addr) {
		this.ex_addr = ex_addr;
	}

	
	
	
}
