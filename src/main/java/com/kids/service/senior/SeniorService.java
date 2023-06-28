package com.kids.service.senior;

import java.util.List;

import com.kids.dto.senior.SeniorDto;

public interface SeniorService {

	public List<SeniorDto> getSeniorVerificationList();

	public List<SeniorDto> getSeniorVerificationListById(SeniorDto seniorDto);
	
	public int setSeniorVerificationStatusAsCertified(SeniorDto seniorDto);
	
}
