package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.annotation.SessionScope;

import com.sample.library.domain.RentalVO;
import com.sample.library.mapper.BookMapper;
import com.sample.library.mapper.RentalMapper;

@Service
public class RentalService {
	@Autowired
	private RentalMapper rentalMapper;

	@Autowired
	private BookMapper bookMapper;

	@Transactional
	public int rentalBookbyId(RentalVO rentalVO) {
		bookMapper.rentalBook(Integer.parseInt(rentalVO.getRentalTitle()));
		return rentalMapper.rentalBookbyId(rentalVO);
	}

	@Transactional
	public int retBook(int[] nums) {
		bookMapper.retBook(nums);
		return rentalMapper.retBook(nums);
	}

	public int nextNum() {
		return rentalMapper.nextNum();
	}

	public List<RentalVO> getRentalListbyId(String userid) {
		return rentalMapper.getRentalListbyId(userid);
	}





}
