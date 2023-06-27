package com.kids.service.report;

import java.util.List;

import com.kids.dto.report.ReportDto;

public interface ReportService {
	
	public List<ReportDto> getReportedList();
	
	public List<ReportDto> getReportedListById(ReportDto reportDto);
	
	public int getReportedStatusAsConfirmed(ReportDto reportDto);
	
	public int getReportedStatusAsRejected(ReportDto reportDto);

	public int getReportCount(ReportDto reportDto);
	
}
