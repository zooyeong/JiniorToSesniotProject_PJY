package com.kids.service.parents.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kids.dao.parents.ParentsDao;
import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.parents.ParentsDetailDto;
import com.kids.service.parents.ParentsService;

@Service
public class ParentsServiceImpl implements ParentsService {

	@Autowired
	ParentsDao parentsDao;
	
	@Override
	public List<ParentsDetailDto> getParentsDetail() {
		List<ParentsDetailDto> list = parentsDao.selectParentsDetail();
		return list;
	}

	@Override
	public ParentsDetailDto getParentsDetailById(String id) {
		ParentsDetailDto parents = parentsDao.selectParentsDetailById(id);
		return parents;
	}

	@Override
	public int updateUserInfo(ParentsDetailDto parentsDetail) {
		int result = parentsDao.updateUserInfo(parentsDetail);
		return result;
	}

	@Override
	public ImageFileDTO getImgById(String id) {
		ImageFileDTO result = parentsDao.selectImgById(id);
		return result;
	}
}
