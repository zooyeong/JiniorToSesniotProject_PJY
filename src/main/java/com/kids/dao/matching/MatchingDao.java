package com.kids.dao.matching;

import java.util.List;


import com.kids.dto.matching.MailDto;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;


public interface MatchingDao {
	
	public List<MatchingDto> selectMatchingLogList(int displayPost, int postNum);

	public List<MatchingDto> selectMatchingLogListBySnrId(MatchingDto matchingDto);

	public List<MatchingDto> selectMatchingLogListByParId(MatchingDto matchingDto);

	public List<MatchingDetailDto> selectMatchingDetailByMatchingNumber (MatchingDetailDto matchingDetailDto);

	public int selectMatchingCount();

	public int saveMatchingInfo(MatchingDto matchingDto);
	public int getMatchingNumber();
	public MatchingDto getMatchingInfo(int num);
	public int sava_mail(MailDto mailDto);
	public List<MailDto> getSeniorMailById(String id);
	public List<MailDto> getParentsMailById(String id);
	public int updateMailStatus(MailDto mailDto);
	public int updateMatchingMStatus(MatchingDto matchingDto);
	public int updateMatchingDStatus(MatchingDetailDto matchingDetailDto);
	public int saveMathingDetail(MatchingDetailDto matchingDetailDto);
	public int countSeniorMailById(String id);
	public int countParentsMailById(String id);
	public List<MatchingDetailDto> selectMatchingDetail(int matchingNumber);
	public MatchingDetailDto selectMatchingDLast(int num);
}
