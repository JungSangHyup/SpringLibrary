package com.sample.library.mapper;

import java.util.List;


import com.sample.library.domain.RentalVO;

public interface RentalMapper {
	int nextNum(); 
	
	int rentalBookbyId(RentalVO rentalVO);
	
	List<RentalVO> getRentalListbyId(String userid);
	
	RentalVO getRentalBookbyBookId(int bookId);

	int retBook(int[] nums);
}
