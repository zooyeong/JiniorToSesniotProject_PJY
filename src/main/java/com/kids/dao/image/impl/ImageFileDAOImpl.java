package com.kids.dao.image.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.image.ImageFileDAO;
import com.kids.dto.image.ImageFileDTO;

@Repository
public class ImageFileDAOImpl implements ImageFileDAO {
    private static final String NAMESPACE = "image_file_mapper.";

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertImageFile(ImageFileDTO imageFileDTO) {
//        sqlSession.insert(NAMESPACE + "insert_image_file", imageFileDTO);
        sqlSession.update(NAMESPACE + "update_image_file", imageFileDTO);
    }

    @Override
    public List<ImageFileDTO> selectAllImageFiles() {
        return sqlSession.selectList(NAMESPACE + "select_all_image_files");
    }

    @Override
    public int getNextImageFileId() {
        return sqlSession.selectOne(NAMESPACE + "get_next_image_file_id");
    }
}
