package com.kids.dto.report;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportDto {
	
	public int reportNum;
	public String parentId;  
	public String seniorId;
	public String name;
	public String reportedReason;
	public String reportDate;  
	public String reportConfirmStatus;
	public String reportConfirmStatusPrint;
	
	public int reportCount;
	
}
