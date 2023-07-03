package com.kids.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kids.dto.UserInfo_Dto;
import com.kids.service.user.UserInfoService;

@Controller
public class UserInfoFormController {

	@Autowired
    UserInfoService userInfoService;
	
    
//	----[회원가입 하기 전 회원유형 선택하기]----   
    @RequestMapping("/signUpType")
    public String typeBtn_test() {
    	
    	return "signUpType";
    }
    
    
//	----[부모님 회원가입]----	
	@GetMapping("/userInfoFormPar")
	public String userInfoFormPar(Model model) {
		//부모 폼을 보여줌
		
		model.addAttribute("userCode", "par");
		
		return "userInfoFormPar";
	}
//	----[부모님 회원정보 입력 테이블에 저장]----
	@PostMapping("/userInfoFormPar")
	public String userInfoFormPar(@ModelAttribute UserInfo_Dto userInfo_dto) {
		
		System.out.println(userInfo_dto);
//		userInfo_dto.setPostCode(userInfo_dto.getPostCode());
	    // 서비스 메서드를 호출하여 userInfo_dto를 전달
		//기본 회원정보
	    userInfoService.insertUser(userInfo_dto);
	    //어린이정보 
	    userInfoService.insertUserPar(userInfo_dto);
	    //약관동의
	    userInfoService.insertAgreement(userInfo_dto);	    
	    
	    
	    //가입완료 후 로그인 페이지로 리다이렉트
	    return "redirect:/logInForm";
	}	
	
//			----[시니어 회원가입]----	
	@GetMapping("/userInfoFormSnr")
	public String userInfoFormSnr(Model model) {
		//시니어 폼을 보여줌

		
		
		return "userInfoFormSnr";
	}
//	----[시니어 회원정보 입력 테이블에 저장]----	
	@PostMapping("/userInfoFormSnr")
	public String userInfoFormSnr(@ModelAttribute UserInfo_Dto userInfo_dto) {
		
		System.out.println(userInfo_dto);
		userInfo_dto.setPostCode(userInfo_dto.getPostCode());
	    // 서비스 메서드를 호출하여 userInfo_dto를 전달
		//기본 회원정보
	    userInfoService.insertUser(userInfo_dto);
	    //시니어 정보
	    userInfoService.insertUserSnr(userInfo_dto);
	    //시니어 스케줄
	    
	    
	    String[] scheduleCode = userInfo_dto.getScheduleCode().split(",");
	    String[] real_scheduleCode = {"1A","1B","2A","2B","3A","3B","4A","4B","5A","5B"};
	    Map<String, String> map = new HashMap<>();
		for(int i=0; i<scheduleCode.length; i++) {
			map.put("id", userInfo_dto.getId());
			map.put("scheduleCode", scheduleCode[i]);
			map.put("real_scheduleCode", real_scheduleCode[i]);
			int resultWorkStatus = userInfoService.insertSnrSchedule(map);
		}	    
	    
	    
	    
	    
	    
	    //약관동의
	    userInfoService.insertAgreement(userInfo_dto);
	    
	    //가입완료 후 로그인 페이지로 리다이렉트
	    return "redirect:/logInForm";
	}	

//	----[아이디 체크하는 창]----	
	@RequestMapping("/IdCheckForm")
		public String idCheckForm() {
			return "IdCheckForm";
		}
	
	
	@RequestMapping("/IdCheckAction")
	@ResponseBody //return 을 화면이 아니라, 단순 String 텍스트를 리턴 하겠다.
	public String idCheckAction(@RequestParam("id") String id) {

		//아이디 중복 여부 체크. 기존 아이디 부재시 0
		int result = userInfoService.idChk(id);	

		System.out.println("아이디 중복체여부 체크");
		
		//동일 아이디 몇개래? 0개~
		 if (result == 0) {
		      return "1"; // ID 사용 가능
		    } else { 
		      return "0"; // 중복, 사용 불가능
		    }
		  }
	
	//회원가입 중 취소하면 메인페이지로 이동
//----------------		----------------		----------------		----------------		----------------
	
	//로그인 페이지
	@RequestMapping("/logInForm")
	public String logInForm() {
		
		
		
		return "logInForm";
	}

	
	//부모 로그인성공 메인페이지
	@RequestMapping("/mainPar")
	public String testMainPar() {
		return "mainPar";
	}

	//시니어 로그인성공 메인페이지
	@RequestMapping("/ainSnr")
	public String testMainSnr() {
		return "mainSnr";
	}
	

	@RequestMapping("/login")
	public String logInCheck(UserInfo_Dto userInfo_dtoFromForm, HttpServletRequest request ) {
	    UserInfo_Dto userInfo_dto = userInfoService.logInCheck(userInfo_dtoFromForm);
	    
	    if(userInfo_dto == null) {
	    	
	    	return "redirect:/logInFail";
	    }
	    
	    String userCode = userInfo_dto.getUserCode();
	    
	    String userId = userInfo_dto.getId();
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("userId", userId);
	    session.setAttribute("userCode", userCode);
	    System.out.println(userCode);
	    
	    if(userCode.equals("PAR")) {
	    	
	    	return "redirect:/mainPar";	    	
	    }
	    else if (userCode.equals("SNR")) {
	    	
	    	return "redirect:/mainSnr";	  
	    }else if (userCode.equals("ADM")) {
	    	return "redirect:/mainAdm";
	    }else{
	    	return "redirect:/logInForm";
	    }
	   
	}
	
	@GetMapping("/logInFail")
	public String logInFail() {
		return "logInFail";
	}
//----------------		----------------		----------------		----------------		----------------
}
//끗..	
//컨트롤러 -> 서비스 -> 다오 -> mapper(db)
//컨트롤러 <- 서비스 <- 다오 <----┘
//----------------		----------------		----------------		----------------		----------------

/*
@Controller
//리턴이 화면 .jsp 페이지 코드
public String...
	return "IdCheckForm";    /WEB-INF/views/IdCheckForm.jsp
	
	
@RestController    or    @ResponseBody
//리턴이 정말 리턴하는 그대로의 텍스트	
//중복이다 아니다
	return "O" "X"   "Y"  "N";
 */
//@RequestMapping("/IdCheckAction")
//@ResponseBody //return 을 화면이 아니라, 단순 String 텍스트를 리턴 하겠다.
//public String idCheckAction() {
//
//	
//	//아이디 중복 체크를 하려면? 일단 아이디가 있어야 중복인지 아닌지 확인 가능
//	// 그 아이디는 어디에...?  <------------ 1.
//	
//	// 화면으로부터 넘어온 "chunhee" 아이디 값을 비교 <-> DB 사용자정보  <-----------  2. 
//	//아이디 중복 여부 체크
//	System.out.println("중복");
//	
//	//중복체크하는 서버
//	//중복이면 뭘 return 0
//	//중복이 아니면 뭘 return 1  <---------------- 3.
//	
//	
//	return "0";
//}