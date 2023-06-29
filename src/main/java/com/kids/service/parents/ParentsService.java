package com.kids.service.parents;

import java.util.List;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.parents.ParentsDetailDto;

public interface ParentsService {
	public List<ParentsDetailDto> getParentsDetail();
	public ParentsDetailDto getParentsDetailById(String id);
	public int updateUserInfo(ParentsDetailDto parentsDetail);
	public ImageFileDTO getImgById(String id);
	
}
