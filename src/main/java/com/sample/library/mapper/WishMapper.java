package com.sample.library.mapper;

import java.util.List;


import com.sample.library.domain.WishVO;

public interface WishMapper {
	int nextNum(); 
	
	int wishBookbyId(WishVO wishVO);
	
	List<WishVO> getWishListbyId(String userid);
	
	public WishVO getWishBookbyBookId(int bookId, String userid);

	int cancleBook(int[] nums);
}
