package com.sample.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.sample.library.domain.RentalVO;
import com.sample.library.mapper.RentalMapper;

@Service
public class RentalService implements RentalMapper{
	@Autowired
	private RentalMapper rentalMapper;

	@Override
	public int rentalBookbyId(RentalVO rentalVO) {
		return rentalMapper.rentalBookbyId(rentalVO);	
	}

	@Override
	public int nextNum() {
		return rentalMapper.nextNum();
	}



}
