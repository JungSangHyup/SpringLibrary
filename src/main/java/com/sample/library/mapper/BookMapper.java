package com.sample.library.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.sample.library.domain.BookVO;

@Mapper
public interface BookMapper {
	int nextNum(); // 다음 insert할 글번호 가져오기
	
	int save(BookVO bookVO); // 저장하기
}
