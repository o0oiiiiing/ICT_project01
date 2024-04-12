package com.ict.forest.khj.dao;

import java.util.List;

public class QnaVO {
	private String qna_idx,user_idx,user_id,user_type,user_pwd, secret,
	qna_subject,qna_content,qna_created_date,
	qna_reply_status;
	
	private List<QnaReplyVO> reply_list;

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public String getQna_idx() {
		return qna_idx;
	}

	public void setQna_idx(String qna_idx) {
		this.qna_idx = qna_idx;
	}

	public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getQna_subject() {
		return qna_subject;
	}

	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_created_date() {
		return qna_created_date;
	}

	public void setQna_created_date(String qna_created_date) {
		this.qna_created_date = qna_created_date;
	}

	public String getQna_reply_status() {
		return qna_reply_status;
	}

	public void setQna_reply_status(String qna_reply_status) {
		this.qna_reply_status = qna_reply_status;
	}

	public List<QnaReplyVO> getReply_list() {
		return reply_list;
	}

	public void setReply_list(List<QnaReplyVO> reply_list) {
		this.reply_list = reply_list;
	}
	
	
}
