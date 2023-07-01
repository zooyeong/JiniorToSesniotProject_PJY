package com.kids.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kids.dto.certification.CertificationDTO;
import com.kids.service.certification.CertificationService;

@Controller
@RequestMapping("/certification")
public class CertificationController {

    @Autowired
    HttpSession session;

    private final CertificationService certificationService;
    private static final String FILE_UPLOAD_PATH = "C:\\upload\\image\\Certification\\";

    public CertificationController(CertificationService certificationService) {
        this.certificationService = certificationService;
    }

    @GetMapping("")
    public String showUploadForm(HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            // Redirect to login page or handle the case when user is not logged in
            return "redirect:/sampleSession";
        }
        return "certification";
    }

    @GetMapping("/sampleSession")
    public String sampleSession() {
        return "sampleSession";
    }

    @PostMapping("/upload")
    public String uploadFiles(@RequestParam("idcFile") MultipartFile idcFile,
                              @RequestParam("cmnFile") MultipartFile cmnFile,
                              Model model,
                              HttpSession session) {
        try {
            String userId = (String) session.getAttribute("userId");
            if (userId == null) {
                // Redirect to login page or handle the case when user is not logged in
                return "redirect:/sampleSession";
            }

            String idcFileName = idcFile.getOriginalFilename();
            String idcFilePath = FILE_UPLOAD_PATH + idcFileName;
            File idcDest = new File(idcFilePath);
            idcFile.transferTo(idcDest); // Upload IDC file

            String cmnFileName = cmnFile.getOriginalFilename();
            String cmnFilePath = FILE_UPLOAD_PATH + cmnFileName;
            File cmnDest = new File(cmnFilePath);
            cmnFile.transferTo(cmnDest); // Upload CMN file

            model.addAttribute("idcFilePath", idcFilePath); // Add IDC file path to the model
            model.addAttribute("cmnFilePath", cmnFilePath); // Add CMN file path to the model

            // Save the certification data to the database with user ID
            CertificationDTO certificationDTO = new CertificationDTO(idcFileName, cmnFileName, "", userId);
            int result = certificationService.saveCertification(certificationDTO);
            if (result == 1) {
                model.addAttribute("uploadSuccess", true); // Add upload success flag to the model
            } else {
                model.addAttribute("uploadSuccess", false); // Add upload failure flag to the model
            }
        } catch (IOException e) {
            e.printStackTrace();
            // Handle file upload failure
            model.addAttribute("uploadSuccess", false); // Add upload failure flag to the model
        }
        return "certificationresult";
    }
}
