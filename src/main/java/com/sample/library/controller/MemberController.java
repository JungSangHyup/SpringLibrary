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

import com.sample.library.domain.MemberVO;
import com.sample.library.service.MemberService;
import com.sample.library.util.Script;


@Controller // @Component 계열 애노테이션
@RequestMapping("/member/*")
public class MemberController {
	
	private MemberService memberService;
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/join") // /member/join
	public String join() {
		System.out.println("join...");
		return "member/join";
	}
	@PostMapping("/join")
	public ResponseEntity<String> join(MemberVO memberVO) {
		
		// 비밀번호 암호화 하기
		String passwd = memberVO.getUserpass();
		String hasedPw = BCrypt.hashpw(passwd, BCrypt.gensalt()); // 암호화된 비밀번호 리턴받음
		memberVO.setUserpass(hasedPw); // 암호화된 비밀번호로 재설정
		
		// 연월일 구분문자("-") 제거하기
		String birthday = memberVO.getBirthday(); // "2021-08-25"
		birthday = birthday.replace("-", ""); // "20210825"
		memberVO.setBirthday(birthday);
		// 전화번호 등록
		String userphone = memberVO.getUserphone1()+"-"+memberVO.getUserphone2()+"-"+memberVO.getUserphone3();
		memberVO.setUserphone(userphone);
		
		// 현재시점 날짜 객체 설정
		memberVO.setRegdate(new Date());
		
		System.out.println(memberVO);
		memberService.register(memberVO); // 회원등록 처리
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String str = Script.href("회원가입 성공!", "/member/login");
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
	@GetMapping("/login")
	public String login() {
		System.out.println("login...");
		return "member/login";
	}
	@PostMapping("/login")
	public ResponseEntity<String> login(String userid, String userpass, String rememberMe, 
			HttpSession session, HttpServletResponse response) {
		
		MemberVO memberVO = memberService.getMemberById(userid);
		
		boolean isPasswdSame = false;
		String message = "";
		
		if (memberVO != null) {
			isPasswdSame = BCrypt.checkpw(userpass, memberVO.getUserpass());
			
			if (isPasswdSame == false) { // 비밀번호 일치하지 않음
				message = "비밀번호가 일치하지 않습니다.";
			}
		} else { // memberVO == null  // 일치하는 아이디가 없음
			message = "존재하지 않는 아이디 입니다.";
		}
		
		// 로그인 실패시 (없는 아이디거나 비밀번호 틀렸을때)
		if (memberVO == null || isPasswdSame == false) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");
			
			String str = Script.back(message);
			
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		// 로그인 성공시, 로그인 인증하기
		session.setAttribute("userid", userid);
		// 로그인 상태유지가 체크되었으면
		if (rememberMe != null) {
			Cookie cookie = new Cookie("userid", userid); // 로그인 아이디로 쿠키정보 생성
			cookie.setPath("/");
			cookie.setMaxAge(60 * 10); // 초단위. 60초 * 10 -> 10분
			response.addCookie(cookie); // 응답객체에 쿠키를 추가해놓으면 최종응답시 쿠키를 클라이언트에게 전송해줌
		}
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/"); // redirect 경로를 "/"로 지정
		
		// 리다이렉트일 경우 HttpStatus.FOUND 로 지정해야 함
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	} // login
	
	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userid")) {
					cookie.setMaxAge(0); 
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			} 
		}
		return "member/logout";
	}
	
	
	@GetMapping("/modify")
	public String modify() {
		System.out.println("modify 호둘됨...");
		return "member/modify";
	}
	
	@GetMapping("/myWish")
	public String myWish() {
		System.out.println("myWish 호둘됨...");
		return "member/myWish";
	}
	
	@GetMapping("/myRental")
	public String myRental() {
		System.out.println("myRental 호둘됨...");
		return "member/myRental";
	}
	
}






