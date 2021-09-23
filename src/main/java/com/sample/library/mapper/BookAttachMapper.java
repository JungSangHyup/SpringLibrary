package com.sample.library.mapper;

import java.util.List;

import com.sample.library.domain.BookAttachVO;

public interface BookAttachMapper {
	int insertAttach(BookAttachVO bookAttachVO);
	List<BookAttachVO> getAttachesByBno(int bno);
	int deleteAttachesByBno(int bno);
}
