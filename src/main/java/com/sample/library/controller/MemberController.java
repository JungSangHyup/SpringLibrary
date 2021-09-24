package com.sample.library.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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

import com.ctc.wstx.util.StringUtil;
import com.mchange.lang.StringUtils;
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
	@GetMapping("/findUser")
	public String findUser() {
		System.out.println("findUser...");
		return "member/findUser";
	}
	
	@GetMapping("/beforeModify")
	public String beforeModify() {
		System.out.println("beforeModify 호둘됨...");
		return "member/beforeModify";
	}
	@PostMapping("/beforeModify")
	public ResponseEntity<String> beforeModify(String passwd,
			HttpSession session, HttpServletResponse response){
		
		String id = (String) session.getAttribute("userid");
		
		MemberVO memberVO = memberService.getMemberById(id);
				
		boolean isPasswdSame = false;
		String message = "";
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		String str = null;
		
		isPasswdSame = BCrypt.checkpw(passwd, memberVO.getUserpass());
		if (isPasswdSame == false) { // 비밀번호 일치하지 않을때
			message = "비밀번호가 일치하지 않습니다.";
			
			str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		str = Script.href("본인 인증 완료!", "/member/modify");
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
	
	
	@GetMapping("/modify")
	public String modify(HttpSession session) {
		String id = (String) session.getAttribute("userid");
		MemberVO memberVO = memberService.getMemberById(id);
		
		session.setAttribute("username", memberVO.getUsername());
		session.setAttribute("gender", memberVO.getGender());
		
		session.setAttribute("useraddr1", memberVO.getUseraddr1());
		session.setAttribute("useraddr2", memberVO.getUseraddr2());
		session.setAttribute("useremail", memberVO.getUseremail());
		session.setAttribute("recvemail", memberVO.getRecvemail());
		
		//전화번호 분리하기
		String userPhone = memberVO.getUserphone();
		String[] phoneArr = userPhone.split("-");
		
		memberVO.setUserphone1(phoneArr[0]);
		memberVO.setUserphone2(phoneArr[1]);
		memberVO.setUserphone3(phoneArr[2]);
		
		session.setAttribute("userphone1", memberVO.getUserphone1());
		session.setAttribute("userphone2", memberVO.getUserphone2());
		session.setAttribute("userphone3", memberVO.getUserphone3());
		
		//생년월일 구분자 추가하기
		String birthday = memberVO.getBirthday();	//20210825
		
		String birthdayBar = birthday.substring(0, 4) + "-" + birthday.substring(4, 6) + "-" + birthday.substring(6);
		
		session.setAttribute("birthday", birthdayBar);
	
		System.out.println(memberVO);
		
		System.out.println("modify 호둘됨...");
		return "member/modify";
	}
	
	
	
	@PostMapping("/modify")
	public ResponseEntity<String> modify(MemberVO memberVO, HttpSession session){
		
		String id = (String) session.getAttribute("userid");
		memberVO.setUserid(id);
		
		// 연월일 구분문자("-") 제거하기
		String birthday = memberVO.getBirthday(); // "2021-08-25"
		birthday = birthday.replace("-", ""); // "20210825"
		memberVO.setBirthday(birthday);
		// 전화번호 등록
		String userphone = memberVO.getUserphone1()+"-"+memberVO.getUserphone2()+"-"+memberVO.getUserphone3();
		memberVO.setUserphone(userphone);
			
		memberService.updateMember(memberVO); // 회원정보 update 처리
		System.out.println(memberVO);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		String str = null;
		
		str = Script.href("회원정보 수정완료!", "/");
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
	@GetMapping("/changePw")
	public String changePw() {
		System.out.println("changePw 호둘됨...");
		return "member/changePw";
	}
	
	@PostMapping("/changePw")
	public ResponseEntity<String> changePw(String newPw1, String newPw2, String oldPw,
			 HttpSession session){
		
		String id = (String) session.getAttribute("userid");
		
		MemberVO memberVO = memberService.getMemberById(id);
				
		boolean isPasswdSame = false;
		String message = "";
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		String str = null;
		
		isPasswdSame = BCrypt.checkpw(oldPw, memberVO.getUserpass());
		if (isPasswdSame == false) { // 비밀번호 일치하지 않을때
			message = "현재 비밀번호가 일치하지 않습니다.";
			
			str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		if (newPw1.equals(newPw2) == false) {	//새 비밀번호 확인이 일치하지 않을때
			message = "새 비밀번호 확인이 일치하지 않습니다.";
			
			str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		String hashedPw = BCrypt.hashpw(newPw1, BCrypt.gensalt());
		memberVO.setUserpass(hashedPw);
		memberService.updatePw(memberVO);
		
		str = Script.href("비밀번호 변경 완료!", "/");
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
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
	
	@GetMapping("/remove")
	public String remove() {
		System.out.println("remove 호출...");
		return "member/remove";
	}
	
	@PostMapping("/remove")
	public ResponseEntity<String> remove(String passwd,
			HttpSession session, HttpServletResponse response){
		
		
		String id = (String) session.getAttribute("userid");
		MemberVO memberVO = memberService.getMemberById(id);
		
		boolean isPasswdSame = false;
		String message = "";
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		String str = null;
		
		isPasswdSame = BCrypt.checkpw(passwd, memberVO.getUserpass());
		if (isPasswdSame == false) { // 비밀번호 일치하지 않을때
			message = "비밀번호가 일치하지 않습니다.";
			
			str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		memberService.deleteMemberById(id);
		
		
		str = Script.href("회원 탈퇴 완료", "/");
		session.invalidate();
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
}






