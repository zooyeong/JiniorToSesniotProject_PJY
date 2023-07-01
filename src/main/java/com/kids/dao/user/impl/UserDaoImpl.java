package com.kids.dao.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.user.UserDao;
import com.kids.dto.user.UserDto;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public UserDto getUserInfoById(String id) {
		// TODO Auto-generated method stub
		UserDto userDto = sqlSessionTemplate.selectOne("user_mapper.select_user_info_by_id", id);
		return userDto;
	}

	@Override
	public int updateUserPassword(UserDto userDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("user_mapper.update_user_password", userDto);
		return result;
	}
}
