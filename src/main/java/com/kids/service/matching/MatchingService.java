package com.kids.service.matching;

import java.util.List;

import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;

public interface MatchingService {
	
	public List<MatchingDto> getMatchingLogList(int displayPost, int postNum);

	public List<MatchingDto> getMatchingLogListBySnrId(MatchingDto matchingDto);
	
	public List<MatchingDto> getMatchingLogListByPnrId(MatchingDto matchingDto);

	public List<MatchingDetailDto> getMatchingDetailByMatchingNum(MatchingDetailDto matchingDetailDto);

	public int getMatchingCount();
	

}
