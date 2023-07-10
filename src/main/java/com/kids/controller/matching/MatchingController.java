package com.kids.controller.matching;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.matching.MailDto;
import com.kids.dto.matching.MatchingDetailDto;
import com.kids.dto.matching.MatchingDto;
import com.kids.dto.parents.ParentsDetailDto;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;
import com.kids.service.matching.MatchingService;
import com.kids.service.parents.ParentsService;
import com.kids.service.senior.SeniorService;

@Controller
public class MatchingController {

	@Autowired
	HttpSession session;
	
	@Autowired
	SeniorService seniorService;
	
	@Autowired
	ParentsService parentsService;
	
	@Autowired
	MatchingService matchingService;
	
	/* 도우미 신청하는 페이지 */
	@GetMapping("/askForSenior")
	public String askForSenior(@RequestParam String id, Model model) {
		
		List<SeniorScheduleDto> seniorEnableSchedule = seniorService.getSeniorEnableSchedule(id);
		model.addAttribute("seniorEnableSchedule", seniorEnableSchedule);
		String userId = (String)session.getAttribute("userId");
		model.addAttribute("userId", userId);
		
		return "askForSenior";
	}
	
	/* 도우미 신청 시 process */
	@PostMapping("/askForSenior")
	public String askForSenior_action(@RequestParam String id
										, MatchingDto matchingDto
										, Model model) {
		
		String parId = (String)session.getAttribute("userId");
		matchingDto.setSnrId(id);
		matchingDto.setParId(parId);
		
		/* post로 넘어온 주소 하나의 String으로 저장 */
		String pickUpPlace = matchingDto.getPickUpPlace().replace(",", " ");
		String arrivePlace = matchingDto.getArrivePlace().replace(",", " ");
		
		matchingDto.setPickUpPlace(pickUpPlace);
		matchingDto.setArrivePlace(arrivePlace);
		
		/* post로 넘어온 신청요일 하나의 String으로 저장 */
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
		
		/* matching_m에 insert */
		int result = matchingService.saveMatchingInfo(matchingDto);
		
		/* 아래에서 사용할 matchingNumber 변수화 */
		int matchingNumber = matchingService.getMatchingNumber();
		
		/* 시니어에게 전송할 부모 데이터 가져오기 */
		ParentsDetailDto parentsDetailDto = parentsService.getParentsDetailById(parId);
		
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
							+ "<br>*** 연락처 : " + parentsDetailDto.getPhoneNumber() + " ***"
							+ "<br>수락하시겠습니까?");
		int resultMailSave = matchingService.save_mail(mailDto);
		
