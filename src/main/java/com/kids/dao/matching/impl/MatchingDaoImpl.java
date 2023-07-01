package com.kids.dao.matching.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.matching.MatchingDao;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;

import java.util.Map;

import com.kids.dto.matching.MailDto;

@Repository
public class MatchingDaoImpl implements MatchingDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MatchingDto> selectMatchingLogList(int displayPost, int postNum) {
		// TODO Auto-generated method stub
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("displayPost", displayPost);
		map.put("postNum", postNum);
		
		List<MatchingDto> list = 
				sqlSessionTemplate.selectList("matching_mapper.select_matching_log_list", map);		
		
		return list;
	}

	@Override
	public List<MatchingDto> selectMatchingLogListBySnrId(MatchingDto matchingDto) {
		// TODO Auto-generated method stub
		List<MatchingDto> list = 
				sqlSessionTemplate.selectList("matching_mapper.select_matching_log_list_by_snrId", matchingDto);		
		
		return list;
	}

	@Override
	public List<MatchingDto> selectMatchingLogListByParId(MatchingDto matchingDto) {
		// TODO Auto-generated method stub
		List<MatchingDto> list = 
				sqlSessionTemplate.selectList("matching_mapper.select_matching_log_list_by_parId", matchingDto);		
		
		return list;
	}

	@Override
	public List<MatchingDetailDto> selectMatchingDetailByMatchingNumber(MatchingDetailDto matchingDetailDto) {
		// TODO Auto-generated method stub
		
		List<MatchingDetailDto> list = 
				sqlSessionTemplate.selectList("matching_mapper.select_matching_detail_by_matching_num", matchingDetailDto);		

		return list;
	}

	@Override
	public int selectMatchingCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("matching_mapper.select_matching_count"); 
		
		return result;
	}


	@Override
	public int saveMatchingInfo(MatchingDto matchingDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("matching_mapper.insert_matching_info", matchingDto);
		return result;
	}
	
	@Override
	public int getMatchingNumber() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("matching_mapper.select_max_matching_number");
		return result;
	}

	@Override
	public MatchingDto getMatchingInfo(int num) {
		// TODO Auto-generated method stub
		MatchingDto result = sqlSessionTemplate.selectOne("matching_mapper.select_matching_info", num);
		return result;
	}
	
	@Override
	public int sava_mail(MailDto mailDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("matching_mapper.insert_mail", mailDto);
		return result;
	}

	@Override
	public List<MailDto> getSeniorMailById(String id) {
		// TODO Auto-generated method stub
		List<MailDto> list = sqlSessionTemplate.selectList("matching_mapper.select_senior_mail_by_id", id);
		return list;
	}
	
	@Override
	public List<MailDto> getParentsMailById(String id) {
		// TODO Auto-generated method stub
		List<MailDto> list = sqlSessionTemplate.selectList("matching_mapper.select_parents_mail_by_id", id);
		return list;
	}

	@Override
	public int updateMailStatus(MailDto mailDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("matching_mapper.update_mail_status", mailDto);
		return result;
	}

	@Override
	public int updateMatchingMStatus(MatchingDto matchingDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("matching_mapper.update_matching_m_status", matchingDto);
		return result;
	}

	@Override
	public int updateMatchingDStatus(MatchingDetailDto matchingDetailDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("matching_mapper.update_matching_d_status", matchingDetailDto);
		return result;
	}

	@Override
	public int saveMathingDetail(MatchingDetailDto matchingDetailDto) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("matching_mapper.insert_matching_detail", matchingDetailDto);
		return result;
	}

	@Override
	public int countSeniorMailById(String id) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("matching_mapper.count_senior_mail_by_id", id);
		return result;
	}

	@Override
	public int countParentsMailById(String id) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("matching_mapper.count_parents_mail_by_id", id);
		return result;
	}

	@Override
	public List<MatchingDetailDto> selectMatchingDetail(String id) {
		// TODO Auto-generated method stub
		List<MatchingDetailDto> list = sqlSessionTemplate.selectList("matching_mapper.select_matching_detail", id);
		return list;
	}

	@Override
	public MatchingDetailDto selectMatchingDLast(int num) {
		// TODO Auto-generated method stub
		MatchingDetailDto result = sqlSessionTemplate.selectOne("matching_mapper.select_matching_d_last", num);
		return result;
	}
	
}
