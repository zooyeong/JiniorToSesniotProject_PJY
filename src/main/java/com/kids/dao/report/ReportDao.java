package com.kids.dao.report;

import java.util.List;

import com.kids.dto.report.ReportDto;

public interface ReportDao {
	
	public List<ReportDto> selectReportedList(int displayArticle, int articleNum);
	
	public List<ReportDto> selectReportedListById(ReportDto reportDto);
	
	public int updateReportedStatusAsConfirmed(ReportDto reportDto);
	
	public int updateReportedStatusAsRejected(ReportDto reportDto);
	
	public int updateReportCount(ReportDto reportDto);
	
	public int selectReportCount();
	
	
}