		return "redirect:/seniorDetail?id="+id;
	}
	
	/* 도우미 신청 수락 시 process */
	@PostMapping("/acceptMail")
	public String acceptMail(MailDto mailDto, HttpServletRequest request) {
		
		/* 메일 상태 수락으로 변경 */
		mailDto.setStatus("수락");
		matchingService.updateMailStatus(mailDto);
		
		/* 부모에게 전송할 시니어 데이터 가져오기 */
		SeniorDetailDto seniorDetailDto = seniorService.getSeniorDetailById(mailDto.getSendId());
		
		/* 부모에게 알림 전송 */
		mailDto.setStatus("완료");
		mailDto.setContent(mailDto.getSendId()+"님이 신청을 수락하였습니다!<br>"
						+ "시니어 도우미가 빠른 시일 내에 연락을 드릴게요.<br>"
						+ "시니어 비상 연락망 : " + seniorDetailDto.getPhoneNumber());
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
		
		/* startDate와 endDate 사이 요일별 일자 추가 */
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
		
		/* 변화된 countMail 상태 session에 다시 저장 */
		String userId = (String)session.getAttribute("userId");

		int cnt = matchingService.countSeniorMailById((String)session.getAttribute("userId"));
		List<MailDto> mail = matchingService.getSeniorMailById(userId);
		session.setAttribute("count", cnt);
		session.setAttribute("mail", mail);
		
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	/* 도우미 신청 거절 시 process */
	@PostMapping("/refuseMail")
	public String refuseMail(MailDto mailDto, HttpServletRequest request) {
		
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
		
		/* 변화된 countMail 상태 session에 다시 저장 */
		String userId = (String)session.getAttribute("userId");

		int cnt = matchingService.countSeniorMailById((String)session.getAttribute("userId"));
		List<MailDto> mail = matchingService.getSeniorMailById(userId);
		session.setAttribute("count", cnt);
		session.setAttribute("mail", mail);
		
		String referer = request.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	/* 시니어 개인 스케줄 페이지 */
	@GetMapping("/schedule")
	public String schedule(Model model) {
		MatchingDto matchingDto = new MatchingDto();
		matchingDto.setSnrId((String)session.getAttribute("userId"));
		List<MatchingDto> matchingDtoList = matchingService.getMatchingLogListBySnrId(matchingDto);
		
		model.addAttribute("matchingDtoList" ,matchingDtoList);
		
		return "schedule";
	}
	/* 시니어 개인 스케줄 상세조회 페이지 */
	@GetMapping("/scheduleList")
	public String scheduleList(@RequestParam int matchingNumber, Model model) {
		
		List<MatchingDetailDto> matchingDetailDtoList 
			= matchingService.selectMatchingDetail(matchingNumber);
		
		model.addAttribute("matchingDetailDtoList", matchingDetailDtoList);
		
		List<ParentsDetailDto> parentsDetailDto = new ArrayList<>();
		List<ImageFileDTO> imageFileDto = new ArrayList<>();
		for(MatchingDetailDto val : matchingDetailDtoList) {
			String parId = val.getParId();
			ParentsDetailDto pDD = parentsService.getParentsDetailById(parId);
			parentsDetailDto.add(pDD);
			ImageFileDTO iFD = parentsService.getImgById(parId);
			imageFileDto.add(iFD);
		}
		model.addAttribute("parentsDetailDto", parentsDetailDto);			
		model.addAttribute("imageFileDto", imageFileDto);			
		
		
		
		return "scheduleList";
	}
	
	/* 시니어 스케줄 완료 or 취소 처리 시 process */
	@PostMapping("/scheduleList")
	public String scheduleList_action(@RequestParam int matchingNumber,
									MatchingDetailDto matchingDetailDto,
									@RequestParam("btnValue") String btnValue,
									HttpServletResponse response) throws IOException {
		/* matching_d의 마지막건 처리 시 검증 */
		MatchingDetailDto selectLastDayDto = matchingService.selectMatchingDLast(matchingDetailDto.getMatchingNumber());
		if(matchingDetailDto.getDay().equals(selectLastDayDto.getDay().substring(0, 10)) 
				&& matchingDetailDto.getScheduleCode().equals(selectLastDayDto.getScheduleCode())) {
			
			/* 매칭 건 중 진행예정인 건이 해당 건 외에 남아있는지 조회 */
			List<MatchingDetailDto> statusCheck = matchingService.selectMatchingDetail(matchingNumber);
			if(statusCheck.size() == 1) {
				/* matching_m status 최종완료로 update */
				MatchingDto matchingDto = new MatchingDto();
				matchingDto.setStatus("최종완료");
				matchingDto.setMatchingNumber(matchingNumber);
				int resultStatusMUpdate = matchingService.updateMatchingMStatus(matchingDto);
				
				/* seniot workStatus 'Y'로 변경 작업 */
				Map<String, String> map = new HashMap<>();
				map.put("workStatus", "Y");
				map.put("id", (String)session.getAttribute("userId"));
				
				matchingDto = matchingService.getMatchingInfo(matchingNumber);
				String[] scArr = matchingDto.getScheduleCode().split(",");
				
				for(String val : scArr) {
					map.put("scheduleCode", val);
					int resultWorkStatus = seniorService.updateScheduleWorkStatus(map);
				}
			}else {
				response.setContentType("text/html;charset=utf-8");

				PrintWriter out = response.getWriter();

				out.println("<script>");
				out.println("alert('이전 스케줄 중 완료되지 않은 스케줄이 남아있습니다.');");
				out.println("location.href='/scheduleList?matchingNumber="+matchingNumber+"';");
				out.println("</script>");
				out.close();

				return null;
			}
		}
		
		if(btnValue.equals("complete")) {
			/* matching_d status 진행완료로 update */
			matchingDetailDto.setStatus("진행완료");
			int resultStatusDUpdate = matchingService.updateMatchingDStatus(matchingDetailDto);
			
			response.setContentType("text/html;charset=utf-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('완료되었습니다.');");
			out.println("location.href='/scheduleList?matchingNumber="+matchingNumber+"';");
			out.println("</script>");
			out.close();
			
		}else {
			/* matching_d status 진행취소로 update */
			matchingDetailDto.setStatus("진행취소");
			int resultStatusDUpdate = matchingService.updateMatchingDStatus(matchingDetailDto);
			
			response.setContentType("text/html;charset=utf-8");

			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('취소되었습니다.');");
			out.println("location.href='/scheduleList?matchingNumber="+matchingNumber+"';");
			out.println("</script>");
			out.close();
			
		}
		
		return null;
	}

}
