package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.annotation.SessionScope;

import com.sample.library.domain.WishVO;
import com.sample.library.mapper.BookMapper;
import com.sample.library.mapper.WishMapper;

@Service
public class WishService {
	@Autowired
	private WishMapper wishMapper;

	@Autowired
	private BookMapper bookMapper;

	@Transactional
	public int wishBookbyId(WishVO wishVO) {
		return wishMapper.wishBookbyId(wishVO);
	}

	@Transactional
	public int cancleBook(int[] nums) {
		bookMapper.retBook(nums);
		return wishMapper.cancleBook(nums);
	}

	public int nextNum() {
		return wishMapper.nextNum();
	}

	public List<WishVO> getWishListbyId(String userid) {
		return wishMapper.getWishListbyId(userid);
	}

	public WishVO getWishBookbyBookId(int bookId, String userid) {
		return wishMapper.getWishBookbyBookId(bookId, userid);
	}



}
