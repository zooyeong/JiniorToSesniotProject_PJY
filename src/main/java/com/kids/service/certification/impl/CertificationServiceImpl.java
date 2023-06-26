package com.kids.service.certification.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kids.dao.certification.CertificationDAO;
import com.kids.dto.certification.CertificationDTO;
import com.kids.service.certification.CertificationService;
import com.kids.service.certification.CertificationService;
@Service
public class CertificationServiceImpl implements CertificationService {

    @Value("${file.upload.path}") // 프로퍼티에서 파일 업로드 경로 가져오기
    private String fileUploadPath;

    private final CertificationDAO certificationDAO;

    public CertificationServiceImpl(CertificationDAO certificationDAO) {
        this.certificationDAO = certificationDAO;
    }

    @Override
    public String uploadFile(MultipartFile file) {
        String fileName = generateFileName(file.getOriginalFilename()); // 파일 이름 생성
        String filePath = fileUploadPath + fileName; // 파일 경로 생성

        try {
            File dest = new File(filePath);
            file.transferTo(dest); // 파일 업로드
        } catch (IOException e) {
            e.printStackTrace();
            // 파일 업로드 실패 처리
        }

        return filePath; // 업로드된 파일 경로 반환
    }

    

    private String generateFileName(String originalFileName) {
        String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        String fileName = UUID.randomUUID().toString(); // 고유한 파일 이름 생성
        return fileName + "." + extension;
    }

	@Override
	public int saveCertification(CertificationDTO certificationDTO) {
		int result= certificationDAO.saveCertification(certificationDTO);
		return result;
		 
		
		// TODO Auto-generated method stub
		
	}
}
