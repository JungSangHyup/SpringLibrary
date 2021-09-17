package com.sample.library.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.sample.library.domain.BookVO;
import com.sample.library.service.BookService;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/book/*")
public class BookController {
	@Autowired
	private BookService bookService;
	
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
	
	@GetMapping(value = {"/", "/list"})
	public String list() {
		return "booklist/bookList";
	}
	
	@GetMapping("/content")
	public String content() {
		return "booklist/bookContent";
	}
	
	@GetMapping("/gallery")
	public String gallery() {
		return "booklist/bookGallery";
	}
	
	@GetMapping("/write")
	public String write() {
		return "booklist/bookWrite";
	}
	
	@PostMapping("/write")
	public String register(MultipartFile book_file, BookVO bookVO,
            HttpServletRequest request, RedirectAttributes rttr) throws IllegalStateException, IOException {
		System.out.println(bookVO.getBook_name());
		System.out.println(bookVO.getBook_des());
		System.out.println(bookVO.getBook_writer());
		System.out.println(bookVO.getBook_price());
		System.out.println(bookVO.getCategory_code());
		// insert할 새 글번호 가져오기
        int num = bookService.nextNum();
        
        String uploadFolder = "C:/book/upload";  // 업로드 기준경로
        File uploadPath = new File(uploadFolder, getFolder()); // C:/upload/2021/08/31
        
        if(!book_file.isEmpty()) {
        	String originalFilename = book_file.getOriginalFilename();
        	System.out.println(originalFilename);
        	UUID uuid = UUID.randomUUID();
        	String uploadFilename = uuid.toString() + "_" + originalFilename;
        	File file = new File(uploadPath, uploadFilename); // 생성할 파일이름 정보
        	
        	if (checkImageType(file)) {
            	// 파일1개 업로드(파일 생성) 완료
                book_file.transferTo(file);
                
                File outFile = new File(uploadPath, "s_" + uploadFilename);
                Thumbnailator.createThumbnail(file, outFile, 197, 282);  // 썸네일 이미지 파일 생성하기
        	}
        	
        	bookVO.setBook_img(uploadPath + "/" + uploadFilename);
        	System.out.println(uploadPath + "/" + uploadFilename);
        }
        
        bookVO.setBook_id(num);
        
        
        bookService.save(bookVO);
     
        return "redirect:/book/list";
	}
	
}
