package com.kids.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {

	@RequestMapping("/logoutproc")
	public String main() {
		return "logoutproc";
	}
}
