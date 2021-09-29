package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.library.domain.BoardAttachVO;
import com.sample.library.domain.Criteria;
import com.sample.library.mapper.BoardAttachMapper;

@Service
public class BoardAttachService {
	
	@Autowired
	private BoardAttachMapper boardattachMapper;
	
	public List<BoardAttachVO> getAttachesByBno(int bno) {
		return boardattachMapper.getAttachesByBno(bno);
	}
	
	public List<BoardAttachVO> getAttachesByUuids(List<String> uuidList) {
		return boardattachMapper.getAttachesByUuids(uuidList);
	}
	
	public List<BoardAttachVO> getImages() {
		return boardattachMapper.getImages();
	}
	
	public List<BoardAttachVO> getImagesPage(Criteria cri) {
		
		int startRow = (cri.getPageNum() - 1)*cri.getAmount();
		cri.setStartRow(startRow);
		
		return boardattachMapper.getImagesWithPaging(cri);
	}
	
	public int getTotalImages() {
		return boardattachMapper.getTotalImages();
	}
}
