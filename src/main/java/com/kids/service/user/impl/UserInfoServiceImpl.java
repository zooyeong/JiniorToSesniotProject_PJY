package com.kids.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.kids.dao.UserInfo_Dao;

import com.kids.service.user.UserInfoService;

public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	UserInfo_Dao userInfo_dao;
	
	@Override
	public void insertInfo(UserInfo_Dao userInfo_dao) {
		// TODO Auto-generated method stub
		
	}



}
