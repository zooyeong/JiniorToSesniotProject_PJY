package com.kids.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserInfoFormController {
   
	@RequestMapping("/userInfoForm")
	public String signUp() {
		return "UserInfoForm";
	}
	
}
