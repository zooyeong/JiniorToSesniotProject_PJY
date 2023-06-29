package com.kids.controller.matching;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kids.dto.matching.MailDto;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;
import com.kids.dto.senior.SeniorScheduleDto;
import com.kids.service.matching.MatchingService;
import com.kids.service.senior.SeniorService;

@Controller
public class MatchingController {

	@Autowired
	HttpSession session;
	
	@Autowired
	SeniorService seniorService;
	
	@Autowired
	MatchingService matchingService;
	
	@GetMapping("/askForSenior")
	public String askForSenior(@RequestParam String id, Model model) {
		
		List<SeniorScheduleDto> seniorEnableSchedule = seniorService.getSeniorEnableSchedule(id);
		model.addAttribute("seniorEnableSchedule", seniorEnableSchedule);
		
		return "askForSenior";
	}
	
	@PostMapping("/askForSenior")
	public String askForSenior_action(@RequestParam String id
										, MatchingDto matchingDto
										, Model model) {
		
		String parId = (String)session.getAttribute("userId");
		matchingDto.setSnrId(id);
		matchingDto.setParId(parId); //부모 아이디 세션으로 가져와서 저장~ >>> 뷰단에서 아이디가 빈 상태로 넘어오지 못하게 해야함
		
		String pickUpPlace = matchingDto.getPickUpPlace().replace(",", " ");
		String arrivePlace = matchingDto.getArrivePlace().replace(",", " ");
		
		matchingDto.setPickUpPlace(pickUpPlace);
		matchingDto.setArrivePlace(arrivePlace);
		
		String askForWeekday = "";
		String[] scheduleCodeArr = matchingDto.getScheduleCode().split(",");
		for(String val : scheduleCodeArr) {
			switch (val) {
			case "1A":
				askForWeekday += "월요일오전 ";
				break;
			case "1B":
				askForWeekday += "월요일오후 ";
				break;
			case "2A":
				askForWeekday += "화요일오전 ";
				break;
			case "2B":
				askForWeekday += "화요일오후 ";
				break;
			case "3A":
				askForWeekday += "수요일오전 ";
				break;
			case "3B":
				askForWeekday += "수요일오후 ";
				break;
			case "4A":
				askForWeekday += "목요일오전 ";
				break;
			case "4B":
				askForWeekday += "목요일오후 ";
				break;
			case "5A":
				askForWeekday += "금요일오전 ";
				break;
			case "5B":
				askForWeekday += "금요일오후 ";
				break;
			}
		}
		
//		matchingDto.setScheduleCode(askForWeekday);
		
		int result = matchingService.saveMatchingInfo(matchingDto);
		int matchingNumber = matchingService.getMatchingNumber();
		
		/* 시니어에게 알림 전송 */
		MailDto mailDto = new MailDto();
		mailDto.setRevId(id);
		mailDto.setSendId(parId);
		mailDto.setMatchingNumber(matchingNumber);
		mailDto.setContent(parId+"님의 도우미 신청! 신청 정보는 다음과 같습니다."
							+ "<br>*** 신청 요일 : " + askForWeekday + "***"
							+ "<br>*** 픽업 장소 : " + pickUpPlace + "***"
							+ "<br>*** 도착 장소 : " + arrivePlace + "***"
							+ "<br>*** 요청 기간 : " + matchingDto.getStartDate() + " ~ " + matchingDto.getEndDate() + " ***"
							+ "<br>수락하시겠습니까?");
		
		int resultMailSave = matchingService.save_mail(mailDto);
		
		System.out.println(result);
		System.out.println(resultMailSave);
		
		return "redirect:/seniorDetail"; //신청 후 메인페이지로 이동?
	}
	
	@GetMapping("/mailboxSenior")
	public String mailboxSenior(Model model) {
		
		List<MailDto> mail = matchingService.getSeniorMailById((String)session.getAttribute("userId"));
		
		model.addAttribute("mail", mail);
		
		return "mailboxSenior";
	}
	
