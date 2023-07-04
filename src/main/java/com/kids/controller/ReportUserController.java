package com.kids.controller;

import com.kids.dto.report.ReportUserDTO;
import com.kids.service.report.ReportUserService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("")
public class ReportUserController {
    private final ReportUserService reportUserService;
    private final HttpSession session; // HttpSession 객체 주입

    @Autowired
    public ReportUserController(ReportUserService reportUserService, HttpSession session) {
        this.reportUserService = reportUserService;
        this.session = session;
    }

    @GetMapping("/declaration")
    public String showDeclarationPopup(Model model, @RequestParam("id") String seniorId,
    		 @RequestParam("name") String name) {
        model.addAttribute("seniorId", seniorId);
        model.addAttribute("name", name);
        
        return "declaration";
    }

    @PostMapping("/report/declaration")
    public String handleDeclarationForm(ReportUserDTO reportUserDTO, Model model,
    									@RequestParam String seniorId,
    									@RequestParam String name) {
        // 세션에서 로그인 사용자 아이디 가져오기
        String parentId = (String) session.getAttribute("userId");
        reportUserDTO.setParentId(parentId);
        reportUserDTO.setSeniorId(seniorId);
        reportUserDTO.setName(name);
        
        reportUserService.saveReportUser(reportUserDTO);
        model.addAttribute("message", "신고가 완료되었습니다.");
        
        return "declarationa";
    }

    // 다른 메소드 및 매핑 추가 가능...

}
