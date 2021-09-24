package com.sample.library.controller;


import java.io.IOException;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.library.domain.CommentVO;
import com.sample.library.service.BoardService;
import com.sample.library.service.CommentService;


@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/write")
	public String write() {
		return "qnaboard/boardContent";
	}
	
	@PostMapping("/write")
	public String write(int boardId, CommentVO commentVO, HttpServletRequest request, RedirectAttributes rttr) throws IOException {

		int num = commentService.nextNum();
		
		commentVO.setBoardId(boardId);
		commentVO.setCommentId(num);
		commentVO.setRegdate(new Date());
		
		commentService.registerCom(commentVO);
		
		
		rttr.addAttribute("boardId", boardId);
		rttr.addAttribute("pageNum", 1);
		
		return "redirect:/qnaboard/content";
	}
	
	
	
}