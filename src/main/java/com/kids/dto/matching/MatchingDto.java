package com.kids.dto.matching;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MatchingDto {
	public int matchingNumber;
	public String snrId;
	public String parId;
	public String startDate;
	public String endDate;
	public String scheduleCode;
	public String pickUpPlace;
	public String arrivePlace;
	public String status;
	
}
