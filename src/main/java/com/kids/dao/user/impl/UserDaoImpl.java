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
	public List<UserDto> selectUserList() {
		// TODO Auto-generated method stub
		List<UserDto> list = 
				sqlSessionTemplate.selectList("user_mapper.select_user_list");
		
		return list;
	}
	
	@Override
	public List<UserDto> selectUserListById(UserDto userDto) {
		// TODO Auto-generated method stub
		
		List<UserDto> list = 
				sqlSessionTemplate.selectList("user_mapper.select_user_list_by_id", userDto);
		
		return list;
	}

	@Override
	public int updateUserCodeAsBlack(UserDto userDto) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("report_mapper.update_user_code_as_Black", userDto);
		
		return result;
	}

	
	
	
}
