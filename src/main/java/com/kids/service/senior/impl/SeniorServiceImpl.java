package com.kids.service.senior.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.senior.SeniorDao;
import com.kids.dto.senior.SeniorDto;
import com.kids.dto.user.UserDto;
import com.kids.service.senior.SeniorService;

@Service
public class SeniorServiceImpl implements SeniorService {
	
	@Autowired
	SeniorDao seniorDao;

	@Override
	public List<SeniorDto> getSeniorVerificationList() {
		// TODO Auto-generated method stub

		List<SeniorDto> seniorVeriList = seniorDao.selectVerificationList();
		
		return seniorVeriList;
	}

	@Override
	public List<SeniorDto> getSeniorVerificationListById(SeniorDto seniorDto) {
		// TODO Auto-generated method stub

		List<SeniorDto> seniorVeriList = seniorDao.selectVerificationListById(seniorDto);
		
		return seniorVeriList;
	}

	@Override
	public int setSeniorVerificationStatusAsCertified(SeniorDto seniorDto) {
		// TODO Auto-generated method stub
		
		int result = seniorDao.updateVerificationStatusAsCertified(seniorDto);
		
		return result;
	}

}
