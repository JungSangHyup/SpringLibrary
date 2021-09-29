package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sample.library.domain.BoardAttachVO;
import com.sample.library.domain.BoardVO;
import com.sample.library.domain.Criteria;
import com.sample.library.mapper.BoardAttachMapper;
import com.sample.library.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardAttachMapper boardattachMapper;

	public int register(BoardVO boardVO) {
		return boardMapper.insert(boardVO);
	}

	public int nextNum() {
		return boardMapper.nextNum();
	}

	public int deleteAll() {
		return boardMapper.deleteAll();
	}
	
	public void deleteBoardByNum(int board_id) {
		boardMapper.deleteBoardByNum(board_id);
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

	public void updateBoard(BoardVO boardVO) {
		
		boardMapper.updateBoard(boardVO);
	}
	
	public void updateChk(String boardId) {
		boardMapper.updateChk(boardId);
	}

	public void updateCommentCnt(int boardId) {
		boardMapper.updateCommentCnt(boardId);
	}
	

	public BoardVO getBoardAndAttaches(int boardId) {

		return boardMapper.getBoardAndAttaches(boardId); // join 쿼리로 데이터 가져오기
	}
	
	@Transactional
	public void deleteBoardAndAttaches(int num) {
		boardattachMapper.deleteAttachesByBno(num);
		boardMapper.deleteBoardByNum(num);
	}
	
	@Transactional
	public void updateBoardAndInsertAttachesAndDeleteAttaches(BoardVO boardVO, List<BoardAttachVO> newAttachList, List<String> delUuidList) {
		
		if (newAttachList != null && newAttachList.size() > 0) {
			boardattachMapper.insertAttaches(newAttachList);
		}
		
		if (delUuidList != null && delUuidList.size() > 0) {
			boardattachMapper.deleteAttachesByUuids(delUuidList);
		}
		
		boardMapper.updateBoard(boardVO);
	} // updateBoardAndInsertAttachesAndDeleteAttaches
	
	@Transactional
	public void registerBoardAndAttaches(BoardVO boardVO, List<BoardAttachVO> attachList) {
		// attach 테이블의 bno 컬럼이 외래키로서
		// board 테이블의 num 컬럼을 참조하므로
		// board 레코드가 먼저 insert된 후 attach 레코드가 insert되야 함.
		boardMapper.insert(boardVO);
		
		if (attachList != null && attachList.size() > 0) {
			boardattachMapper.insertAttaches(attachList);
		}
	} // registerBoardAndAttaches
	
}
