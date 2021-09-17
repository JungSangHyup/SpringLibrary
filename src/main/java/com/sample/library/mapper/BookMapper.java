package com.sample.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.sample.library.domain.BookVO;

@Mapper
public interface BookMapper {
	int nextNum(); 
	
	int save(BookVO bookVO); 
	
	int deleteAll();
	
	List<BookVO> getAllbook();
}
