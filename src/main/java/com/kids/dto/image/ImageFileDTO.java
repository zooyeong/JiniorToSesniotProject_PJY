package com.kids.dto.image;

import lombok.Data;

@Data
public class ImageFileDTO {
    private int id;
    private String fileName;
    private String filePath;
    private String realId;

    public ImageFileDTO(int id, String fileName, String filePath, String realId) {
        this.id = id;
        this.fileName = fileName;
        this.filePath = filePath;
        this.realId = realId;
    }
}
