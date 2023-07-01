package com.kids.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScrollController {


	@RequestMapping("/scroll")
	public String main() {
		return "scroll";
	}
}

