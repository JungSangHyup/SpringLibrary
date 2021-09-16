package com.sample.library.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // @Component 계열 애노테이션
@RequestMapping("/member/*")
public class MemberController {
	
	@GetMapping("/join") // /member/join
	public String join() {
		System.out.println("join 호출됨...");
		return "member/join";
	}
	
	@GetMapping("/login")
	public String login() {
		System.out.println("login...");
		return "member/login";
	}
	
	@GetMapping("/logout")
	public String logout() {
		System.out.println("logout...");
		return "member/logout";
	}
}






