package com.kids.service.matching;

import java.util.List;
import java.util.Map;

import com.kids.dto.matching.MailDto;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;

public interface MatchingService {
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
