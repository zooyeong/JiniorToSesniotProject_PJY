package com.kids.dto.matching;

import lombok.Data;

@Data
public class MatchingDto {
	int matchingNumber;
	String snrId;
	String parId;
	String startDate;
	String endDate;
	String scheduleCode;
	String pickUpPlace;
	String arrivePlace;
	String status;
}
