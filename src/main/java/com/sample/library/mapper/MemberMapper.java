package com.sample.library.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sample.library.domain.MemberVO;

public interface MemberMapper {

	@Insert("INSERT INTO users (userid, userpass, username,gender,birthday, userphone, useraddr1, useraddr2, useremail, recvemail, profile, regdate,logdate, grade, mileage) "
			+ " VALUES (#{userid}, #{userpass}, #{username},#{gender}, #{birthday}, #{userphone}, #{useraddr1}, #{useraddr2}, #{useremail}, #{recvemail}, #{profile}, #{regdate},#{logdate}, #{grade}, #{mileage}) ")
	int insert(MemberVO memberVO);
	
	@Select("SELECT * FROM users WHERE userid = #{userid}")
	MemberVO getMemberById(String userid);
	
	@Select("SELECT * FROM users ORDER BY userid")
	List<MemberVO> getUsers();
	
	@Select("SELECT COUNT(*) FROM users WHERE userid = #{userid}")
	int getCountById(String userid);
	
	@Delete("DELETE FROM users WHERE userid = #{userid}")
	int deleteMemberById(String userid);
	
	
	@Update(" UPDATE users "
			+ " SET username = #{username}, gender = #{gender}, birthday = #{birthday}, userphone = #{userphone}, useraddr1 = #{useraddr1}, useraddr2 = #{useraddr2}, recvemail = #{recvemail}, profile = #{profile}"
			+ " WHERE userid = #{userid} ")
	void updateMember(MemberVO memberVO);
	
	@Update(" UPDATE users "
			+ " SET userpass = #{userpass}"
			+ "WHERE userid = #{userid}")
	void updatePw(MemberVO memberVO);
	
}







