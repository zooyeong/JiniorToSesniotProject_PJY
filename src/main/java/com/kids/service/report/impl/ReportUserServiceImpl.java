package com.kids.service.report.impl;

import com.kids.dao.report.ReportUserDAO;
import com.kids.dto.report.ReportUserDTO;
import com.kids.service.report.ReportUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class ReportUserServiceImpl implements ReportUserService {
    private final ReportUserDAO reportUserDAO;

    @Autowired
    public ReportUserServiceImpl(ReportUserDAO reportUserDAO) {
        this.reportUserDAO = reportUserDAO;
    }

    @Override
    public void saveReportUser(ReportUserDTO reportUserDTO) {
        reportUserDTO.setReportDate(new Date());
        reportUserDAO.insertReportUser(reportUserDTO);
    }
}
