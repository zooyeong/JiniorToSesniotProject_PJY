package com.kids.service.report.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.report.ReportDao;
import com.kids.dto.report.ReportDto;
import com.kids.service.report.ReportService;

@Service
public class ReportSeviceImpl implements ReportService {
	
	@Autowired
	ReportDao reportDao;

	@Override
	public List<ReportDto> getReportedList(int displayArticle, int articleNum) {
		// TODO Auto-generated method stub
		
		List<ReportDto> reportList = reportDao.selectReportedList(displayArticle, articleNum);
		
		return reportList;
	}

	@Override
	public List<ReportDto> getReportedListById(ReportDto reportDto) {
		// TODO Auto-generated method stub
		
		List<ReportDto> reportList = reportDao.selectReportedListById(reportDto);

		return reportList;
	}

	@Override
	public int getReportedStatusAsConfirmed(ReportDto reportDto) {
		// TODO Auto-generated method stub
		
		int result = reportDao.updateReportedStatusAsConfirmed(reportDto);
		
		return result;
	}
	
	@Override
	public int getReportedStatusAsRejected(ReportDto reportDto) {
		// TODO Auto-generated method stub
		int result = reportDao.updateReportedStatusAsRejected(reportDto);
		return result;
	}

	@Override
	public int getReportCount(ReportDto reportDto) {
		// TODO Auto-generated method stub
		int result = reportDao.updateReportCount(reportDto);
		return result;
	}

	@Override
	public int getReportCount() {
		// TODO Auto-generated method stub
		int result = reportDao.selectReportCount();
		return result;
	}

}
