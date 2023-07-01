package com.kids.service.senior;

import java.util.List;

import com.kids.dto.senior.SeniorDto;

public interface SeniorService {

	public List<SeniorDto> getSeniorVerificationList(int displayArticle, int articleNum);

	public List<SeniorDto> getSeniorVerificationListById(SeniorDto seniorDto);
	
	public int setSeniorVerificationStatusAsCertified(SeniorDto seniorDto);

	public int setSeniorVerificationStatusAsRejected(SeniorDto seniorDto);

	public int getRegisterCount();
	
}
