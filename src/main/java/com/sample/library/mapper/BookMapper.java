package com.sample.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sample.library.domain.BookVO;
import com.sample.library.domain.ReviewVO;

public interface BookMapper {
	int nextNum(); 
	
	int save(BookVO bookVO); 
	
	int deleteAll();
	
	List<BookVO> getAllbook();
	
	BookVO getBook(int num);
	
	BookVO getBookAndAttaches(int num); // 글번호에 해당하는 글 한개와 첨부파일 모두 가져오기
	
	List<BookVO> getBookbyCategory(String category);

	// 코멘트 들고오기

	List<ReviewVO> getReviewsByBook(int num);

	// 책 대여 반납

	int rentalBook(int num);

	int retBook(int[] nums);
}
