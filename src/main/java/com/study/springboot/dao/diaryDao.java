package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.diaryDto;

@Mapper
public interface diaryDao {

	//게시글 목록 개수
	public int listCount();

	//게시글 목록 조회
	public List<diaryDto> list();

	//게시글 목록
	public diaryDto content(int diary_idx);

	//게시글쓰기
	public void insertDiary(Map<String, String> dto);
	
	//게시글 삭제
	public int deleteDiary(int parseInt);

	//게시글 수정
	public void reviseDiary(Map<String, String> dto);

}
