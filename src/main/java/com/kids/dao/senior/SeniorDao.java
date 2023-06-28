package com.kids.dao.senior;

import java.util.List;

import com.kids.dto.senior.SeniorDto;

public interface SeniorDao {
	
	public List<SeniorDto> selectVerificationList();
	
	public List<SeniorDto> selectVerificationListById(SeniorDto seniorDto);
	
	public int updateVerificationStatusAsCertified(SeniorDto seniorDto);
	
}
