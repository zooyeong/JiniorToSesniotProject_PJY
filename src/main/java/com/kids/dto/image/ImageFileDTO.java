package com.kids.dto.image;

import lombok.Data;

@Data
public class ImageFileDTO {
 
    private String fileName;
    private String filePath;
    private String id;

    public ImageFileDTO(String fileName, String filePath, String id) {

        this.fileName = fileName;
        this.filePath = filePath;
        this.id = id;
    }
}
