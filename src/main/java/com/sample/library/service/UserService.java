package com.sample.library.service;


import javax.servlet.http.HttpServletResponse;

import com.sample.library.domain.MemberVO;
public interface UserService {
	
	
	String create_key() throws Exception;

	void send_mail(MemberVO member) throws Exception;

	void approval_member(MemberVO member, HttpServletResponse response) throws Exception;

	MemberVO login(MemberVO member, HttpServletResponse response) throws Exception;

	String find_id(HttpServletResponse response, String email) throws Exception;
	
}
