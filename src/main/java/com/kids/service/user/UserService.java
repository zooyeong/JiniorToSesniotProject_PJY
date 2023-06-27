package com.kids.service.user;

import java.util.List;

import com.kids.dto.user.UserDto;

public interface UserService {
	
	public List<UserDto> getUserList();
	
	public List<UserDto> getUserListById(UserDto userDto);
	
	public int getUserCodeAsBlack(UserDto userDto);


}
