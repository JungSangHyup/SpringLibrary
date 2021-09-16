package com.sample.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book/*")
public class BookController {
	@GetMapping(value = {"/", "/list"})
	public String list() {
		return "booklist/bookList";
	}
	
	@GetMapping("/content")
	public String content() {
		return "booklist/bookContent";
	}
	
	@GetMapping("/gallery")
	public String gallery() {
		return "booklist/bookGallery";
	}
	
	@GetMapping("/write")
	public String write() {
		return "booklist/bookWrite";
	}
}
