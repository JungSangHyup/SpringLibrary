package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.library.domain.BookVO;
import com.sample.library.domain.ReviewVO;
import com.sample.library.mapper.BookMapper;

@Service
public class BookService{
	@Autowired
	private BookMapper bookMapper;
	
    public int nextNum() {
        return bookMapper.nextNum();
    }

    public int nextReviewNum() {
    	return bookMapper.nextReviewNum();
	}

	public int setReview(ReviewVO reviewVO){
    	return bookMapper.setReview(reviewVO);
	}
    
    public List<BookVO> getAllbook() {
    	return bookMapper.getAllbook();
    }
    
    public BookVO getBook(int num) {
    	return bookMapper.getBook(num);
    }
	
	public int save(BookVO bookVO) {
		return bookMapper.save(bookVO);
	}
	
	public int deleteAll() {
		return bookMapper.deleteAll();
	}

	public BookVO getBookAndAttaches(int num) {
		return bookMapper.getBookAndAttaches(num);
	}

	public List<ReviewVO> getReviewsByBook(int num){
    	return bookMapper.getReviewsByBook(num);
	}

	public List<BookVO> getBookbyCategory(String category) {
		return bookMapper.getBookbyCategory(category);
	}
}
