package com.kids.controller.senior;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.senior.SeniorDetailDto;
import com.kids.dto.senior.SeniorScheduleDto;
import com.kids.service.file.ImageFileService;
import com.kids.service.parents.ParentsService;
import com.kids.service.senior.SeniorService;

@Controller
public class SeniorController {

	@Autowired
	SeniorService seniorService;
	
	@Autowired
    private ImageFileService imageFileService;
	
	@Autowired
	private ParentsService parentsService;
	
	@GetMapping("/seniorDetail")
	public String seniorDetail(@RequestParam(required=false) String id, Model model) {
		
		if(id == null) {
			List<SeniorDetailDto> seniorDetail = seniorService.getSeniorDetail();
			model.addAttribute("seniorDetail", seniorDetail);
			
			return "seniorDetail";			
		} else {
			
			SeniorDetailDto seniorDetail = seniorService.getSeniorDetailById(id);
			List<SeniorScheduleDto> seniorEnableSchedule = seniorService.getSeniorEnableSchedule(id);
			ImageFileDTO parentsImg = parentsService.getImgById(id);
			model.addAttribute("seniorDetail", seniorDetail);
			model.addAttribute("seniorEnableSchedule", seniorEnableSchedule);
			model.addAttribute("parentsImg", parentsImg);
			return "seniorDetailIn";
		}
	}
	
	@GetMapping("/registerSenior")
	public String askSenior(@RequestParam String id, Model model) {
		
		List<SeniorScheduleDto> seniorEnableSchedule = seniorService.getSeniorEnableSchedule(id);
		model.addAttribute("seniorEnableSchedule", seniorEnableSchedule);
		
		return "registerSenior";
	}
	
	
}
