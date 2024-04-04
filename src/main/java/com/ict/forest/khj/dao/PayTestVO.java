package com.ict.forest.khj.dao;

// khj   PayController로 넘어올 테스트용 VO 구매하려는 정보들이 담겨온다.
public class PayTestVO {
//	create table pay_table(
//		    order_idx int not null primary KEY AUTO_INCREMENT,
//		    p_idx int not null,
//		    user_idx INT NOT NULL,
//		    p_name varchar(50) not null,
//		    p_type varchar(50) not null,
//		    p_brand varchar(50) not null,
//		    p_volume varchar(50) not null,
//		    p_price int not null,
//		    p_saleprice int not null,
//		    p_count INT NOT NULL,
//		    p_option INT NOT NULL,
//		    delivery_status INT NOT NULL,
//		    delivery_start INT NOT NULL,
//		    delivery_end INT NOT NULL,
//		    buy_chk INT NOT NULL DEFAULT 0,
//		    pay_date DATETIME NOT NULL,
//			 FOREIGN KEY (p_idx) REFERENCES product_table(p_idx) ON DELETE CASCADE,
//			 FOREIGN KEY (user_idx) REFERENCES user_table(user_idx) ON DELETE cascade
//		  ) ENGINE=INNODB DEFAULT CHARSET UTF8;
//		  
	
//	private String p_idx, user_idx, p_name, p_type, p_brand, p_volume,
//	p_price, p_saleprice, p_count, p_option , p_main_img;
	
	private String[] pt_user_idx, pt_p_idx, pt_p_name, pt_p_count;

	public String[] getPt_user_idx() {
		return pt_user_idx;
	}

	public void setPt_user_idx(String[] pt_user_idx) {
		this.pt_user_idx = pt_user_idx;
	}

	public String[] getPt_p_idx() {
		return pt_p_idx;
	}

	public void setPt_p_idx(String[] pt_p_idx) {
		this.pt_p_idx = pt_p_idx;
	}

	public String[] getPt_p_name() {
		return pt_p_name;
	}

	public void setPt_p_name(String[] pt_p_name) {
		this.pt_p_name = pt_p_name;
	}

	public String[] getPt_p_count() {
		return pt_p_count;
	}

	public void setPt_p_count(String[] pt_p_count) {
		this.pt_p_count = pt_p_count;
	}

	
	
	

	
	
}
