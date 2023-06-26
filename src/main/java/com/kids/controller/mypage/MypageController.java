package com.kids.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;
import com.kids.service.senior.SeniorService;

@Controller
public class MypageController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	SeniorService seniorService;
	
	@GetMapping("/sampleSession")
	public String sampleSession() {
		return "sampleSession";
	}
	
	@PostMapping("/sampleSession")
	public String sampleSession_action(@RequestParam("id") String id,
										HttpServletRequest request) {
		
		if(id.equals("")) {
			return "sampleSession";
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("userId", id);
			
			return "redirect:/updateMypage";
		}
		
	}

	@GetMapping("/updateMypage")
	public String updateMypage(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("userId");
		
		SeniorDetailDto seniorDetail = seniorService.getSeniorDetailById(id);
		model.addAttribute("seniorDetail", seniorDetail);
		
		List<SeniorScheduleDto> seniorEnableSchedule = seniorService.getSeniorEnableSchedule(id);
		model.addAttribute("seniorEnableSchedule", seniorEnableSchedule);
		
		return "updateMypage";
	}
	
	@PostMapping("/updateMypage")
	public String updateMypage_action(SeniorDetailDto seniorDetail,
									SeniorScheduleDto schedule) {
		
		/* 스케줄 업데이트 */
		String[] scheduleCodeArr = schedule.getScheduleCode().split(",");
		String[] statusArr = schedule.getStatus().split(",");
		String[] workStatusArr = schedule.getWorkStatus().split(",");
		
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i=0; i<scheduleCodeArr.length; i++) {			
			map.put("id", (String)session.getAttribute("userId"));
			map.put("scheduleCode", scheduleCodeArr[i]);
			if(statusArr[i].equals("Y") && workStatusArr[i].equals("N")) {
				//활동가능한데 매칭중인 경우
				map.put("status", statusArr[i]);
			}else {
				map.put("status", workStatusArr[i]);
			}
			map.put("workStatus", workStatusArr[i]);
			
			int scheduleUpdateResult = seniorService.updateSchedule(map);
			//scheduleUpdateResult 수행 결과 점검해야함
		}
		
		/* 개인정보 업데이트 */
		int result = seniorService.updateUserInfo(seniorDetail);

		if(result != 2) {
			//update가 둘 중 하나는 정상적으로 수행되지 않음 !!!(로직 다시 점검해야함)
			System.out.println("update 실패");
		}else {
			//update가 정상적으로 수행됨 !
			System.out.println("update 성공");
		}
		
		return "redirect:/updateMypage";
	}
	

}
