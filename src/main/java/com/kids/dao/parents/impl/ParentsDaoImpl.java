package com.kids.dao.parents.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kids.dao.parents.ParentsDao;
import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.parents.ParentsDetailDto;

@Repository
public class ParentsDaoImpl implements ParentsDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ParentsDetailDto> selectParentsDetail() {
		List<ParentsDetailDto> list = sqlSessionTemplate.selectList("parents_mapper.select_parents_detail");
		return list;
	}

	@Override
	public ParentsDetailDto selectParentsDetailById(String id) {
		ParentsDetailDto parents = sqlSessionTemplate.selectOne("parents_mapper.select_parents_detail_by_id", id);
		return parents;
	}

	@Override
	public int updateUserInfo(ParentsDetailDto parentsDetail) {
		int result_info = sqlSessionTemplate.update("parents_mapper.update_user_info", parentsDetail);
		int result_par = sqlSessionTemplate.update("parents_mapper.update_par", parentsDetail);
		return result_info + result_par;
	}

	@Override
	public ImageFileDTO selectImgById(String id) {
		ImageFileDTO result = sqlSessionTemplate.selectOne("parents_mapper.select_img_by_id", id);
		return result;
	}
}
