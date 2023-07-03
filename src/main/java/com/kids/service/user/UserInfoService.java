package com.kids.service.user;

import java.util.Map;

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
	int insertSnrSchedule(Map<String, String> map);

	int insertAgreement(UserInfo_Dto userInfo_dto);

    // 로그인 ID와 비밀번호 확인 함수 수정: UserInfo_Dto 객체를 반환하는 메서드로 변경
    UserInfo_Dto logInCheck(UserInfo_Dto lgChk);

	

	
}
