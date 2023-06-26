package com.kids.service.file.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.image.ImageFileDAO;
import com.kids.dto.image.ImageFileDTO;
import com.kids.service.file.ImageFileService;

@Service
public class ImageFileServiceImpl implements ImageFileService {
    @Autowired
    private ImageFileDAO imageFileDAO;

    @Override
    public ImageFileDTO saveImageFile(String fileName, String filePath, String sessionId) {
        ImageFileDTO imageFile = new ImageFileDTO(fileName, filePath, sessionId);
        imageFileDAO.insertImageFile(imageFile);
        
        return imageFile;
    }

    @Override
    public List<ImageFileDTO> getAllImageFiles() {
        return imageFileDAO.selectAllImageFiles();
    }
}
