package com.kids.service.file;

import java.util.List;

import com.kids.dto.image.ImageFileDTO;

public interface ImageFileService {
    List<ImageFileDTO> getAllImageFiles();
	ImageFileDTO saveImageFile(String fileName, String filePath, String sessionId);
}
