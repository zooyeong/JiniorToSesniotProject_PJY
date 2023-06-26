package com.kids.dao.report.impl;

import com.kids.dao.report.ReportUserDAO;
import com.kids.dto.report.ReportUserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportUserDAOImpl implements ReportUserDAO {
    private static final String NAMESPACE = "com.kids.mapper.reportUser";

    private final SqlSession sqlSession;

    @Autowired
    public ReportUserDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void insertReportUser(ReportUserDTO reportUserDTO) {
        sqlSession.insert(NAMESPACE + ".insertReportUser", reportUserDTO);
    }
}
