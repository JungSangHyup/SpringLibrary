package com.sample.library.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ctc.wstx.util.StringUtil;
import com.sample.library.domain.MemberVO;
import com.sample.library.domain.RentalVO;
import com.sample.library.domain.UserProfileVO;
import com.sample.library.service.MemberService;
import com.sample.library.service.RentalService;
import com.sample.library.service.UserProfileService;
import com.sample.library.util.Script;

import net.coobird.thumbnailator.Thumbnailator;


@Controller // @Component 계열 애노테이션
@RequestMapping("/member/*")
public class MemberController {
	
	private MemberService memberService;
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Autowired
	private RentalService rentalService;
	@Autowired
	private UserProfileService userProfileService;
	
	@GetMapping("/join") // /member/join
	public String join() {
		System.out.println("join...");
		return "member/join";
	}
	@PostMapping("/join")
	public ResponseEntity<String> join(@RequestParam("profileimg") MultipartFile profileimg, MemberVO memberVO,
			@RequestParam(name="delfile", required = false) List<String> delProfile) throws IllegalStateException, IOException {
		
		String id = memberVO.getUserid();
		
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
		
		//프로필 등록(업로드)
		String uploadFolder = "C:/upload/profile";  // 업로드 기준경로
		
		File uploadPath = new File(uploadFolder, getFolder(id)); // C:/upload/profile/userid
		System.out.println("uploadPath : " + uploadPath.getPath());
		
		if (uploadPath.exists() == false) {  // !uploadPath.exists()
			uploadPath.mkdirs();
		}
		
		if(delProfile != null) {	//join.jsp에서 프로필 삭제버튼을 눌렀을시
			memberVO.setProfile("default");	//프로필을 설정하지 않음
		} else if(!profileimg.isEmpty()) {
			String originalFilename = profileimg.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid.toString() + "_" + originalFilename;
			
			File file = new File(uploadPath, uploadFilename); // 생성할 파일이름 정보
			
			
			// ======================================================
			
			// 현재 업로드한 파일이 이미지 파일이면 썸네일 이미지를 추가로 생성하기
			boolean isImage = checkImageType(file); // 이미지 파일여부 확인 
			
			if (isImage == true) {
				// 파일1개 업로드(파일 생성) 완료
				profileimg.transferTo(file);
				File outFile = new File(uploadPath, "p_" + uploadFilename);
				
				Thumbnailator.createThumbnail(file, outFile, 200, 200);  // 썸네일 이미지 파일 생성하기
			}
			
			
			//===== insert할 userProfileVO 객체 데이터 생성 ======
			UserProfileVO userProfileVO = new UserProfileVO();
			userProfileVO.setUuid(uuid.toString());
			userProfileVO.setUploadpath(getFolder(id));
			userProfileVO.setFilename(originalFilename);
			userProfileVO.setFiletype( (isImage == true) ? "I" : "O" );
			userProfileVO.setMid(id);
			
			memberVO.setProfile(getFolder(id) + "/p_" + uploadFilename);
			userProfileService.insertProfile(userProfileVO);
			
		}else {
			memberVO.setProfile("default");
		}
//		session.setAttribute("userid", memberVO.getUserid());
//		List<UserProfileVO> profileList = uploadProfileAndGetProfileList(files, memberVO.getUserid(), memberVO);
		
		System.out.println(memberVO);
		memberService.register(memberVO); // 회원등록 처리
		//memberService.registerAndProfile(memberVO, userProfileVO);	//회원등록&프로필등록 처리
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String str = Script.href("회원가입 성공!", "/member/login");
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
	// userid 폴더명을 리턴하는 메소드
	private String getFolder(String id) {
		String str = id;
		return str;
	}
	
	// 이미지 파일인지 여부 리턴하는 메소드
	private boolean checkImageType(File file) throws IOException {
		boolean isImage = false;
		
		String contentType = Files.probeContentType(file.toPath()); // "image/jpg"
		System.out.println("contentType : " + contentType);
		
		isImage = contentType.startsWith("image");
		return isImage;
	}
	
	private void deleteProfileFiles(List<UserProfileVO> userProfileList) {
		// 삭제할 파일정보가 없으면 메소드 종료
		if (userProfileList == null || userProfileList.size() == 0) {
			return;
		}
		
		
		String basePath = "C:/upload/profile";
		
		for(UserProfileVO userProfileVO : userProfileList) {
			String uploadpath = basePath + "/" + userProfileVO.getUploadpath();
			String filename = userProfileVO.getUuid() + "_" + userProfileVO.getFilename();
			
			File file = new File(uploadpath, filename);
			
			if (file.exists() == true) { // 해당 경로에 첨부파일이 존재하면
				file.delete(); // 첨부파일 삭제하기
			}
			
			// 첨부파일이 이미지 파일이면 썸네일 이미지파일도 삭제하기
			if (userProfileVO.getFiletype().equals("I")) { // "Image" 타입이면
				// 섬네일 이미지 존재여부 확인 후 삭제하기
				File thumbnailFile = new File(uploadpath, "p_" + filename);
				if (thumbnailFile.exists() == true) {
					thumbnailFile.delete();
				}
			}
		} // for
	} // deleteProfileFiles
	
	
	
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
	@GetMapping("/findId")
	public String findId() {
		System.out.println("findId...");
		return "member/findId";
	}
	@GetMapping("/findPw")
	public String findPw() {
		System.out.println("findPw...");
		return "member/findPw";
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
	public String modify(HttpSession session, Model model) {
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
		
		
		//기존 프로필 불러오기
		String onlyProfile =memberVO.getProfile();
		String vProfile = null;
		if(onlyProfile == "default" || onlyProfile == null) {
			vProfile = "default";
		} else {
			vProfile = onlyProfile;
		}
		
		session.setAttribute("profile", vProfile);
		
		
		
		System.out.println(memberVO);
		
		System.out.println("modify 호둘됨...");
		return "member/modify";
	}
	
	
	
	@PostMapping("/modify")
	public ResponseEntity<String> modify(@RequestParam("profileimg") MultipartFile profileimg, MemberVO memberVO, HttpSession session,
			@RequestParam(name="delfile", required = false) List<String> delProfile) throws IOException{
		
		String id = (String) session.getAttribute("userid");
		memberVO.setUserid(id);
		
		// 연월일 구분문자("-") 제거하기
		String birthday = memberVO.getBirthday(); // "2021-08-25"
		birthday = birthday.replace("-", ""); // "20210825"
		memberVO.setBirthday(birthday);
		// 전화번호 등록
		String userphone = memberVO.getUserphone1()+"-"+memberVO.getUserphone2()+"-"+memberVO.getUserphone3();
		memberVO.setUserphone(userphone);
		
		//프로필 업데이트(삭제&업로드)
		String uploadFolder = "C:/upload/profile";  // 업로드 기준경로
		
		File uploadPath = new File(uploadFolder, getFolder(id)); // C:/upload/profile/userid
		System.out.println("uploadPath : " + uploadPath.getPath());
		
		if (uploadPath.exists() == false) {  // !uploadPath.exists()
			uploadPath.mkdirs();
		}
		
		if(delProfile != null) {	//modify.jsp에서 프로필 삭제버튼을 눌렀을시
			List<UserProfileVO> userProfileList = userProfileService.getProfileByMid(id);
			deleteProfileFiles(userProfileList);
			userProfileService.deleteProfileByMid(id);		//기존 프로필 파일 삭제
			memberVO.setProfile("default");
		} else if(!profileimg.isEmpty()) {	//새로운 프로필 이미지 업로드시
			
			
			String originalFilename = profileimg.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid.toString() + "_" + originalFilename;
			
			File file = new File(uploadPath, uploadFilename); // 생성할 파일이름 정보
			
			
			// ======================================================
			
			// 현재 업로드한 파일이 이미지 파일이면 썸네일 이미지를 추가로 생성하기
			boolean isImage = checkImageType(file); // 이미지 파일여부 확인 
			
			if (isImage == true) {
				// 파일1개 업로드(파일 생성) 완료
				profileimg.transferTo(file);
				File outFile = new File(uploadPath, "p_" + uploadFilename);
				
				Thumbnailator.createThumbnail(file, outFile, 200, 200);  // 썸네일 이미지 파일 생성하기
			}
			
			
			//===== insert할 userProfileVO 객체 데이터 생성 ======
			UserProfileVO userProfileVO = new UserProfileVO();
			userProfileVO.setUuid(uuid.toString());
			userProfileVO.setUploadpath(getFolder(id));
			userProfileVO.setFilename(originalFilename);
			userProfileVO.setFiletype( (isImage == true) ? "I" : "O" );
			userProfileVO.setMid(id);
			
			memberVO.setProfile(getFolder(id) + "/p_" + uploadFilename);
			userProfileService.insertProfile(userProfileVO);
			
		}
		
		
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
	
	@GetMapping("/rental")
	public String rental(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		
		List<RentalVO> rentalList = rentalService.getRentalListbyId(userid);
		model.addAttribute("rentalList", rentalList);
		
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
		
		//프로필 삭제
		if(memberVO.getProfile() != "default" || memberVO.getProfile() == null) {	//modify.jsp에서 프로필 삭제버튼을 눌렀을시
			List<UserProfileVO> userProfileList = userProfileService.getProfileByMid(id);
			deleteProfileFiles(userProfileList);
			userProfileService.deleteProfileByMid(id);		//프로필 파일 삭제
			
			String uploadFolder = "C:/upload/profile";  // 업로드 기준경로
			
			File uploadPath = new File(uploadFolder, getFolder(id)); // C:/upload/profile/userid
			System.out.println("uploadPath : " + uploadPath.getPath());
			
			if (uploadPath.exists() == true) {  // uploadPath.exists()
				uploadPath.delete();	//폴더 삭제
			}
		}
		//멤버 삭제
		memberService.deleteMemberById(id);
		
		
		str = Script.href("회원 탈퇴 완료", "/");
		session.invalidate();
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
}






