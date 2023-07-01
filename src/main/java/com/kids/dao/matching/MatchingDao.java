package com.kids.dao.matching;

import java.util.List;

import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;

public interface MatchingDao {
	
	public List<MatchingDto> selectMatchingLogList(int displayPost, int postNum);

	public List<MatchingDto> selectMatchingLogListBySnrId(MatchingDto matchingDto);

	public List<MatchingDto> selectMatchingLogListByParId(MatchingDto matchingDto);

	public List<MatchingDetailDto> selectMatchingDetailByMatchingNumber (MatchingDetailDto matchingDetailDto);

	public int selectMatchingCount();

}
