package com.kids.service.user;

import com.kids.dto.user.UserDto;

public interface UserService {
	
	public int getUserCodeAsBlack(UserDto userDto);
	public UserDto getUserInfoById(String id);
	public int updateUserPassword(UserDto userDto);
}
