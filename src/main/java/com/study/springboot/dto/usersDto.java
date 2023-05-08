package com.study.springboot.dto;

import java.util.Date;

public class usersDto {
	public int user_idx;
	public String user_name;
	public String user_id;
	public String user_pw;
	public Date user_date;
	public String user_email;
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public Date getUser_date() {
		return user_date;
	}
	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	@Override
	public String toString() {
	return "usersDto [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_email=" + user_email + ", user_date=" + user_date + "]";
	 }

}
