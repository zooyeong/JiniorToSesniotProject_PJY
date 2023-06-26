package com.kids.controller;

import com.kids.dto.report.ReportUserDTO;
import com.kids.service.report.ReportUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class ReportUserController {
    private final ReportUserService reportUserService;

    @Autowired
    public ReportUserController(ReportUserService reportUserService) {
        this.reportUserService = reportUserService;
    }

    @GetMapping("/declaration")
    public String showDeclarationPage(Model model) {
        model.addAttribute("reportUserDTO", new ReportUserDTO());
        return "declaration";
    }

    @PostMapping("/report/declaration")
    public String handleDeclarationForm(ReportUserDTO reportUserDTO, Model model) {
        reportUserService.saveReportUser(reportUserDTO);
        model.addAttribute("message", "신고가 완료되었습니다.");
        return "declaration";
    }
}
