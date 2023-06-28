package com.kids.service.user.impl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.UserInfo_Dao;
import com.kids.dto.UserInfo_Dto;
import com.kids.service.user.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	UserInfo_Dao userInfo_dao;
	
	@Override
	public void insertInfo(UserInfo_Dao userInfo_dao) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertInfo(UserInfo_Dto userInfo_dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idChk(String id) {
		// TODO Auto-generated method stub
		int result = userInfo_dao.idChk(id);

		return result;
	}








}
