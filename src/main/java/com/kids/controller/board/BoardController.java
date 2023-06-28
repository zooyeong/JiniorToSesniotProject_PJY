package com.kids.controller.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kids.dto.board.BoardDto;
import com.kids.service.board.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;
	
	//글 작성하는 페이지
	@GetMapping("/addNewArticle")
	public String addNewArticle() {
		
		return "articleForm";
	}
	
	//새로운 글 작성하기
	@PostMapping("/addNewArticle")
	public String addNewArticle_process(@ModelAttribute BoardDto boardDto) {
		
		int result = boardService.addNewArticle(boardDto);
		
		System.out.println(result);
		
		//return "redirect:/articleList";
		return "redirect:/listPage";
	}
	
	//게시글 전체 리스트 보기
	@GetMapping("/articleList")
	public String articleList(Model model) {
		
		List<BoardDto> articleList =  boardService.getAllArticleList();
		model.addAttribute("articleList", articleList);
		
		return "listPage";
	}
	
	//게시글 상세 보기
	@GetMapping("/viewArticle")
	public String viewArticle(Model model, @RequestParam int articleNo) {
		
		BoardDto boardDto = new BoardDto();
		boardDto.setArticleNo(articleNo);
		
		int result = boardService.updateViews(articleNo); //조회수 증가시키기
		
		BoardDto article = boardService.getArticleByArticleNo(articleNo);
		model.addAttribute("article", article);

		return "viewArticle";
	}
	
	//게시글 수정하는 페이지 보기
	@GetMapping("/modifyArticle")
	public String modifyArticle(Model model, @RequestParam int articleNo) {
		
		BoardDto boardDto = new BoardDto();
		boardDto.setArticleNo(articleNo);
		
		BoardDto article = boardService.getArticleByArticleNo(articleNo);
		
		model.addAttribute("article", article);
		
		return "modifyArticle";
	}
	
	//글 수정 완료를 수행
	@PostMapping("/modifyArticle")
	public String modifyArticle_process(@ModelAttribute BoardDto boardDto) {
		
		int result = boardService.updateArticle(boardDto);
		System.out.println("게시물 수정 : result " + result);
		
		return "redirect:/viewArticle?articleNo="+boardDto.getArticleNo();
	}
	
	@GetMapping("/deleteArticle")
	public String deleteArticle(@RequestParam int articleNo) {
		
		boardService.removeArticle(articleNo);
		
		return "redirect:/listPage";
	}
	
	//페이징 처리 + 게시글 목록
	@GetMapping("/listPage")
	public String getArticlePage(Model model, @RequestParam(name="num", defaultValue = "1") int num) {
		
		System.out.println("num : " + num);
		
		//게시물 총 갯수
		int count = boardService.getArticleCount();
		
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
		
		List<BoardDto> articleList = null;
		articleList = boardService.getListPage(displayArticle, articleNum);
		model.addAttribute("articleList", articleList);
		model.addAttribute("pageNum", pageNum);
		
		return "listPage";
	}
	
	@GetMapping("/reply")
	public String reply(Model model, @RequestParam int parentNo) {
		
		System.out.println("답변하기 부모글 번호 : " + parentNo);
		model.addAttribute("parentNo", parentNo);
		
		return "replyForm";
	}
	@PostMapping("/reply")
	public String reply_process(@ModelAttribute BoardDto boardDto) {
		
		System.out.println("부모글번호 : " + boardDto.getParentNo());
		System.out.println(boardDto.toString());
		boardService.addNewArticle(boardDto);
		return "redirect:/listPage";
	}
	
}
