package com.sample.library.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.library.domain.BookAttachVO;
import com.sample.library.domain.BookVO;
import com.sample.library.domain.DocDTO;
import com.sample.library.domain.MemberVO;
import com.sample.library.domain.RentalVO;
import com.sample.library.domain.ReviewVO;
import com.sample.library.domain.WishVO;
import com.sample.library.service.BookAttachService;
import com.sample.library.service.BookService;
import com.sample.library.service.MemberService;
import com.sample.library.service.RentalService;
import com.sample.library.service.WishService;
import com.sample.library.util.Script;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/book/*")
public class BookController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private BookAttachService bookAttachService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private RentalService rentalService;

	@Autowired
	private WishService wishService;
	
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

        isImage = contentType.startsWith("image");
        return isImage;
    }
   
    
	@GetMapping(value = {"/", "/list"})
	public String list(String category, int page, RedirectAttributes rttr) {
		rttr.addAttribute(category);
		rttr.addAttribute(page);
		return "booklist/bookList";
	}

	@GetMapping("/gallery")
	public String gallery(String category, int page, RedirectAttributes rttr)
	{
		rttr.addAttribute(category);
		rttr.addAttribute(page);
		return "booklist/bookGallery";
	}


	@GetMapping(value = {"/library"})
	public String apilibrary(int page, RedirectAttributes rttr) {
		rttr.addAttribute(page);
    	return "booklist/bookLibrary";
	}
	
	@GetMapping("/content")
	public String content(int num, Model model, HttpSession session ,RedirectAttributes rttr) {
		BookVO bookVO = bookService.getBookAndAttaches(num);
		List<ReviewVO> reviewList = bookService.getReviewsByBook(num);
		
		String id = (String) session.getAttribute("userid");
		
		if(id != null) {
			
		}
		
		// 선언과 초기화
		Map<Integer, Integer> starBoard = new HashMap<>(){
			{
				for(int i=1; i <= 5; i++){
					put(i, 0);
				}
			}
		};

		double sum = 0;

		for(ReviewVO review : reviewList){
			sum += review.getScore();
			starBoard.put(review.getScore(), starBoard.get(review.getScore()) + 1);
		}

		sum /= reviewList.size();

		sum = Double.parseDouble(String.format("%.1f", sum));

		model.addAttribute("sum", sum);
		model.addAttribute("starBoard", starBoard);
		model.addAttribute("bookVO", bookVO);
		model.addAttribute("reviewList", reviewList);

		rttr.addAttribute(num);
		
		return "booklist/bookContent";
	}

	@PostMapping("/review")
	public ResponseEntity<String> review(int num, Model model, ReviewVO reviewVO, HttpSession session) {


		String message = "";

		String id = (String) session.getAttribute("userid");

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		String str = null;

		if (id == null) { // 비밀번호 일치하지 않을때
			message = "로그인 정보가 없습니다.";

			str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}

		int nextnum = bookService.nextReviewNum();
		reviewVO.setId(nextnum);
		reviewVO.setBookId(num);
		reviewVO.setRegdate(new Date());
		reviewVO.setUserId(id);

		bookService.setReview(reviewVO);

		message = "평가해주셔서 감사합니다.";
		str = Script.href(message, "/book/content?num=" + num);
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	

	
	@GetMapping("/write")
	public String write() {
		return "booklist/bookWrite";
	}
	
	@PostMapping("/write")
	public String register(@RequestParam("book_file") MultipartFile book_file, BookVO bookVO,
            HttpServletRequest request, RedirectAttributes rttr) throws IOException {
		// insert할 새 글번호 가져오기
        int num = bookService.nextNum();
        
        String uploadFolder = "C:/upload/books";  // 업로드 기준경로
        File uploadPath = new File(uploadFolder, getFolder()); // C:/upload/2021/08/31
        
        if (uploadPath.exists() == false) {  // !uploadPath.exists()
            uploadPath.mkdirs();
        }
        
        if(!book_file.isEmpty()) {
        	
        	String originalFilename = book_file.getOriginalFilename();
        	System.out.println(originalFilename);
        	UUID uuid = UUID.randomUUID();
        	String uploadFilename = uuid.toString() + "_" + originalFilename;
        	
        	File file = new File(uploadPath, uploadFilename); // 생성할 파일이름 정보
        	
        	// 현재 업로드한 파일이 이미지 파일이면 썸네일 이미지를 추가로 생성하기
            boolean isImage = checkImageType(file); // 이미지 파일여부 확인
            
            
        	if (isImage) {
            	// 파일1개 업로드(파일 생성) 완료
                book_file.transferTo(file);
                
                File outFile = new File(uploadPath, "s_" + uploadFilename);
                Thumbnailator.createThumbnail(file, outFile, 197, 282);  // 썸네일 이미지 파일 생성하기
        	}
        	
            BookAttachVO attachVO = new BookAttachVO();
            attachVO.setUuid(uuid.toString());
            attachVO.setUploadpath(getFolder());
            attachVO.setFilename(originalFilename);
            attachVO.setFiletype((isImage == true) ? "I" : "O");
            attachVO.setBno(num);
            
            
            bookVO.setBookImg(getFolder() + "/s_" + uploadFilename);
        	bookAttachService.insertAttach(attachVO);
        	
        	System.out.println(file.getPath());
        }else {
        	bookVO.setBookImg("default");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String curr_time = sdf.format(new Date());
        
        
        bookVO.setBookId(num);
        bookVO.setBookRegdate(curr_time);
        
        bookService.save(bookVO);
     
        return "redirect:/book/list";
	}
	
	
	@GetMapping("/rental")
	public ResponseEntity<String> rental(int num, HttpSession session, HttpServletResponse response) {
		RentalVO rentalVO = new RentalVO();
		
		
		BookVO bookVO = bookService.getBook(num);
		String bookname = bookVO.getBookName();
		
		String id = (String) session.getAttribute("userid");
		MemberVO memberVO = memberService.getMemberById(id);
		
		String message = "";
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		String str = null;
		
		if (id == null) { // 비밀번호 일치하지 않을때
			message = "로그인 정보가 없습니다.";
			
			str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		int nextNum = rentalService.nextNum();
		rentalVO.setRentalId(String.valueOf(nextNum));
		rentalVO.setUserid(id);
		rentalVO.setStatus("대여 중");
		rentalVO.setRentalName(bookname);
		rentalVO.setRentalAddr(memberVO.getUseraddr1());
		rentalVO.setRentalAddr2(memberVO.getUseraddr2());
		rentalVO.setRentalPhone(memberVO.getUserphone());
		
		//빌리는 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String curr_time = sdf.format(new Date());
        
		rentalVO.setRentalDate(curr_time);
		rentalVO.setRentalTitle(String.valueOf(num));
		rentalVO.setTracking(id);
		
		rentalService.rentalBookbyId(rentalVO);
		
		message = bookname + " 책을 대여하였습니다!";
		str = Script.href(message, "/member/rental");
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
	@PostMapping("/rental")
	public ResponseEntity<String> retBook(String state, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		String[] strnums = request.getParameterValues("num");
		int[] nums = Arrays.asList(strnums).stream().mapToInt(Integer::parseInt).toArray();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		System.out.println(state);

		rentalService.retBook(nums);


		String message = "책을 반납하였습니다!";
		String str = Script.href(message, "/member/rental");
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
	@GetMapping("/wish")
	public ResponseEntity<String> wish(int num, HttpSession session, HttpServletResponse response) throws ParseException{
		WishVO wishVO = new WishVO();
		BookVO bookVO = bookService.getBook(num);
		
		int bookId = bookVO.getBookId();
		
		String message = "";
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		String str = null;
		

		String wishName = bookVO.getBookName();
		String bookIsbn = bookVO.getBookIsbn();
		
		
		String id = (String) session.getAttribute("userid");
		MemberVO memberVO = memberService.getMemberById(id);
//		if(wishService.getWishBookbyBookId(bookId, id) != null) {
//			message = "이미 찜한 책입니다.";
//		
//			str = Script.back(message);
//			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
//		}
		if(bookIsbn == "N") {
			RentalVO rentalVO = rentalService.getRentalBookbyBookId(bookId);
			
			//posiDate = rentalDate + 7;
			String rentalDate = rentalVO.getRentalDate();
			SimpleDateFormat fm = new SimpleDateFormat("yyyy/MM/dd");
			Date to = fm.parse(rentalDate);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(to);
			cal.add(Calendar.DATE, 7);
			
			String posiDate = fm.format(cal.getTime());
			
			wishVO.setPosiDate(posiDate);
		}
		
		
		
		
		
		if (id == null) { // 비밀번호 일치하지 않을때
			message = "로그인 정보가 없습니다.";
			
			str = Script.back(message);
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		


		
		
		
		
		wishVO.setUserid(id);
		wishVO.setBookId(bookId);
		wishVO.setBookName(wishName);
		wishVO.setBookIsbn(bookIsbn);
		
		wishService.wishBookbyId(wishVO);
		
		message = "찜목록에 추가하였습니다!";
		str = Script.href(message, "/member/myWish");
		
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
	@PostMapping("/wish")
	public ResponseEntity<String> cancleBook(String state, HttpSession session, HttpServletResponse response, HttpServletRequest request){
		String[] strnums = request.getParameterValues("num");
		int[] nums = Arrays.asList(strnums).stream().mapToInt(Integer::parseInt).toArray();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		System.out.println(state);

		wishService.cancleBook(nums);


		String message = "찜목록에서 제거하였습니다";
		String str = Script.href(message, "/member/myWish");
		
		return new ResponseEntity<String>(str, headers, HttpStatus.OK);
	}
	
}
