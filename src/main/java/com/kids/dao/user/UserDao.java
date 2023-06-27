package com.kids.dao.user;

import java.util.List;

import com.kids.dto.user.UserDto;

public interface UserDao {
	
	public List<UserDto> selectUserList();
	
	public List<UserDto> selectUserListById(UserDto userDto);
	
	public int updateUserCodeAsBlack(UserDto userDto);

}
