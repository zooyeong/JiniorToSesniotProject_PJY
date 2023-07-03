package com.kids.dao;

import java.util.List;
import java.util.Map;

import com.kids.dto.*;

public interface UserInfo_Dao {
	
	public int insertUser(UserInfo_Dto userInfo_dto);
	public List<UserInfo_Dto> selectUesrList(UserInfo_Dto userInfo_dto);

	
	public int insertUserPar(UserInfo_Dto userInfo_dto);
	public int insertUserSnr(UserInfo_Dto userInfo_dto);
	public int insertSnrSchedule(Map<String, String> map);
	public int inserAgreement(UserInfo_Dto userInfo_dto);
	
	public int idChk(String id);
	int insertUser2(UserInfo_Dto userInfo_dto);
	
    // insertUserDao 메서드를 추가합니다.
    public int insertUserDao(UserInfo_Dao userInfo_dao);

    // insertUserDto 메서드를 추가합니다.
    public int insertUserDto(UserInfo_Dto userInfo_dto);
    
    
    //로그인 할때 아이디 비밀번호 체크
	public UserInfo_Dto logInChk(UserInfo_Dto userInfo_Dto);

}