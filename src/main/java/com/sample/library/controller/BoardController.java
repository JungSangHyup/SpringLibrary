package com.sample.library.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.library.domain.BoardAttachVO;
import com.sample.library.domain.BoardVO;
import com.sample.library.domain.CommentVO;
import com.sample.library.domain.Criteria;
import com.sample.library.domain.PageDTO;
import com.sample.library.service.BoardAttachService;
import com.sample.library.service.BoardService;
import com.sample.library.service.CommentService;

import net.coobird.thumbnailator.Thumbnailator;

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
	
	@Autowired
	private BoardAttachService boardattachService;
	

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

		//BoardVO boardVO = boardService.getBoard(boardId);
		BoardVO boardVO = boardService.getBoardAndAttaches(boardId);
		
		boardService.updateCommentCnt(boardId);
	
		List<CommentVO> commentList = commentService.getComments(boardId);
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("commentList", commentList);
		model.addAttribute("attachList", boardVO.getBoardattachList());
		model.addAttribute("attachCount", boardVO.getBoardattachList().size());
		
		return "qnaboard/boardContent";
	}

	@GetMapping("/write")
	public String write(@ModelAttribute("pageNum") String pageNum) {
		System.out.println("write");
		
		return "qnaboard/boardWrite";
	}
	
	// 년/월/일 형식의 폴더명 리턴하는 메소드
		private String getFolder() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String str = sdf.format(new Date());
			return str;
		}
		
		
		// 이미지 파일인지 여부 리턴하는 메소드
		private boolean checkImageType(File file) throws IOException {
			boolean isImage = false;
			
			String contentType = Files.probeContentType(file.toPath()); // "image/jpg"
			System.out.println("contentType : " + contentType);
			
			isImage = contentType.startsWith("image");
			return isImage;
		}
		
		
		
		// 첨부파일 업로드(썸네일 생성) 후 attacList 리턴하는 메소드
		private List<BoardAttachVO> uploadFilesAndGetAttachList(List<MultipartFile> files, int bno) throws IllegalStateException, IOException {
			
			List<BoardAttachVO> attachList = new ArrayList<BoardAttachVO>();
			
			// 생성할 파일정보가 없으면 종료
			if (files == null || files.size() == 0) {
				System.out.println("업로드한 첨부파일 개수 : " + files.size());
				return attachList;
			}
			
			
			String uploadFolder = "C:/upload/temp";  // 업로드 기준경로
			
			File uploadPath = new File(uploadFolder, getFolder()); // C:/ksw/upload/2021/08/31
			System.out.println("uploadPath : " + uploadPath.getPath());
			
			if (uploadPath.exists() == false) {  // !uploadPath.exists()
				uploadPath.mkdirs();
			}
			
			for (MultipartFile multipartFile : files) {
				// 업로드 시 file type의 input 태그가 총 5개 사용되었는데
				// 그중에 3개만 파일을 선택하고 2개는 파일선택안하고 비워두면
				// files.size()는 5가 되므로, 실제 선택한 파일정보만 가져오려면  isEmpty()로 걸러야됨
				if (multipartFile.isEmpty()) {
					continue;
				}
				
				String originalFilename = multipartFile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				String uploadFilename = uuid.toString() + "_" + originalFilename;
				
				File file = new File(uploadPath, uploadFilename); // 생성할 파일이름 정보
				
				// 파일1개 업로드(파일 생성) 완료
				multipartFile.transferTo(file);
				// ======================================================
				
				// 현재 업로드한 파일이 이미지 파일이면 썸네일 이미지를 추가로 생성하기
				boolean isImage = checkImageType(file); // 이미지 파일여부 확인 
				
				if (isImage == true) {
					File outFile = new File(uploadPath, "s_" + uploadFilename);
					
					Thumbnailator.createThumbnail(file, outFile, 100, 100);  // 썸네일 이미지 파일 생성하기
				}
				
				
				//===== insert할 주글 AttachVO 객체 데이터 생성 ======
				BoardAttachVO boardattachVO = new BoardAttachVO();
				boardattachVO.setUuid(uuid.toString());
				boardattachVO.setUploadpath(getFolder());
				boardattachVO.setFilename(originalFilename);
				boardattachVO.setFiletype( (isImage == true) ? "I" : "O" );
				boardattachVO.setBno(bno);
				
				attachList.add(boardattachVO); // 리스트에 추가
			} // for
			
			return attachList;
		} // uploadFilesAndGetAttachList

	// 첨부파일 업로드와 함께 주글쓰기 처리
	@PostMapping("/write")
	public String write(List<MultipartFile> files, BoardVO boardVO, HttpServletRequest request, RedirectAttributes rttr) throws IOException {

		// insert할 새 글번호 가져오기
		int num = boardService.nextNum();

		List<BoardAttachVO> attachList = uploadFilesAndGetAttachList(files, num);
		// ===== insert할 BoardVO 객체 데이터 설정 ======
		boardVO.setBoardId(num);
		boardVO.setRegdate(new Date());

		boardService.registerBoardAndAttaches(boardVO, attachList);
		// ===============================================

		// 리다이렉트시 서버에 전달할 데이터를 저장하면 스프링이 자동으로 쿼리스트링으로 변환하여 처리해줌
		rttr.addAttribute("boardId", boardVO.getBoardId());
		rttr.addAttribute("pageNum", 1);

		return "redirect:/qnaboard/content";
	} // post write
	
	private void deleteAttachFiles(List<BoardAttachVO> attachList) {
		// 삭제할 파일정보가 없으면 메소드 종료
		if (attachList == null || attachList.size() == 0) {
			return;
		}
		
		
		String basePath = "C:/upload/temp";
		
		for (BoardAttachVO boardattachVO : attachList) {
			String uploadpath = basePath + "/" + boardattachVO.getUploadpath();
			String filename = boardattachVO.getUuid() + "_" + boardattachVO.getFilename();
			
			File file = new File(uploadpath, filename);
			
			if (file.exists() == true) { // 해당 경로에 첨부파일이 존재하면
				file.delete(); // 첨부파일 삭제하기
			}
			
			// 첨부파일이 이미지 파일이면 썸네일 이미지파일도 삭제하기
			if (boardattachVO.getFiletype().equals("I")) { // "Image" 타입이면
				// 섬네일 이미지 존재여부 확인 후 삭제하기
				File thumbnailFile = new File(uploadpath, "s_" + filename);
				if (thumbnailFile.exists() == true) {
					thumbnailFile.delete();
				}
			}
		} // for
	} // deleteAttachFiles
	
	
	@GetMapping("/remove")
	public String remove(int boardId, String pageNum) {
	

		List<BoardAttachVO> attachList = boardattachService.getAttachesByBno(boardId);
		
		deleteAttachFiles(attachList);
		// attach 와 board 테이블 내용 삭제 - 트랜잭션 단위로 처리 적용
		//boardService.deleteBoardByNum(boardId);
		
		boardService.deleteBoardAndAttaches(boardId);
		// 글목록으로 리다이렉트 이동
		return "redirect:/qnaboard/list?pageNum=" + pageNum;
	} // remove

	@GetMapping("/qnaboard/modify")
	public String modifyForm(int boardId, @ModelAttribute("pageNum") String pageNum, Model model) {

		//BoardVO boardVO = boardService.getBoard(boardId);
		BoardVO boardVO = boardService.getBoardAndAttaches(boardId);
		
		model.addAttribute("board", boardVO);
		model.addAttribute("attachList", boardVO.getBoardattachList());
		// model.addAttribute("pageNum", pageNum); // @ModelAttribute 애노테이션으로 처리함과 동일

		return "qnaboard/boardModify";
	} // modifyForm

	@PostMapping("/modify")
	public String modify(List<MultipartFile> files, BoardVO boardVO, String pageNum, 
			@RequestParam(name = "delfile", required = false) List<String> delUuidList,
			HttpServletRequest request, RedirectAttributes rttr) throws IllegalStateException, IOException {

		
		List<BoardAttachVO> newAttachList = uploadFilesAndGetAttachList(files, boardVO.getBoardId());

		
		List<BoardAttachVO> delAttachList = null;
		
		if(delUuidList != null) {
			delAttachList = boardattachService.getAttachesByUuids(delUuidList);
			deleteAttachFiles(delAttachList);
		}
		// 3) boardVO 준비해서 첨부파일 신규리스트, 삭제리스트와 함께
		// 테이블 글 수정(update)을 트랜잭션 단위로 처리

		// ===== update할 BoardVO 객체 데이터 설정 ======
		boardVO.setRegdate(new Date());
		

		// 글번호에 해당하는 글정보 수정. 첨부파일정보 수정(insert, delete) - 트랜잭션 단위 처리
		//boardService.updateBoard(boardVO);
		boardService.updateBoardAndInsertAttachesAndDeleteAttaches(boardVO, newAttachList, delUuidList);
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
