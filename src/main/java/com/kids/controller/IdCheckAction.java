package com.kids.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kids.action.Action;
import com.kids.action.ActionForward;
import com.kids.dao.UserInfo_Dao;
import com.kids.dao.userInfo.impl.UserInfoDao_impl;
import com.kids.dto.UserInfo_Dto;

public class IdCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		UserInfo_Dao dao = new UserInfoDao_impl();
		int result = dao.idChk(id);
		
	       if(result == 1) {
	            // 중복된 아이디가 있을 경우
	            // result 값을 0으로 설정하고 반환
	            response.getWriter().write("0");
	        } else {
	            // 사용 가능한 아이디가 있을 경우
	            // result 값을 1으로 설정하고 반환
	            response.getWriter().write("1");
	        }

	        return null;
	    }
}
