package com.kids.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kids.dto.matching.MatchingDto;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.report.ReportDto;
import com.kids.dto.user.UserDto;
import com.kids.dto.senior.SeniorDto;
import com.kids.service.matching.MatchingService;
import com.kids.service.report.ReportService;
import com.kids.service.senior.SeniorService;
import com.kids.service.user.UserService;

@Controller
public class ManagingController {

	private static final Logger log = LogManager.getLogger(ManagingController.class);

	@Autowired
	UserService userService;
	
	@Autowired
	ReportService reportService;

	@Autowired
	SeniorService seniorService;
	
	@Autowired
	MatchingService matchingService;
	
	@GetMapping("/admin")
	public String admin(Model model) {
		
		return "admin";
	}
	
	@GetMapping("/reportedList")
	public String reportedList(Model model,
			@RequestParam(name = "seniorId", required = false) String seniorId, 
			@RequestParam(name = "reportNum", required = false) Integer reportNum,
			@RequestParam(name="num", required = false, defaultValue = "1") int num){

		if(seniorId == null) {

			//게시물 총 갯수
			int count = reportService.getReportCount();
			
			//한 페이지에 출력할 게시물 갯수
			int articleNum = 10;
			
			//하단 페이징 번호( 
			int pageNum = (int) Math.ceil((double)count/articleNum);
			
			//출력할 게시물
			int displayArticle = (num -1) * articleNum;
			
			// 한번에 출력할 페이징 번호의 갯수
			int pageNumCnt = 10;
			
			// 표시되는 페이지 번호 중 마지막 번호
			int endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);

			// 표시되는 페이지 번호 중 첫번째 번호
			int startPageNum = endPageNum - (pageNumCnt - 1);
			
			//마지막 페이지 번호 = (올림)(현재 페이지 번호 / 한번에 표시할 페이지 갯수) * 한번에 표시할 페이지 갯수 
			//시작 페이지 = 마지막 페이지 번호 - 한번에 표시할 페이지 갯수 + 1
			
			// 마지막 번호 재계산
			int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
			 
			if(endPageNum > endPageNum_tmp) {
			 endPageNum = endPageNum_tmp;
			}
			
			boolean prev = startPageNum == 1 ? false : true;
			boolean next = endPageNum * pageNumCnt >= count ? false : true;
			
			// 시작 및 끝 번호
			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);

			// 이전 및 다음 
			model.addAttribute("prev", prev);
			model.addAttribute("next", next);
			
			//현재 페이지
			model.addAttribute("select", num);
			
			List<ReportDto> reportedList = reportService.getReportedList(displayArticle, articleNum);
			model.addAttribute("reportedList", reportedList);
			model.addAttribute("pageNum", pageNum);
			
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

	// 모든 인증 제출 리스트
	@GetMapping("/verifySenior")
	public String registerSenior(Model model, @RequestParam(name = "id", required = false) String id,
			@RequestParam(name="num", required = false, defaultValue = "1") int num) {
		if (id == null) {
			
			int count = seniorService.getRegisterCount();
			int postNum = 2;
			int pageNum = (int) Math.ceil((double)count/postNum);
			int displayPost = (num -1) * postNum;
			int pageNumCnt = 2;
			int endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
			int startPageNum = endPageNum - (pageNumCnt - 1);
			int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
			
			if(endPageNum > endPageNum_tmp) {
			 endPageNum = endPageNum_tmp;
			}
			
			boolean prev = startPageNum == 1 ? false : true;
			boolean next = endPageNum * pageNumCnt >= count ? false : true;
			
			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);

			model.addAttribute("prev", prev);
			model.addAttribute("next", next);
			
			model.addAttribute("select", num);
			
			List<SeniorDto> seniorVeriList = seniorService.getSeniorVerificationList(displayPost, postNum);
			model.addAttribute("seniorVeriList", seniorVeriList);
			model.addAttribute("pageNum", pageNum);

		return "seniorSubmitList";
		
		} else if (id != null ) {
			
			SeniorDto seniorDto = new SeniorDto();
			seniorDto.setId(id);
			List<SeniorDto> seniorVeriList = seniorService.getSeniorVerificationListById(seniorDto);
			model.addAttribute("seniorVeriList", seniorVeriList);
			
		}
		
