package com.kids.dao.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.user.UserDao;
import com.kids.dto.report.ReportDto;
import com.kids.dto.user.UserDto;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int updateUserCodeAsBlack(UserDto userDto) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("report_mapper.update_user_code_as_Black", userDto);
		
		return result;
	}

	
	
	
}
