package com.kids.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.user.UserDao;
import com.kids.dto.user.UserDto;
import com.kids.service.user.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDao userDao;

	@Override
	public int getUserCodeAsBlack(UserDto userDto) {
		// TODO Auto-generated method stub
		
		int result = userDao.updateUserCodeAsBlack(userDto);
		
		return result;
	}
	
	
}
