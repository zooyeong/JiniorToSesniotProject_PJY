package com.kids.dao.parents;

import java.util.List;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.parents.ParentsDetailDto;

public interface ParentsDao {
	public List<ParentsDetailDto> selectParentsDetail();
	public ParentsDetailDto selectParentsDetailById(String id);
	public int updateUserInfo(ParentsDetailDto parentsDetail);
	public ImageFileDTO selectImgById(String id);
}
