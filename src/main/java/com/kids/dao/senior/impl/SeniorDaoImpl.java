package com.kids.dao.senior.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.senior.SeniorDao;
import com.kids.dto.senior.SeniorDto;

@Repository
public class SeniorDaoImpl implements SeniorDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<SeniorDto> selectVerificationList() {
		// TODO Auto-generated method stub
		List<SeniorDto> list = 
				sqlSessionTemplate.selectList("senior_mapper.select_senior_verification_list");
		
		return list;
	}

	@Override
	public List<SeniorDto> selectVerificationListById(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		
		List<SeniorDto> list = sqlSessionTemplate.selectList("senior_mapper.select_senior_verification_list_by_id", seniorDto);
		return list;
	}

	@Override
	public int updateVerificationStatusAsCertified(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("senior_mapper.update_verification_status_as_Y", seniorDto);
		return result;
	}

}
