package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class diaryDto {
	
	private int diary_idx;
	private String diary_title;
	private String diary_content;
	private Date diary_date;

}
