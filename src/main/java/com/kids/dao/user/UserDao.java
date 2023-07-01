package com.kids.dao.user;

import com.kids.dto.user.UserDto;

public interface UserDao {
	
	public int updateUserCodeAsBlack(UserDto userDto);
	public UserDto getUserInfoById(String id);
	public int updateUserPassword(UserDto userDto);
}
