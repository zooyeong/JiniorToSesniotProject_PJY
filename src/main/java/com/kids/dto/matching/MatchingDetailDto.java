package com.kids.dto.matching;

import lombok.Data;

@Data
public class MatchingDetailDto {
	int matchingNumber;
	String scheduleCode;
	String day;
	String status;
	String pickUpPlace;
	String arrivePlace;
	String parId;
}
