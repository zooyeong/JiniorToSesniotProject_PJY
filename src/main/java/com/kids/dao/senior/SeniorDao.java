package com.kids.dao.senior;

import java.util.List;
import java.util.Map;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;

public interface SeniorDao {
//	public List<SeniorListDto> selectSeniorList();
//	public List<SeniorSNRDto> selectSeniorSNRList();
	public List<SeniorDetailDto> selectSeniorDetail();
	public SeniorDetailDto selectSeniorDetailById(String id);
	public int updateUserInfo(SeniorDetailDto seniorDetail);
	public List<SeniorScheduleDto> selectSeniorEnableSchedule(String id);
	public int updateSchedule(Map<String, String> map);
	public ImageFileDTO selectImgById(String id);
	public int updateScheduleWorkStatus(Map<String, String> map);
}
