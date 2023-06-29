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
	

}