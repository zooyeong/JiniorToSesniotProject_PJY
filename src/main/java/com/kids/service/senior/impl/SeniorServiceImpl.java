package com.kids.service.senior.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.senior.SeniorDao;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;
import com.kids.service.senior.SeniorService;

@Service
public class SeniorServiceImpl implements SeniorService{

	@Autowired
	SeniorDao seniorDao;

//	@Override
//	public List<SeniorListDto> getSeniorList() {
//		// TODO Auto-generated method stub
//		List<SeniorListDto> list = seniorListDao.selectSeniorList();
//		
//		return list;
//	}
//
//	@Override
//	public List<SeniorSNRDto> getSeniorSNRList() {
//		// TODO Auto-generated method stub
//		List<SeniorSNRDto> list = seniorListDao.selectSeniorSNRList();
//		
//		return list;
//	}

	@Override
	public List<SeniorDetailDto> getSeniorDetail() {
		// TODO Auto-generated method stub
		List<SeniorDetailDto> list = seniorDao.selectSeniorDetail();
		
		return list;
	}

	@Override
	public SeniorDetailDto getSeniorDetailById(String id) {
		// TODO Auto-generated method stub
		SeniorDetailDto senior = seniorDao.selectSeniorDetailById(id);
		return senior;
	}

	@Override
	public int updateUserInfo(SeniorDetailDto seniorDetail) {
		// TODO Auto-generated method stub
		int result = seniorDao.updateUserInfo(seniorDetail);
		return result;
	}

	@Override
	public List<SeniorScheduleDto> getSeniorEnableSchedule(String id) {
		// TODO Auto-generated method stub
		List<SeniorScheduleDto> list = seniorDao.selectSeniorEnableSchedule(id);
		return list;
	}

	@Override
	public int updateSchedule(Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = seniorDao.updateSchedule(map);
		return result;
	}

}
