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
}
