package com.kids.dto.user;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDto {

	String id;
	String password;
	String name;
	String birthday;
	String phoneNumber;
	String adress;
	String gender;
	String email;
	String userCode;
	String regDate;
}
