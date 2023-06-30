package com.kids.dao;

import java.util.List;

import com.kids.dto.*;

public interface UserInfo_Dao {
	
	public int insertUser(UserInfo_Dto userInfo_dto);
	public List<UserInfo_Dto> selectUesrList(UserInfo_Dto userInfo_dto);

	
	public int insertUserPar(UserInfo_Dto userInfo_dto);
	public int insertUserSnr(UserInfo_Dto userInfo_dto);
	public int inserAgreement(UserInfo_Dto userInfo_dto);
	
	public int idChk(String id);
	int insertUser2(UserInfo_Dto userInfo_dto);
	
    // insertUserDao 메서드를 추가합니다.
    public int insertUserDao(UserInfo_Dao userInfo_dao);

    // insertUserDto 메서드를 추가합니다.
    public int insertUserDto(UserInfo_Dto userInfo_dto);

}