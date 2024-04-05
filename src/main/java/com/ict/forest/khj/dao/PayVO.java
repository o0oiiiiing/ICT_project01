package com.ict.forest.khj.dao;

//  khj     PayVO는 결제하기 VO이다.
public class PayVO {
	// user_idx 는 com.ict.forest.common안에 SessionUser거나 SessionCart거
	// payment 는 결제금액.(상품가격은 db에서 변동이 될 수 있지만 결제를 
	//	했을 당시의 단품 가격과 총 금액을 저장해야 한다.)
//	create table pay_table(
//		    order_idx int not null primary KEY AUTO_INCREMENT,		주문번호
//		    p_idx int not null,
//		    user_idx INT NOT NULL,
//		    p_name varchar(50) not null,
//		    p_type varchar(50) not null,
//		    p_brand varchar(50) not null,		
//		    p_volume varchar(50) not null,		
//		    p_price int not null,				상품금액
//		    p_count INT NOT NULL,   			상품수량
//		    p_option INT NOT NULL,				
//		    delivery_status INT NOT NULL,		
//		    delivery_start INT NOT NULL,		
//		    delivery_end INT NOT NULL,
//		    buy_chk INT NOT NULL DEFAULT 0,			구매확정??
//			p_main_img varchar(500) not null,	  
//		    pay_date DATETIME NOT NULL,			주문한(결제한) 날짜
//			 FOREIGN KEY (p_idx) REFERENCES product_table(p_idx) ON DELETE CASCADE,
//			 FOREIGN KEY (user_idx) REFERENCES user_table(user_idx) ON DELETE cascade
//		  ) ENGINE=INNODB DEFAULT CHARSET UTF8;
	private String order_idx, p_idx, user_idx, p_name, p_type, p_brand, p_volume, p_price, p_count,
	p_option, delivery_status, delivery_start, delivery_end, buy_chk, p_main_img, pay_date;

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

	
	
	
}
