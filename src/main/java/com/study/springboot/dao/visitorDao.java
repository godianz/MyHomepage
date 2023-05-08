package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.visitorDto;

@Mapper
public interface visitorDao {

	//방명록 등록
	void visitorRegister(Map<String, String> register);
	
	//방명록 조회
	public List<visitorDto> visitorView();

	//방명록 삭제 
	int deleteVisitor(int visitor_idx);

	//방명록 수정
	void reviseVisitor(Map<String, String> revise);

}
