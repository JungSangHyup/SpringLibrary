package com.sample.library.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sample.library.domain.BookAttachVO;

public interface BookAttachMapper {
	@Insert("INSERT INTO book_attach (uuid, uploadpath, filename, filetype, bno) VALUES "
			+ "(#{uuid}, #{uploadpath}, #{filename}, #{filetype}, #{bno})")
	int insertAttach(BookAttachVO bookAttachVO);
	
	@Select("SELECT FROM book_attach WHERE bno = #{bno}")
	List<BookAttachVO> getAttachesByBno(int bno);
	
	@Delete("DELETE FROM book_attach WHERE bno = #{bno}")
	int deleteAttachesByBno(int bno);
	
	List<BookAttachVO> getAttachesByUuids(List<String> uuidList);
}
