package com.sample.library.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sample.library.domain.BoardVO;
import com.sample.library.domain.BookAttachVO;
import com.sample.library.domain.BookVO;
import com.sample.library.service.BookAttachService;
import com.sample.library.service.BookService;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
@RequestMapping("/book/*")
public class BookController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private BookAttachService bookAttachService;

	
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
	public String list(String category, RedirectAttributes rttr) {
		rttr.addAttribute(category);
		return "booklist/bookList";
	}
	
	@GetMapping("/content")
	public String content(int num, Model model) {
		BookVO bookVO = bookService.getBookAndAttaches(num);
		model.addAttribute("bookVO", bookVO);
		
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
	
}
