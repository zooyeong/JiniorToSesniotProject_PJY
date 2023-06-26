package com.kids.service.senior;

import java.util.List;
import java.util.Map;

import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;

public interface SeniorService {
//	public List<SeniorListDto> getSeniorList();
//	public List<SeniorSNRDto> getSeniorSNRList();
	public List<SeniorDetailDto> getSeniorDetail();
	public SeniorDetailDto getSeniorDetailById(String id);
	public int updateUserInfo(SeniorDetailDto seniorDetail);
	public List<SeniorScheduleDto> getSeniorEnableSchedule(String id);
	public int updateSchedule(Map<String, String> map);
}
