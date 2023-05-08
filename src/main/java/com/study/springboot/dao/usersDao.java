package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.usersDto;

@Mapper
public interface usersDao {
	
	//로그인
	public String loginCheck(usersDto userDto);
	

}
