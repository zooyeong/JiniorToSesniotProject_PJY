package com.kids.dto.user;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserDto {

	public String id;
	public String password;
	public String name;  
	public String birthday;
	public String phoneNumber;
	public String adress;  
	public String gender;
	public String email;
	public String userCode;
	public String regDate;

}