	@PostMapping("/acceptMail")
	public String acceptMail(MailDto mailDto) {
		
		mailDto.setStatus("수락");
		matchingService.updateMailStatus(mailDto);
		
		/* 부모에게 알림 전송 */
		mailDto.setStatus("완료");
		mailDto.setContent(mailDto.getSendId()+"님이 신청을 수락하였습니다!<br>"
						+ "시니어 도우미가 빠른 시일 내에 연락을 드릴게요.");
		
		int resultMailSave = matchingService.save_mail(mailDto);
		
		/* 시니어 work_status N로 update */
		MatchingDto matchingDto = matchingService.getMatchingInfo(mailDto.getMatchingNumber());
		
		Map<String, String> workStatusMap = new HashMap<String, String>();
		workStatusMap.put("workStatus", "N");
		workStatusMap.put("id", mailDto.getSendId());
		
		String[] scheduleCode = matchingDto.getScheduleCode().split(",");
		for(String val : scheduleCode) {
			workStatusMap.put("scheduleCode", val);
			int resultWorkStatus = seniorService.updateScheduleWorkStatus(workStatusMap);
		}
		
		/* matching_m status 진행중으로 변경 */
		matchingDto.setStatus("진행중");
		int resultMatchingMStatus = matchingService.updateMatchingMStatus(matchingDto);
		
		/* matching_d 생성 */
		LocalDate startDate = LocalDate.parse(matchingDto.getStartDate().substring(0, 10));		
		LocalDate endDate = LocalDate.parse(matchingDto.getEndDate().substring(0, 10));
		long daysBetween = ChronoUnit.DAYS.between(startDate, endDate);
		
		List<String> weekday = new ArrayList<>();
		for(String val : scheduleCode) {
			
			if(val.contains("1A")) {
				weekday.add("MONDAY");
			}else if(val.contains("1B")) {
				weekday.add("MONDAY");
			}else if(val.contains("2A")) {
				weekday.add("TUESDAY");				
			}else if(val.contains("2B")) {
				weekday.add("TUESDAY");				
			}else if(val.contains("3A")) {
				weekday.add("WEDNESDAY");				
			}else if(val.contains("3B")) {
				weekday.add("WEDNESDAY");				
			}else if(val.contains("4A")) {
				weekday.add("THURSDAY");				
			}else if(val.contains("4B")) {
				weekday.add("THURSDAY");				
			}else if(val.contains("5A")) {
				weekday.add("FRIDAY");				
			}else if(val.contains("5B")) {
				weekday.add("FRIDAY");				
			}
		}
		
		List<LocalDate> dates = new ArrayList<>();
		List<String> codes = new ArrayList<>();
		for(int i=0; i<weekday.size(); i++) {
			String val = weekday.get(i);
			DayOfWeek dayOfWeek = DayOfWeek.valueOf(val);
			String code = scheduleCode[i];
			
			for(int j=0; j<=daysBetween; j++) {
				LocalDate currentDate = startDate.plusDays(j);
				if(currentDate.getDayOfWeek() == dayOfWeek) {
					dates.add(currentDate);
					codes.add(code);
				}
			}
		}
		
		MatchingDetailDto matchingDetailDto = new MatchingDetailDto();
		matchingDetailDto.setMatchingNumber(matchingDto.getMatchingNumber());
		matchingDetailDto.setStatus("진행예정");
		
		for(int i=0; i<dates.size(); i++) {
			matchingDetailDto.setScheduleCode(codes.get(i));
			matchingDetailDto.setDay(""+dates.get(i));
			int resultMatchingDetail = matchingService.saveMathingDetail(matchingDetailDto);
		}
		
		return "redirect:/mailboxSenior";
	}
	
	@PostMapping("/refuseMail")
	public String refuseMail(MailDto mailDto) {
		
		mailDto.setStatus("거절");
		matchingService.updateMailStatus(mailDto);
		
		/* 부모에게 알림 전송 */
		mailDto.setStatus("완료");
		mailDto.setContent(mailDto.getSendId()+"님이 신청을 거절하였습니다...");
		
		int resultMailSave = matchingService.save_mail(mailDto);
		
		/* matching_m status 취소로 변경 */
		MatchingDto matchingDto = new MatchingDto();
		matchingDto.setStatus("취소");
		matchingDto.setMatchingNumber(mailDto.getMatchingNumber());
		int resultMatchingMStatus = matchingService.updateMatchingMStatus(matchingDto);
		
		return "redirect:/mailboxSenior";
	}
	
	@GetMapping("/mailboxParents")
	public String mailboxParents(Model model) {
		
		List<MailDto> mail = matchingService.getParentsMailById((String)session.getAttribute("userId"));
		
		model.addAttribute("mail", mail);
		
		return "mailboxParents";
	}
	
	@GetMapping("/countMailSenior")
	public String countMailSenior(Model model){
		
		int cnt = matchingService.countSeniorMailById((String)session.getAttribute("userId"));
		model.addAttribute("count", cnt);
		
		return "countMailSenior";
	}
	
	@GetMapping("/countMailParents")
	public String countMailParents(Model model){
		
		int cnt = matchingService.countParentsMailById((String)session.getAttribute("userId"));
		model.addAttribute("count", cnt);
		
		return "countMailParents";
	}

	@GetMapping("/scheduleList")
	public String scheduleList(Model model) {
		
		List<MatchingDetailDto> matchingDetailDtoList 
			= matchingService.selectMatchingDetail((String)session.getAttribute("userId"));
		
		model.addAttribute("matchingDetailDtoList", matchingDetailDtoList);
		
		return "scheduleList";
	}
	
	@PostMapping("/scheduleList")
	public String scheduleList_action(MatchingDetailDto matchingDetailDto,
									@RequestParam("btnValue") String btnValue) {
		
		
		MatchingDetailDto selectLastDayDto = matchingService.selectMatchingDLast(matchingDetailDto.getMatchingNumber());
		if(matchingDetailDto.getDay().equals(selectLastDayDto.getDay()) 
				&& matchingDetailDto.getScheduleCode().equals(selectLastDayDto.getScheduleCode())) {
			/* matching_m status 최종완료로 update */
			MatchingDto matchingDto = new MatchingDto();
			matchingDto.setStatus("최종완료");
			matchingDto.setMatchingNumber(matchingDetailDto.getMatchingNumber());
			int resultStatusMUpdate = matchingService.updateMatchingMStatus(matchingDto);
			
			Map<String, String> map = new HashMap<>();
			map.put("workStatus", "Y");
			map.put("id", (String)session.getAttribute("userId"));

			matchingDto = matchingService.getMatchingInfo(matchingDetailDto.getMatchingNumber());
			String[] scArr = matchingDto.getScheduleCode().split(",");
			
			for(String val : scArr) {
				map.put("scheduleCode", val);
				int resultWorkStatus = seniorService.updateScheduleWorkStatus(map);
			}
		}
		
		if(btnValue.equals("complete")) {
			/* matching_d status 진행완료로 update */
			matchingDetailDto.setStatus("진행완료");
			int resultStatusDUpdate = matchingService.updateMatchingDStatus(matchingDetailDto);
		}else {
			/* matching_d status 진행취소로 update */
			matchingDetailDto.setStatus("진행취소");
			int resultStatusDUpdate = matchingService.updateMatchingDStatus(matchingDetailDto);
		}
		
		
		return "redirect:/scheduleList";
	}
	
}
