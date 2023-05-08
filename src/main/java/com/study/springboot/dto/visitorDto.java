package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


public class visitorDto {

	public int visitor_idx;
	public String visitor_content;
	public Date visitor_date;
	public String visitor_name;
	public String visitor_pw;
	public String visitor_id;
	
}
