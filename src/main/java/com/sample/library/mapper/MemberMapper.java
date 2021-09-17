package com.sample.library.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sample.library.domain.MemberVO;

public interface MemberMapper {

	@Insert("INSERT INTO users (userid, userpass, username,gender,birthday, userphone, useraddr1, useraddr2, useremail, recvemail, profile, regdate, grade, mileage) "
			+ " VALUES (#{userid}, #{userpass}, #{username},#{gender}, #{birthday}, #{userphone}, #{useraddr1}, #{useraddr2}, #{useremail}, #{recvemail}, #{profile}, #{regdate}, #{grade}, #{mileage}) ")
	int insert(MemberVO memberVO);
	
	@Select("SELECT * FROM users WHERE id = #{userid}")
	MemberVO getMemberById(String id);
	
	@Select("SELECT * FROM users ORDER BY userid")
	List<MemberVO> getUsers();
	
	@Select("SELECT COUNT(*) FROM users WHERE userid = #{userid}")
	int getCountById(String id);
	
	@Delete("DELETE FROM users WHERE userid = #{userid}")
	int deleteMemberById(String id);
	
	
	@Update(" UPDATE users "
			+ " SET passwd = #{userpass}, name = #{username}, birthday = #{birthday}, userphone = #{userphone}, useraddr1 = #{useraddr1}, useraddr2 = #{useraddr2},  regdate = #{regdate}, profile = #{profile}, grade = #{grade}, mileage = #{mileage}"
			+ " WHERE id = #{id} ")
	void updateMember(MemberVO memberVO);
	
}







