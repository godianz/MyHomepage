package com.study.springboot.service;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.study.springboot.dto.usersDto;

@Component
public class UsersService {
	
	 public String loginCheck(usersDto dto, HttpSession session);
	 

}