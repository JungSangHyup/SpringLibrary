package com.sample.library.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.library.domain.MemberVO;
import com.sample.library.domain.UserProfileVO;
import com.sample.library.mapper.MemberMapper;
import com.sample.library.mapper.UserProfileMapper;

@Service // @Component 계열 애노테이션
//@Transactional
public class MemberService {

	private MemberMapper memberMapper;
	private UserProfileMapper userProfileMapper;

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
	
	@Transactional
	public void registerAndProfile(MemberVO memberVO, UserProfileVO userProfileVO) {
		memberMapper.insert(memberVO);
		userProfileMapper.insertProfile(userProfileVO);
		
	}
	

	public MemberVO getMemberById(String userid) {
		MemberVO memberVO = memberMapper.getMemberById(userid);
		return memberVO;
	}

	public List<MemberVO> getMembers() {
		return memberMapper.getUsers();
	}

	public int getCountById(String userid) {
		return memberMapper.getCountById(userid);
	}

	public int deleteMemberById(String userid) {
		int rowCount = memberMapper.deleteMemberById(userid);
		return rowCount;
	}

	public void updateMember(MemberVO memberVO) {
		String userid = memberVO.getUserid();
		memberMapper.updateMember(memberVO);
	}
	
	public void updatePw(MemberVO memberVO) {
		memberMapper.updatePw(memberVO);
	}
}
