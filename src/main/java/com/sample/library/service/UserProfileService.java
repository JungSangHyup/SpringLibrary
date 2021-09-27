package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.library.domain.UserProfileVO;
import com.sample.library.mapper.UserProfileMapper;

@Service
public class UserProfileService implements UserProfileMapper{
	
	@Autowired
	UserProfileMapper userProfileMapper;
	
	
	public int insertProfile(UserProfileVO userProfileVO) {
		return userProfileMapper.insertProfile(userProfileVO);
		
	}
	
	public List<UserProfileVO> getProfileByMid(String mid){
		return userProfileMapper.getProfileByMid(mid);
	}
	
	public int deleteProfileByMid(String mid) {
		return userProfileMapper.deleteProfileByMid(mid);
		
	}
}
