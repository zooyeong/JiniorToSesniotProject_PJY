package com.kids.service.user;

import com.kids.dao.UserInfo_Dao;
import com.kids.dto.UserInfo_Dto;

public interface UserInfoService {
	
	//회원가입 Service
	int insertDaoInfo(UserInfo_Dao userInfo_dao);
	int insertDtoInfo(UserInfo_Dto userInfo_dto);

	int idChk(String id);

	int insertUser(UserInfo_Dto userInfo_dto);
	int insertUserPar(UserInfo_Dto userInfo_dto);
	int insertUserSnr(UserInfo_Dto userInfo_dto);
	int insertAgreement(UserInfo_Dto userInfo_dto);





	
}
