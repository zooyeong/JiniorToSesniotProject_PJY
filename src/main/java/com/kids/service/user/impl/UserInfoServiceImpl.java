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
	
	/*
	 * @Override public void insertInfo(UserInfo_Dao userInfo_dao) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 * 
	 * @Override public void insertInfo(UserInfo_Dto userInfo_dto) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 * 
	 * @Override public void insertInfo2(UserInfo_Dao userInfo_dao) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 * 
	 * @Override public void insertInfo2(UserInfo_Dto userInfo_dto) { // TODO
	 * Auto-generated method stub
	 * 
	 * }
	 */
	
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

	@Override
	public int insertDaoInfo(UserInfo_Dao userInfo_dao) {
	    // UserInfo_Dao 객체를 사용하여 데이터베이스에 레코드 추가하는 코드 작성
	    int result = userInfo_dao.insertUserDao(userInfo_dao);
	    return result;
	}

	@Override
	public int insertDtoInfo(UserInfo_Dto userInfo_dto) {
	    // UserInfo_Dto 객체를 사용하여 데이터베이스에 레코드 추가하는 코드 작성
	    int result = userInfo_dao.insertUserDto(userInfo_dto);
	    return result;
	}

	@Override
	public int insertUserPar(UserInfo_Dto userInfo_dto) {
		// TODO Auto-generated method stub
        return userInfo_dao.insertUserPar(userInfo_dto);

	}

	@Override
	public int insertUserSnr(UserInfo_Dto userInfo_dto) {
		// TODO Auto-generated method stub
        return userInfo_dao.insertUserSnr(userInfo_dto);
	}

	@Override
	public int insertAgreement(UserInfo_Dto userInfo_dto) {
		// TODO Auto-generated method stub
        return userInfo_dao.inserAgreement(userInfo_dto);
	}
	
    @Override
    public UserInfo_Dto logInCheck(UserInfo_Dto lgChk) {

    	UserInfo_Dto result = userInfo_dao.logInChk(lgChk);
        return result;
    }
	
}
