package com.sample.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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
	
	public int deleteCommentByNum(int commentId) {
		return commentMapper.deleteCommentByNum(commentId);
	}
	
	public List<CommentVO> getComments(int boardId) {
		return commentMapper.getComments(boardId);
	}
	
	public CommentVO getComment(int commentId) {
		return commentMapper.getComment(commentId);
	}
	
	public int updateComment(CommentVO commentVO) {
		return commentMapper.updateComment(commentVO);
	}
	
	
}
