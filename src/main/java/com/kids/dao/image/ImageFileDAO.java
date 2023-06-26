package com.kids.dao.image;

import java.util.List;

import com.kids.dto.image.ImageFileDTO;

public interface ImageFileDAO {
    void insertImageFile(ImageFileDTO imageFileDTO);
    List<ImageFileDTO> selectAllImageFiles();
  
}
