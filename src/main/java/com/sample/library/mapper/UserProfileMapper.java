package com.sample.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sample.library.domain.UserProfileVO;

public interface UserProfileMapper {
	@Insert("INSERT INTO user_profile (uuid, uploadpath, filename, filetype, mid) VALUES "
			+ "(#{uuid}, #{uploadpath}, #{filename}, #{filetype}, #{mid})")
	int insertProfile(UserProfileVO userProfileVO);
	
	@Select("SELECT * FROM user_profile WHERE mid = #{mid}")
	List<UserProfileVO> getProfileByMid(String mid);
	
	@Delete("DELETE FROM user_profile WHERE mid = #{mid}")
	int deleteProfileByMid(String mid);
}
