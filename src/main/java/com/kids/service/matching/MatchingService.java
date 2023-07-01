package com.kids.service.matching;

import java.util.List;

import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;

import java.util.Map;

import com.kids.dto.matching.MailDto;

public interface MatchingService {
	
	public List<MatchingDto> getMatchingLogList(int displayPost, int postNum);

	public List<MatchingDto> getMatchingLogListBySnrId(MatchingDto matchingDto);
	
	public List<MatchingDto> getMatchingLogListByPnrId(MatchingDto matchingDto);

	public List<MatchingDetailDto> getMatchingDetailByMatchingNum(MatchingDetailDto matchingDetailDto);

	public int getMatchingCount();

	public int saveMatchingInfo(MatchingDto matchingDto);
	public int getMatchingNumber();
	public MatchingDto getMatchingInfo(int num);
	public int save_mail(MailDto mailDto);
	public List<MailDto> getSeniorMailById(String id);
	public List<MailDto> getParentsMailById(String id);
	public int updateMailStatus(MailDto mailDto);
	public int updateMatchingMStatus(MatchingDto matchingDto);
	public int updateMatchingDStatus(MatchingDetailDto matchingDetailDto);
	public int saveMathingDetail(MatchingDetailDto matchingDetailDto);
	public int countSeniorMailById(String id);
	public int countParentsMailById(String id);
	public List<MatchingDetailDto> selectMatchingDetail(String id);
	public MatchingDetailDto selectMatchingDLast(int num);
}
