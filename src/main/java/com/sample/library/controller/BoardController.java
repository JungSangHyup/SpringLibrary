package com.sample.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequestMapping("/qnaboard/*")
public class BoardController {

	@GetMapping("/list")
	public String list() {
		System.out.println("list");
		
		return "qnaboard/boardList";
	}
	
	@GetMapping("/content")
	public String content() {
		System.out.println("content");
		return "qnaboard/boardContent";
	}
	
	@GetMapping("/write")
	public String write() {
		System.out.println("write");
		return "qnaboard/boardWrite";
	}
	
}
