package com.sample.library.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.library.domain.MemberVO;
import com.sample.library.mapper.MemberMapper;

@Service // @Component 계열 애노테이션
//@Transactional
public class MemberService {
	
	private MemberMapper memberMapper;

	// @Autowired 애노테이션이 생성자에서는 생략가능 
	public MemberService(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}
	
	// 회원가입하기
	public void register(MemberVO memberVO) {
		
//		long beginTime = System.currentTimeMillis();
		
		memberMapper.insert(memberVO);
		
//		long endTime = System.currentTimeMillis();
		
//		long diff = endTime - beginTime;
//		System.out.println("메소드 실행시간 : " + diff + "ms");
	}
	
	public MemberVO getMemberById(String id) {
		MemberVO memberVO = memberMapper.getMemberById(id);
		return memberVO;
	}
	
	public List<MemberVO> getMembers() {
		return memberMapper.getUsers();
	}
	
	public int getCountById(String id) {
		return memberMapper.getCountById(id);
	}
	
	public int deleteMemberById(String id) {
		int rowCount = memberMapper.deleteMemberById(id);
		return rowCount;
	}
	
	public void updateMember(MemberVO memberVO) {
		memberMapper.updateMember(memberVO);
	}
}





