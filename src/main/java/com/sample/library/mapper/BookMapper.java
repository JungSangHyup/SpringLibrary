package com.sample.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sample.library.domain.BookVO;

public interface BookMapper {
	int nextNum(); 
	
	int save(BookVO bookVO); 
	
	int deleteAll();
	
	List<BookVO> getAllbook();
	
	BookVO getBook(int num);
	
	BookVO getBookAndAttaches(int num); // 글번호에 해당하는 글 한개와 첨부파일 모두 가져오기
	
	List<BookVO> getBookbyCategory(String category);

	int rentalBook(int num);

	int retBook(int[] nums);
}
