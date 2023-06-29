package com.kids.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kids.service.user.UserInfoService;

@Controller
public class UserInfoFormController {
   
    @Autowired
    UserInfoService userInfoService;
	
    
    
    @RequestMapping("/typeBtn_test")
    public String typeBtn_test() {
    	
    	return "TypeBtn_test";
    }
    
    
	
	@RequestMapping("/userInfoFormPar")
	public String userInfoFormPar(Model model) {
		//부모 폼을 보여줌
		model.addAttribute("type", "par");
		model.addAttribute("userCode", "par");
		
		return "UserInfoForm";
	}
	
	@RequestMapping("/userInfoFormSnr")
	public String userInfoFormSnr(Model model) {
		//시니어 폼을 보여줌
		model.addAttribute("type", "snr");
		model.addAttribute("userCode", "snr");
		
		return "UserInfoForm";
	}	
	
	@RequestMapping("/IdCheckForm")
		public String idCheckForm() {
			return "IdCheckForm";
		}
	
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
//	@RequestMapping("/IdCheckAction")
//	@ResponseBody //return 을 화면이 아니라, 단순 String 텍스트를 리턴 하겠다.
//	public String idCheckAction() {
//
//		
//		//아이디 중복 체크를 하려면? 일단 아이디가 있어야 중복인지 아닌지 확인 가능
//		// 그 아이디는 어디에...?  <------------ 1.
//		
//		// 화면으로부터 넘어온 "chunhee" 아이디 값을 비교 <-> DB 사용자정보  <-----------  2. 
//		//아이디 중복 여부 체크
//		System.out.println("중복");
//		
//		//중복체크하는 서버
//		//중복이면 뭘 return 0
//		//중복이 아니면 뭘 return 1  <---------------- 3.
//		
//		
//		return "0";
//	}
	
	
	@RequestMapping("/IdCheckAction")
	@ResponseBody //return 을 화면이 아니라, 단순 String 텍스트를 리턴 하겠다.
	public String idCheckAction(@RequestParam("id") String id) {

		int result = userInfoService.idChk(id);	
		//아이디 중복 체크를 하려면? 일단 아이디가 있어야 중복인지 아닌지 확인 가능
		// 그 아이디는 어디에...?  <------------ 1.
		
		// 화면으로부터 넘어온 "chunhee" 아이디 값을 비교 <-> DB 사용자정보  <-----------  2. 
		//아이디 중복 여부 체크
		System.out.println("인풋");
		
		//중복체크하는 서버
		//중복이면 뭘 return 0
		//중복이 아니면 뭘 return 1  <---------------- 3.
		
		
		 if (result == 0) {
		      return "1"; // ID 사용 가능
		    } else {
		      return "0"; // 중복, 사용 불가능
		    }
		  }
	
	@RequestMapping("/testMain")
	public String testMain() {
		
		return "testMain";
	}
	
	
	@RequestMapping("/logInForm")
	public String logInForm() {
		
		return "logInForm";
	}
	}
	
	
