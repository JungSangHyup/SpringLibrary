package com.sample.library.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.library.domain.BoardVO;
import com.sample.library.domain.Criteria;
import com.sample.library.domain.PageDTO;
import com.sample.library.service.BoardService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/qnaboard/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;

	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		System.out.println("list 호출...");
		
		List<BoardVO> boardList = boardService.getBoards(cri);
		
		int totalCount = boardService.getTotalCountBySearch(cri);
		
		PageDTO pageDTO = new PageDTO(totalCount, cri);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageDTO);
		
		return "qnaboard/boardList";
	}
	
	@GetMapping("/content")
	public String content(int boardId, @ModelAttribute("pageNum") String pageNum, Model model) {
		System.out.println("content");
		
		BoardVO boardVO = boardService.getBoard(boardId);
		
		model.addAttribute("boardVO", boardVO);
		
		return "qnaboard/boardContent";
	}
	
	@GetMapping("/write")
	public String write(@ModelAttribute("pageNum") String pageNum) {
		System.out.println("write");
		return "qnaboard/boardWrite";
	}
	
	// 첨부파일 업로드와 함께 주글쓰기 처리
		@PostMapping("/write")
		public String write(BoardVO boardVO, 
				HttpServletRequest request, RedirectAttributes rttr) throws IOException {
			
			// insert할 새 글번호 가져오기
			int num = boardService.nextNum();
			
			
			// ===== insert할 BoardVO 객체 데이터 설정 ======
			boardVO.setBoardId(num);
			boardVO.setRegdate(new Date());
			
			
			boardService.register(boardVO);
			//===============================================
			
			// 리다이렉트시 서버에 전달할 데이터를 저장하면 스프링이 자동으로 쿼리스트링으로 변환하여 처리해줌
			rttr.addAttribute("boardId", boardVO.getBoardId());
			rttr.addAttribute("pageNum", 1);
			
			return "redirect:/qnaboard/content";
		} // post write
		
	
}
