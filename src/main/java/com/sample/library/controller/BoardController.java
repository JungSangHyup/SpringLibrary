package com.sample.library.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.library.domain.BoardVO;
import com.sample.library.domain.BooksResponseDTO;
import com.sample.library.domain.CommentVO;
import com.sample.library.domain.Criteria;
import com.sample.library.domain.DocDTO;
import com.sample.library.domain.PageDTO;
import com.sample.library.service.BoardService;
import com.sample.library.service.CommentService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/qnaboard/*")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;

	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		System.out.println("list 호출...");

		List<BoardVO> boardList = boardService.getBoards(cri);

		int totalCount = boardService.getTotalCountBySearch(cri);

		PageDTO pageDTO = new PageDTO(totalCount, cri);

		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageDTO);

		return "qnaboard/boardList";
	}

	@GetMapping("/content")
	public String content(@RequestParam("boardId") int boardId, @ModelAttribute("pageNum") String pageNum, Model model) {
		System.out.println("content");

		BoardVO boardVO = boardService.getBoard(boardId);
		
		boardService.updateCommentCnt(boardId);
	
		List<CommentVO> commentList = commentService.getComments(boardId);
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("commentList", commentList);
		
		return "qnaboard/boardContent";
	}

	@GetMapping("/write")
	public String write(@ModelAttribute("pageNum") String pageNum) {
		System.out.println("write");
		
		return "qnaboard/boardWrite";
	}

	// 첨부파일 업로드와 함께 주글쓰기 처리
	@PostMapping("/write")
	public String write(BoardVO boardVO, HttpServletRequest request, RedirectAttributes rttr) throws IOException {

		// insert할 새 글번호 가져오기
		int num = boardService.nextNum();

		// ===== insert할 BoardVO 객체 데이터 설정 ======
		boardVO.setBoardId(num);
		boardVO.setRegdate(new Date());

		boardService.register(boardVO);
		// ===============================================

		// 리다이렉트시 서버에 전달할 데이터를 저장하면 스프링이 자동으로 쿼리스트링으로 변환하여 처리해줌
		rttr.addAttribute("boardId", boardVO.getBoardId());
		rttr.addAttribute("pageNum", 1);

		return "redirect:/qnaboard/content";
	} // post write
	
	@GetMapping("/remove")
	public String remove(int boardId, String pageNum) {
	

		// attach 와 board 테이블 내용 삭제 - 트랜잭션 단위로 처리 적용
		boardService.deleteBoardByNum(boardId);
		
		// 글목록으로 리다이렉트 이동
		return "redirect:/qnaboard/list?pageNum=" + pageNum;
	} // remove

	@GetMapping("/qnaboard/modify")
	public String modifyForm(int boardId, @ModelAttribute("pageNum") String pageNum, Model model) {

		BoardVO boardVO = boardService.getBoard(boardId);

		model.addAttribute("board", boardVO);
		// model.addAttribute("pageNum", pageNum); // @ModelAttribute 애노테이션으로 처리함과 동일

		return "qnaboard/boardModify";
	} // modifyForm

	@PostMapping("/modify")
	public String modify(BoardVO boardVO, String pageNum, HttpServletRequest request,
			RedirectAttributes rttr) throws IllegalStateException, IOException {


		// 3) boardVO 준비해서 첨부파일 신규리스트, 삭제리스트와 함께
		// 테이블 글 수정(update)을 트랜잭션 단위로 처리

		// ===== update할 BoardVO 객체 데이터 설정 ======
		boardVO.setRegdate(new Date());
		

		// 글번호에 해당하는 글정보 수정. 첨부파일정보 수정(insert, delete) - 트랜잭션 단위 처리
		boardService.updateBoard(boardVO);
		System.out.println("================ POST modify - 테이블 수정 완료 ================");

		// 리다이렉트 쿼리스트링 정보 설정
		rttr.addAttribute("boardId", boardVO.getBoardId());
		rttr.addAttribute("pageNum", pageNum);

		// 상세보기 화면으로 리다이렉트 이동
		return "redirect:/qnaboard/content";
	} // modify

	
	@RequestMapping(value="/commentUpdateView", method = RequestMethod.GET)
	public String commentUpdateView(CommentVO commentVO, String pageNum, Model model) throws Exception {
		
		CommentVO comment = commentService.getComment(commentVO.getCommentId());
		
		model.addAttribute("commentUpdate", commentService.getComment(commentVO.getCommentId()));
		model.addAttribute("pageNum", pageNum);
		
		return "/qnaboard/commentUpdateView";
		
	}
	
	@RequestMapping(value="/commentUpdate", method = RequestMethod.POST)
	public String commentUpdate(CommentVO commentVO, String pageNum, RedirectAttributes ra) throws Exception {
		
		commentService.updateComment(commentVO);
		
		ra.addAttribute("boardId", commentVO.getBoardId());
		ra.addAttribute("pageNum", pageNum);
			
		return "redirect:/qnaboard/content?boardId=" + commentVO.getBoardId() + "&pageNum=" + pageNum;
	}
	
	@RequestMapping(value="commentDeleteView", method = RequestMethod.GET)
	public String commentDeleteView(CommentVO commentVO, String pageNum, Model model) throws Exception {
		
		model.addAttribute("commentDelete", commentService.getComment(commentVO.getCommentId()));
		model.addAttribute("pageNum", pageNum);
		
		return "/qnaboard/commentDeleteView";
	}
	
	@RequestMapping(value="commentDelete", method = RequestMethod.POST)
	public String commentDelete(CommentVO commentVO, String pageNum, RedirectAttributes ra) throws Exception {
		
		commentService.deleteCommentByNum(commentVO.getCommentId());
		
		ra.addAttribute("boardId", commentVO.getBoardId());
		ra.addAttribute("pageNum", pageNum);
		
		return "redirect:/qnaboard/content?boardId=" + commentVO.getBoardId() + "&pageNum=" + pageNum;
	}

	
	@RequestMapping(value = "/check")
	public String check(HttpServletRequest request) throws Exception {
	
		String[] chkbox = request.getParameterValues("valueArr");
		int size = chkbox.length;
		for(int i = 0; i < size; i++) {
			boardService.updateChk(chkbox[i]);
		}

		// attach 와 board 테이블 내용 삭제 - 트랜잭션 단위로 처리 적용
		
		
		// 글목록으로 리다이렉트 이동
		return "redirect:/qnaboard/list";
	} // remove
	
	
	
}
