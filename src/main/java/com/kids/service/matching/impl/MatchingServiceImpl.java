package com.kids.service.matching.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.matching.MatchingDao;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;
import com.kids.service.matching.MatchingService;

import java.util.Map;

import com.kids.dto.matching.MailDto;

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
	
	@Override
	public int saveMatchingInfo(MatchingDto matchingDto) {
		// TODO Auto-generated method stub
		int result = matchingDao.saveMatchingInfo(matchingDto);
		return result;
	}

	@Override
	public int getMatchingNumber() {
		// TODO Auto-generated method stub
		int result = matchingDao.getMatchingNumber();
		return result;
	}

	@Override
	public MatchingDto getMatchingInfo(int num) {
		// TODO Auto-generated method stub
		MatchingDto result = matchingDao.getMatchingInfo(num);
		return result;
	}

	@Override
	public int save_mail(MailDto mailDto) {
		// TODO Auto-generated method stub
		int result = matchingDao.sava_mail(mailDto);
		return result;
	}

	@Override
	public List<MailDto> getSeniorMailById(String id) {
		// TODO Auto-generated method stub
		List<MailDto> list = matchingDao.getSeniorMailById(id);
		return list;
	}
	
	@Override
	public List<MailDto> getParentsMailById(String id) {
		// TODO Auto-generated method stub
		List<MailDto> list = matchingDao.getParentsMailById(id);
		return list;
	}

	@Override
	public int updateMailStatus(MailDto mailDto) {
		// TODO Auto-generated method stub
		int result = matchingDao.updateMailStatus(mailDto);
		return result;
	}

	@Override
	public int updateMatchingMStatus(MatchingDto matchingDto) {
		// TODO Auto-generated method stub
		int result = matchingDao.updateMatchingMStatus(matchingDto);
		return result;
	}

	@Override
	public int updateMatchingDStatus(MatchingDetailDto matchingDetailDto) {
		// TODO Auto-generated method stub
		int result = matchingDao.updateMatchingDStatus(matchingDetailDto);
		return result;
	}

	@Override
	public int saveMathingDetail(MatchingDetailDto matchingDetailDto) {
		// TODO Auto-generated method stub
		int result = matchingDao.saveMathingDetail(matchingDetailDto);
		return result;
	}

	@Override
	public int countSeniorMailById(String id) {
		// TODO Auto-generated method stub
		int result = matchingDao.countSeniorMailById(id);
		return result;
	}
	/* session 정보에 userCode 담으면 합쳐질 코드 */
	@Override
	public int countParentsMailById(String id) {
		// TODO Auto-generated method stub
		int result = matchingDao.countParentsMailById(id);
		return result;
	}

	@Override
	public List<MatchingDetailDto> selectMatchingDetail(int matchingNumber) {
		// TODO Auto-generated method stub
		List<MatchingDetailDto> list = matchingDao.selectMatchingDetail(matchingNumber);
		return list;
	}

	@Override
	public MatchingDetailDto selectMatchingDLast(int num) {
		// TODO Auto-generated method stub
		MatchingDetailDto result = matchingDao.selectMatchingDLast(num);
		return result;
	}

}
