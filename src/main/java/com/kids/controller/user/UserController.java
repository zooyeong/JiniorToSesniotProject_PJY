package com.kids.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kids.dto.user.UserDto;
import com.kids.service.user.UserService;

@Controller
public class UserController {

	@Autowired
	HttpSession session;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/changePassword")
	public String changePassword() {
		return "changePassword";
	}
	
	@PostMapping("/changePassword")
	public String changePassword_action(@RequestParam("password") String password,
										@RequestParam("newPassword") String newPassword) {
		
		/* 현재 비밀번호 db에서 가져와서 비교 */
		UserDto userDto = userService.getUserInfoById((String)session.getAttribute("userId"));
		if( !(userDto.getPassword().equals(password)) ) {
			/* 비밀번호가 다른 경우 */
			return "alertErr";
		}
		/* 비밀번호 일치 시 update */
		userDto.setPassword(newPassword);
		userService.updateUserPassword(userDto);
		
		return "alertUpdate";
	}
	
	@GetMapping("/alertErr")
	public String alertErr() {
		return "alertErr";
	}
	
	@GetMapping("/alertUpdate")
	public String alertUpdate() {
		return "alertUpdate";
	}
}
