package com.kids.dao.userInfo.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.UserInfo_Dao;
import com.kids.dto.UserInfo_Dto;

@Repository
public class UserInfoDao_impl implements UserInfo_Dao{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertUser(UserInfo_Dto userInfo_dto) {

		int result = sqlSessionTemplate.insert("userInfo_mapper.insertUser", userInfo_dto);


		return result;
	}
	
	@Override
	public int insertUser2(UserInfo_Dto userInfo_dto) {

		int result = sqlSessionTemplate.insert("userInfo_mapper.insert_userInfo2", userInfo_dto);

		return result;
	}

	@Override
	public List<UserInfo_Dto> selectUesrList(UserInfo_Dto userInfo_dto) {


		return sqlSessionTemplate.selectList("userInfo_mapper.select_userList", userInfo_dto);
	
	}
	//
	@Override
	public int insertUserPar(UserInfo_Dto userInfo_dto) {

		int result = sqlSessionTemplate.insert("userInfo_mapper.insert_parent_userInfo", userInfo_dto);


		return result;
	}


	//
	@Override
	public int insertUserSnr(UserInfo_Dto userInfo_dto) {

		int result = sqlSessionTemplate.insert("userInfo_mapper.insert_senior_userInfo", userInfo_dto);


		return result;
	}

	@Override
	public int inserAgreement(UserInfo_Dto userInfo_dto) {

		int result = sqlSessionTemplate.insert("userInfo_mapper.insert_agreement_userInfo", userInfo_dto);


		return result;
	}

	@Override
	public int idChk(String id) {
		UserInfo_Dto userInfo_Dto = new UserInfo_Dto();
		userInfo_Dto.setId(id);
		System.out.println("DAO ID  : "+ id);
		int result = sqlSessionTemplate.selectOne("userInfo_mapper.idChk", userInfo_Dto);

		return result;
	}

	@Override
	public int insertUserDao(UserInfo_Dao userInfo_dao) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertUserDto(UserInfo_Dto userInfo_dto) {
		// TODO Auto-generated method stub
		return 0;
	}






	
	
}
