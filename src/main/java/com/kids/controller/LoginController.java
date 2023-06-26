package com.kids.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String performLogin(@RequestParam("id") String id, HttpSession session) {
        // 실제 시나리오에서는 여기서 데이터베이스에서 아이디를 확인하고 에러 메시지를 반환하거나 로그인에 성공하게 됩니다.
        session.setAttribute("loggedIn", true);
        session.setAttribute("userId", id);
        return "redirect:/main";
    }

    @GetMapping("/main")
    public String showMainPage(HttpSession session, Model model) {
        if (session.getAttribute("loggedIn") == null || !(Boolean) session.getAttribute("loggedIn")) {
            return "redirect:/login"; 
        }
        model.addAttribute("userId", session.getAttribute("userId"));
        return "main";
    }

    @GetMapping("/redirectToUpload")
    public String redirectToUpload() {
        return "redirect:/upload";
    
    }
}