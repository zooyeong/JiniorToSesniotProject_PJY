package com.kids.dao.senior.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.senior.SeniorDao;
import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;

@Repository
public class SeniorDaoImpl implements SeniorDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
//	@Override
//	public List<SeniorListDto> selectSeniorList() {
//		// TODO Auto-generated method stub
//		List<SeniorListDto> list = sqlSessionTemplate.selectList("seniorList_mapper.select_senior_list");
//		
//		return list;
//	}
//
//	@Override
//	public List<SeniorSNRDto> selectSeniorSNRList() {
//		// TODO Auto-generated method stub
//		List<SeniorSNRDto> list = sqlSessionTemplate.selectList("seniorList_mapper.select_senior_info");
//		return list;
//	}

	@Override
	public List<SeniorDetailDto> selectSeniorDetail() {
		// TODO Auto-generated method stub
		List<SeniorDetailDto> list = sqlSessionTemplate.selectList("senior_mapper.select_senior_detail");
		
		return list;
	}

	@Override
	public SeniorDetailDto selectSeniorDetailById(String id) {
		// TODO Auto-generated method stub
		SeniorDetailDto senior = sqlSessionTemplate.selectOne("senior_mapper.select_senior_detail_by_id", id);
		return senior;
	}

	@Override
	public int updateUserInfo(SeniorDetailDto seniorDetail) {
		// TODO Auto-generated method stub
		int result_info = sqlSessionTemplate.update("senior_mapper.update_user_info", seniorDetail);
		int result_snr = sqlSessionTemplate.update("senior_mapper.update_snr", seniorDetail);
		
		return result_info+result_snr;
	}

	@Override
	public List<SeniorScheduleDto> selectSeniorEnableSchedule(String id) {
		// TODO Auto-generated method stub
		List<SeniorScheduleDto> list = sqlSessionTemplate.selectList("senior_mapper.select_senior_schedule_by_id", id);
		return list;
	}

	@Override
	public int updateSchedule(Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("senior_mapper.update_schedule", map);
		
		return result;
	}

	@Override
	public ImageFileDTO selectImgById(String id) {
		// TODO Auto-generated method stub
		
		ImageFileDTO result = sqlSessionTemplate.selectOne("senior_mapper.select_img_by_id", id);
		
		return result;
	}

	@Override
	public int updateScheduleWorkStatus(Map<String, String> map) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("senior_mapper.update_schedule_work_status", map);
		return result;
	}

}
