package com.kids.service.matching.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.matching.MatchingDao;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;
import com.kids.service.matching.MatchingService;

@Service
public class MatchingServiceImpl implements MatchingService{
	
	@Autowired
	MatchingDao matchingDao;

	@Override
	public List<MatchingDto> getMatchingLogList(int displayPost, int postNum) {
		// TODO Auto-generated method stub
		List<MatchingDto> matchingLogList = matchingDao.selectMatchingLogList(displayPost, postNum);
		
		return matchingLogList;
	}

	@Override
	public List<MatchingDto> getMatchingLogListBySnrId(MatchingDto matchingDto) {
		// TODO Auto-generated method stub
		List<MatchingDto> matchingLogList = matchingDao.selectMatchingLogListBySnrId(matchingDto);
		
		return matchingLogList;
	}
	
	@Override
	public List<MatchingDto> getMatchingLogListByPnrId(MatchingDto matchingDto) {
		// TODO Auto-generated method stub
		List<MatchingDto> matchingLogList = matchingDao.selectMatchingLogListByParId(matchingDto);
		
		return matchingLogList;
	}

	@Override
	public List<MatchingDetailDto> getMatchingDetailByMatchingNum(MatchingDetailDto matchingDetailDto) {
		// TODO Auto-generated method stub
		List<MatchingDetailDto> matchingDetail = matchingDao.selectMatchingDetailByMatchingNumber(matchingDetailDto);
		
		return matchingDetail;
	}

	@Override
	public int getMatchingCount() {
		// TODO Auto-generated method stub
		int result = matchingDao.selectMatchingCount();
		return result;
	}
}
