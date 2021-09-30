package com.sample.library.domain;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberDAO {
	@Autowired
	SqlSession sqlsession = null;

	// 회원가입
	@Transactional
	public int join_member(MemberVO member) throws Exception{
		return sqlsession.insert("member.join_member", member);
	}
	// 이메일 인증
	@Transactional
	public int approval_member(MemberVO member) throws Exception{
		return sqlsession.update("member.approval_member", member);
	}

	// 로그인 접속일자 변경
	@Transactional
	public int update_log(String userid) throws Exception{
		return sqlsession.update("member.update_log", userid);
	}
	// 아이디 찾기
	public String find_id(String useremail) throws Exception{
		return sqlsession.selectOne("member.find_id", useremail);
	}
	
}
