package com.kids.controller.parents;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kids.dto.image.ImageFileDTO;
import com.kids.dto.parents.ParentsDetailDto;
import com.kids.service.parents.ParentsService;

@Controller
public class ParentsController {
	
	@Autowired
	ParentsService parentsService;
	
	@GetMapping("/parentsDetailIn")
	public String parentsDetailIn(@RequestParam String id, Model model) {
		
		ParentsDetailDto parentsDetail = parentsService.getParentsDetailById(id);
		ImageFileDTO parentsImg = parentsService.getImgById(id);
		model.addAttribute("parentsDetail", parentsDetail);
		model.addAttribute("parentsImg", parentsImg);
		
		return "parentsDetailIn";
	}
}
