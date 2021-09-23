package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.library.domain.BookAttachVO;
import com.sample.library.mapper.BookAttachMapper;

@Service
public class BookAttachService implements BookAttachMapper{
	
	@Autowired
	BookAttachMapper bookAttachMapper;
	
	
	public int insertAttach(BookAttachVO bookAttachVO) {
		return bookAttachMapper.insertAttach(bookAttachVO);
		
	}
	
	public List<BookAttachVO> getAttachesByBno(int bno){
		return bookAttachMapper.getAttachesByBno(bno);
	}
	
    public List<BookAttachVO> getAttachesByUuids(List<String> uuidList) {
        return bookAttachMapper.getAttachesByUuids(uuidList);
    }
	
	public int deleteAttachesByBno(int bno) {
		return bookAttachMapper.deleteAttachesByBno(bno);
		
	}
}
