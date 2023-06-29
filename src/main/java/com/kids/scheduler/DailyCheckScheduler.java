package com.kids.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.kids.dto.matching.MatchingDetailDto;
import com.kids.service.matching.MatchingService;
import com.kids.service.senior.SeniorService;

public class DailyCheckScheduler {

	@Autowired
	SeniorService seniorService;
	
	@Autowired
	MatchingService matchingService;
	
	@Scheduled(cron = "0 0 4 * * *")
	public void runMatchindDataCheck() {
		
//		MatchingDetailDto selectLastDayDto = matchingService.selectMatchingDLast(matchingDetailDto.getMatchingNumber());
	}
}
