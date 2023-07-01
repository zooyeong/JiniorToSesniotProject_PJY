package com.kids.dto.matching;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchingDetailDto {

	int matchingNumber;
	String scheduleCode;
	String day;
	String status;
	String pickUpPlace;
	String arrivePlace;
	String parId;

}
