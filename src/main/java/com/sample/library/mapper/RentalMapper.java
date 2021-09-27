package com.sample.library.mapper;

import java.util.List;


import com.sample.library.domain.RentalVO;

public interface RentalMapper {
	int nextNum(); 
	
	int rentalBookbyId(RentalVO rentalVO);
	
	List<RentalVO> getRentalListbyId(String userid);

	int retBook(int[] nums);
}
