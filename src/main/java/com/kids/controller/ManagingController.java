package com.kids.controller;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kids.dto.report.ReportDto;
import com.kids.dto.user.UserDto;
import com.kids.service.report.ReportService;
import com.kids.service.user.UserService;

@Controller
public class ManagingController {

	private static final Logger log = LogManager.getLogger(ManagingController.class);

	@Autowired
	UserService userService;
	
	@Autowired
	ReportService reportService;

	@GetMapping("/admin")
	public String admin(Model model) {
		
		return "admin";
	}
	
	@GetMapping("/reportedList")
	public String reportedList(Model model,
			@RequestParam(name = "seniorId", required = false) String seniorId, 
			@RequestParam(name = "reportNum", required = false) Integer reportNum){

		if(seniorId == null) {

			List<ReportDto> reportedList = reportService.getReportedList();
			model.addAttribute("reportedList", reportedList);
			
			return "reportedList";
			
		} else if (seniorId != null && reportNum != null) {
			
			ReportDto reportDto = new ReportDto();
			reportDto.setSeniorId(seniorId);
			reportDto.setReportNum(reportNum);
			reportService.getReportedStatusAsConfirmed(reportDto);
			reportService.getReportCount(reportDto);
			
			return "redirect:/reportedList?seniorId=" + reportDto.getSeniorId();
					
		} else if (seniorId != null ) {
			
			ReportDto reportDto = new ReportDto();
			reportDto.setSeniorId(seniorId);
			List<ReportDto> reportedList = reportService.getReportedListById(reportDto);
			model.addAttribute("reportedList", reportedList);
		}

		return "manageBlackUser";
	}
	
	@GetMapping("/rejectReport")
	public String rejectReport(Model model,
			@RequestParam(name = "seniorId", required = false) String seniorId, 
			@RequestParam(name = "reportNum", required = false) Integer reportNum){

	    ReportDto reportDto = new ReportDto();
	    reportDto.setSeniorId(seniorId);
	    reportDto.setReportNum(reportNum);
	    reportService.getReportedStatusAsRejected(reportDto);
	    
	    return "redirect:/reportedList?seniorId=" + reportDto.getSeniorId();
	}
	
	
	@GetMapping("/registerBlackUser")
	public String registerBlackUser(Model model,
			@RequestParam(name = "seniorId", required = false) String seniorId, 
			@RequestParam(name = "reportNum", required = false) Integer reportNum){
		
		ReportDto reportDto = new ReportDto();
		UserDto userDto = new UserDto();
		reportDto.setSeniorId(seniorId);
		reportDto.setReportNum(reportNum);
		reportService.getReportedStatusAsConfirmed(reportDto);
		reportService.getReportCount(reportDto);
		userService.getUserCodeAsBlack(userDto);
		
		return "redirect:/reportedList?seniorId=" + reportDto.getSeniorId();
	}
	
	
/*
	@GetMapping("/seniorList")
	public String seniorList(Model model) {

		List<UserDto> userList = userService.getUserList();
		model.addAttribute("userList", userList);

		return "seniorList";
	}

	@GetMapping("/singleInfo")
	public String singleInfo(Model model, @RequestParam(name = "id") String id) {

		UserDto userDto = new UserDto();
		userDto.setId(id);
		List<UserDto> userList = userService.getUserListById(userDto);
		model.addAttribute("userList", userList);

		return "singleInfo";
	}


	/*
	 * @GetMapping("/registerSenior") public String registerSenior() {
	 * 
	 * return "index"; }
	 * 
	 * @PostMapping("registerSenior") public String registerSenior_proc() {
	 * 
	 * // 시니어 등록 처리 로직
	 * 
	 * return "index"; }
	 */


	/*
	 * @GetMapping("/matchLogList") public String matchLogList() {
	 * 
	 * return "index"; }
	 * 
	 * @PostMapping("/matchLogList") public String matchLogList_proc() {
	 * 
	 * // 매칭+동행 리스트 출력 로직
	 * 
	 * return "index"; }
	 */

}
