package com.kids.dto.matching;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchingDetailDto {
	
	public int matchingNumber;
	public String scheduleCode;
	public String day;
	public String status;
}
