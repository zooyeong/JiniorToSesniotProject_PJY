package com.kids.dao.matching.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.matching.MatchingDao;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;

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


}
