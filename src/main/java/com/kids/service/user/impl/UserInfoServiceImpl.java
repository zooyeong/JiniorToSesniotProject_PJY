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
	public void insertInfo2(UserInfo_Dao userInfo_dao) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertInfo2(UserInfo_Dto userInfo_dto) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public int idChk(String id) {
		// TODO Auto-generated method stub
		int result = userInfo_dao.idChk(id);

		return result;
	}

	@Override
    public int insertUser(UserInfo_Dto userInfo_dto) {
        // DB에 저장하고 결과를 반환
        return userInfo_dao.insertUser(userInfo_dto);
    }
}
