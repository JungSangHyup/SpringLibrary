package com.sample.library.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sample.library.domain.MemberVO;

public interface MemberMapper {

	@Insert("INSERT INTO member (id, passwd, name, birthday, gender, email, recv_email, reg_date) "
			+ " VALUES (#{id}, #{passwd}, #{name}, #{birthday}, #{gender}, #{email}, #{recvEmail}, #{regDate}) ")
	int insert(MemberVO memberVO);
	
	@Select("SELECT * FROM member WHERE id = #{id}")
	MemberVO getMemberById(String id);
	
	@Select("SELECT * FROM member ORDER BY id")
	List<MemberVO> getMembers();
	
	@Select("SELECT COUNT(*) FROM member WHERE id = #{id}")
	int getCountById(String id);
	
	@Delete("DELETE FROM member WHERE id = #{id}")
	int deleteMemberById(String id);
	
	
	@Update(" UPDATE member "
			+ " SET passwd = #{passwd}, name = #{name}, birthday = #{birthday}, gender = #{gender}, email = #{email}, recv_email = #{recvEmail} "
			+ " WHERE id = #{id} ")
	void updateMember(MemberVO memberVO);
	
}







