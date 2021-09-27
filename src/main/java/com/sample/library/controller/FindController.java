package com.sample.library.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sample.library.domain.MemberDAO;
import com.sample.library.domain.MemberVO;

@Controller
public class FindController {
	
	private MemberDAO memberDAO;
	
	@RequestMapping("/member/findId")
	public void findId(String useremail,String username, HttpServletResponse response)throws IOException{
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		if(memberDAO.FindId(useremail, username)==true) {
			MemberVO m = memberDAO.getID(useremail, username);
			
			String id = m.getUserid();
			out.write("({'result':'입력하신 정보와 일치하는 아이디는 "+id+"입니다.'})");
		}else {
			out.write("({'result':'입력하신 정보에 일치하는 아이디가 없습니다.'})");
		}
	}
}
