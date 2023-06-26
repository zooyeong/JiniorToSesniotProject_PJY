package com.kids.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kids.dto.image.ImageFileDTO;
import com.kids.service.file.ImageFileService;

@Controller
public class FileUploadController {
    @Autowired
    private ImageFileService imageFileService;

    // private String uploadDir = "D:\\Eclipse-workspace-11\\JuniorToSeniorProject\\src\\main\\webapp\\resources\\image\\profile\\";
    private String uploadDir = "C:\\upload\\image\\profile\\";

    @GetMapping("/upload")
    public String showUploadForm() {
        return "upload";
    }

    @PostMapping("/upload")
    public String handleImageFileUpload(@RequestParam("file") MultipartFile file,
                                        @RequestParam("id") String id,
                                        Model model) {
        if (!file.isEmpty()) {
            try {
                String originalFileName = file.getOriginalFilename();
                String extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
                String fileName = UUID.randomUUID().toString() + extension;
                Path uploadPath = Paths.get(uploadDir);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                String storedFilePath = filePath.toString();
                // Get the session ID and pass it to the service method
                String sessionId = id; // Add code to retrieve the session ID here
                ImageFileDTO imageFile = imageFileService.saveImageFile(fileName, storedFilePath, sessionId);
                model.addAttribute("message", "업로드 완료 !!");
                model.addAttribute("uploadedImageId", imageFile.getId());
                model.addAttribute("uploadedImageFileName", imageFile.getFileName());

            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("message", "파일을 업로드하는 동안 오류가 발생했습니다 : " + e.getMessage());
                return "upload";
            }
        } else {
            model.addAttribute("message", "파일은 업로드할 수 없습니다.");
            return "upload";
        }

        return "upload";
    }
}
