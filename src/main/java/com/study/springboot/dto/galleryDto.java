package com.study.springboot.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class galleryDto {
	
	private int gallery_idx;
	private String gallery_title;
	private String gallery_image;
	private String gallery_content;
	private Date gallery_date;
	private String gallery_id;

}
