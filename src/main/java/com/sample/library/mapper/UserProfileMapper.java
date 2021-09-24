package com.sample.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sample.library.domain.UserProfileVO;

public interface UserProfileMapper {
	@Insert("INSERT INTO user_profile (uuid, uploadpath, filename, filetype, mid) VALUES "
			+ "(#{uuid}, #{uploadpath}, #{filename}, #{filetype}, #{mid})")
	int insertProfile(List<UserProfileVO> userProfileVO);
	
	@Select("SELECT FROM user_profile WHERE bno = #{mid}")
	List<UserProfileVO> getProfileByMid(int mid);
	
	@Delete("DELETE FROM user_profile WHERE bno = #{mid}")
	int deleteProfileByMid(int mid);
}
