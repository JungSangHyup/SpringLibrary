package com.sample.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book/*")
public class BookController {
	@GetMapping(value = {"/", "/list"})
	public String list() {
		System.out.println("content");
		return "booklist/bookList";
	}
	
	@GetMapping("/content")
	public String content() {
		System.out.println("content");
		return "booklist/bookContent";
	}
	
	@GetMapping("/gallery")
	public String gallery() {
		System.out.println("content");
		return "booklist/bookGallery";
	}
}
