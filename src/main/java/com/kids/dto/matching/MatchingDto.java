package com.kids.dto.matching;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
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
