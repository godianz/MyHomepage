package com.study.springboot.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.springboot.dto.usersDto;

@Repository
public class userDaoImpl implements usersDao  {
	
	@Autowired
	SqlSession sqlSession; // SqlSession 의존관계 주입

	@Override
	public String loginCheck(usersDto dto) {
	return sqlSession.selectOne("com.study.springboot.dao.usersDao.login", dto);
	 }

}
