package com.kids.dao.senior.impl;

import java.util.HashMap;
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
	public List<SeniorDto> selectVerificationList(int displayArticle, int articleNum) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("displayArticle", displayArticle);
		map.put("articleNum", articleNum);
		
		List<SeniorDto> list = 
				sqlSessionTemplate.selectList("senior_mapper.select_senior_verification_list", map);
		
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

	@Override
	public int updateVerificationStatusAsRejected(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("senior_mapper.update_verification_status_as_Rejected", seniorDto);
		return result;
	}

	@Override
	public int selectRegisterCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("senior_mapper.select_register_count");
		return result;
	}
}