		return "authorizeSenior";
	}

	
	@GetMapping("/authorizeSenior")
	public String authorizeSenior(Model model, @RequestParam(name = "id", required = false) String id) {

		if (id == null) {

			SeniorDto seniorDto = new SeniorDto();
			seniorDto.setId(id);
			List<SeniorDto> seniorVeriList = seniorService.getSeniorVerificationListById(seniorDto);
			model.addAttribute("seniorVeriList", seniorVeriList);

		} else if (id != null) {

			SeniorDto seniorDto = new SeniorDto();
			seniorDto.setId(id);
			seniorService.setSeniorVerificationStatusAsCertified(seniorDto);

			return "redirect:/verifySenior?id=" + seniorDto.getId();
		}
		
		return "authorizeSenior";
	}
	

	@GetMapping("/rejectAuthorization")
	public String rejectAuthorization(Model model, @RequestParam(name = "id", required = false) String id) {

		SeniorDto seniorDto = new SeniorDto();
		seniorDto.setId(id);
		seniorService.setSeniorVerificationStatusAsRejected(seniorDto);
	    
		return "redirect:/verifySenior?id=" + seniorDto.getId();
	}
	

  @GetMapping("/matchingLogList") 
  public String matchingLogList(Model model,
		  @RequestParam(name = "snrId", required = false) String snrId,
		  @RequestParam(name = "parId", required = false) String parId,
		  @RequestParam(name="num", required = false, defaultValue = "1") int num) {
		  //@RequestParam(name = "snrId", required = false) String snrId) 
	  
	  	 // 파라미터 값이 아무것도 없으면 전체 매칭 이력을 보여주고
	  if (snrId == null && parId == null) {
		  
			// 페이징 처리 시작
			int count = matchingService.getMatchingCount();
			int postNum = 10;
			int pageNum = (int) Math.ceil((double) count / postNum);
			int displayPost = (num - 1) * postNum;
			int pageNumCnt = 10;
			int endPageNum = (int) (Math.ceil((double) num / (double) pageNumCnt) * pageNumCnt);
			int startPageNum = endPageNum - (pageNumCnt - 1);
			int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNumCnt));

			if (endPageNum > endPageNum_tmp) {
				endPageNum = endPageNum_tmp;
			}

			boolean prev = startPageNum == 1 ? false : true;
			boolean next = endPageNum * pageNumCnt >= count ? false : true;

			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);

			model.addAttribute("prev", prev);
			model.addAttribute("next", next);

			model.addAttribute("select", num);
		  //페이징 처리 끝
		  
			List<MatchingDto> matchingLogList = matchingService.getMatchingLogList(displayPost, postNum);
			model.addAttribute("matchingLogList", matchingLogList);
			model.addAttribute("pageNum", pageNum);
			
		 // snrId 가 있으면 시니어 아이디의 매칭 이력을 보여주고
	  } else if (snrId != null && parId == null) {
		  MatchingDto matchingDto = new MatchingDto();
		  matchingDto.setSnrId(snrId);
		  List<MatchingDto> matchingLogList = matchingService.getMatchingLogListBySnrId(matchingDto);
		  model.addAttribute("matchingLogList", matchingLogList);
		  
		 // parId 가 있으면 부모 아이디의 매칭 이력을 보여준다
	  } else if (snrId == null && parId != null) {
		  MatchingDto matchingDto = new MatchingDto();
		  matchingDto.setParId(parId);
		  List<MatchingDto> matchingLogList = matchingService.getMatchingLogListByPnrId(matchingDto);
		  model.addAttribute("matchingLogList", matchingLogList);
	  }
	  
  return "matchingLogList";
  }
  

  @GetMapping("/matchingDetailLog") 
  public String matchingDetailLog(Model model,
		 // @RequestParam(name = "snrId", required = false) String snrId ,
		 // @RequestParam(name = "parId", required = false) String parId ,
		  @RequestParam(name = "matchingNumber", required = false) Integer matchingNumber) {
	  
	  // 해당 matchingNum의 디테일 보여준다
	  MatchingDetailDto matchingDetailDto = new MatchingDetailDto();
	  matchingDetailDto.setMatchingNumber(matchingNumber);
	  List<MatchingDetailDto> matchingDetail = matchingService.getMatchingDetailByMatchingNum(matchingDetailDto);
	  model.addAttribute("matchingDetail", matchingDetail); 
  
  return "matchingDetailLog";
  }

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
	}*/


