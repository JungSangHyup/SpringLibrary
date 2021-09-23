package com.sample.library.mapper;

import java.util.List;

import com.sample.library.domain.CommentVO;

public interface CommentMapper {
	
	int insert(CommentVO commentVO); // 글 한개 등록하기
	
	int nextNum(); // 다음 insert할 글번호 가져오기
	
	int deleteAll(); // 전체 행 삭제
	
	int deleteCommentByNum(int commentId); // 글번호에 해당하는 글 한개 삭제하기
	
	List<CommentVO> getComments(int boardId);  // 전체 게시글 내용 가져오기
	
	CommentVO getComment(int boardId); // 글번호에 해당하는 글 한개 가져오기
		
	int getTotalCount();  // 전체 글개수 가져오기
	
	int updateComment(CommentVO commentVO); // 글번호에 해당하는 글의 글제목, 글내용, 날짜, IP주소 수정하기
}
