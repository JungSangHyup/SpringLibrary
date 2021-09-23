package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sample.library.domain.BoardVO;
import com.sample.library.domain.CommentVO;
import com.sample.library.mapper.CommentMapper;

@Service
public class CommentService {
	
	@Autowired
	private CommentMapper commentMapper;
	
	public int registerCom(CommentVO commentVO) {
		return commentMapper.insert(commentVO);
	}
	
	public int nextNum() {
		return commentMapper.nextNum();
	}
	
	int deleteCommentByNum(int commentId) {
		return commentMapper.deleteCommentByNum(commentId);
	}
	
	List<CommentVO> getComments() {
		return commentMapper.getComments();
	}
	
	public CommentVO getComment(int board_id) {
		return commentMapper.getComment(board_id);
	}
	
	void updateComment(CommentVO commentVO) {
		commentMapper.updateComment(commentVO);
	}
	
	
}
