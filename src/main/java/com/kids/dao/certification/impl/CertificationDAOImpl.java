package com.kids.dao.certification.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.certification.CertificationDAO;
import com.kids.dto.certification.CertificationDTO;

@Repository
public class CertificationDAOImpl implements CertificationDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public int saveCertification(CertificationDTO certificationDTO) {
    	int result = sqlSession.insert("certificationDAO.saveCertification", certificationDTO);
    	return result;
    }
}
