package com.kids.service.certification;

import org.springframework.web.multipart.MultipartFile;

import com.kids.dto.certification.CertificationDTO;

public interface CertificationService {
    String uploadFile(MultipartFile file);
    int saveCertification(CertificationDTO certificationDTO);
}
