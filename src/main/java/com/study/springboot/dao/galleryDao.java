package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.galleryDto;

@Mapper
public interface galleryDao {

	//사진첩 등록
	int insertGallery(galleryDto dto);
	
	//사진 조회
	public galleryDto gallery(int gallery_idx);

	//사진 목록 조회
	List<galleryDto> galleryDto();

	//사진 수정
	void photoRevise(Map<String, String> revise);
	
	//사진 삭제
	int photoDelete(int gallery_idx);


}
