package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.library.domain.BoardVO;
import com.sample.library.domain.Criteria;
import com.sample.library.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	public int register(BoardVO boardVO) {
		return boardMapper.insert(boardVO);
	}
	
	public int nextNum() {
		return boardMapper.nextNum();
	}
	
	public int deleteAll() {
		return boardMapper.deleteAll();
	}
	

	public List<BoardVO> getBoards() {
		return boardMapper.getBoards();
	}
	
	// 페이징으로 글 가져오기
	public List<BoardVO> getBoards(Criteria cri) {
		// 시작 행번호 (MySQL의 LIMIT절의 시작행번호) 구하기
		
		// 한 페이지당 글개수(amount)가 10개씩일때
		// 1 페이지 -> 0
		// 2 페이지 -> 10
		// 3 페이지 -> 20
		// 4 페이지 -> 30
		// ...
		int startRow = (cri.getPageNum() - 1) * cri.getAmount();
		cri.setStartRow(startRow); // 시작행번호 설정
		
		return boardMapper.getBoardsWithPaging(cri);
	}
	
	public int getTotalCount() {
		return boardMapper.getTotalCount();
	}
	
	public int getTotalCountBySearch(Criteria cri) {
		return boardMapper.getTotalCountBySearch(cri);
	}
	
	public BoardVO getBoard(int board_id) {
		return boardMapper.getBoard(board_id);
	}
	
}
