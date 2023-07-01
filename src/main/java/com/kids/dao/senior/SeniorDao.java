package com.kids.dao.senior;

import java.util.List;

import com.kids.dto.senior.SeniorDto;

public interface SeniorDao {
	
	public List<SeniorDto> selectVerificationList(int displayArticle, int articleNum);
	
	public List<SeniorDto> selectVerificationListById(SeniorDto seniorDto);
	
	public int updateVerificationStatusAsCertified(SeniorDto seniorDto);

	public int updateVerificationStatusAsRejected(SeniorDto seniorDto);

	public int selectRegisterCount();
	
}
