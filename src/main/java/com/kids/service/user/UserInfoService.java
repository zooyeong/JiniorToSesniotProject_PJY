package com.kids.service.user;

import com.kids.dao.UserInfo_Dao;
import com.kids.dto.UserInfo_Dto;

public interface UserInfoService {
	
	//회원가입 Service
	public void insertInfo(UserInfo_Dao userInfo_dao);

	public int idChk(String id);

	void insertInfo(UserInfo_Dto userInfo_dto);
///////
	void insertInfo2(UserInfo_Dao userInfo_dao);

	void insertInfo2(UserInfo_Dto userInfo_dto);

	public int insertUser(UserInfo_Dto userInfo_dto);





	
}
