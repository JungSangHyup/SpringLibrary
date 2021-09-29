package com.sample.library.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.List;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sample.library.domain.MemberVO;
import com.sample.library.service.MemberService;
import com.sample.library.domain.BooksResponseDTO;
import com.sample.library.domain.DocDTO;
import com.sample.library.service.BookApiService;

@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
  
    @Autowired
    private BookApiService bookApiService;
	
    @GetMapping("/")
    public String home(HttpSession session, Model model) {
    	
    	String id = (String) session.getAttribute("userid");
      
        BooksResponseDTO booksResponseDto = bookApiService.requestCurrentBook(1);

        DocDTO[] docs = booksResponseDto.getDocs();
        List<DocDTO> docList = Arrays.asList(docs);
        System.out.println(docList.toString());
        model.addAttribute("docList", docList);
    	
    	if(id!=null) {
    		
        	
        	MemberVO memberVO = memberService.getMemberById(id);
        	
        	String profile = memberVO.getProfile();
        	String profileSrc = "";
        	
        	if(profile == "default" || profile == null) {
        		profileSrc = "/resources/images/default_profile.jpg";
        	} else {
        		profileSrc = profile;
        	}
        	
        	session.setAttribute("profile", profileSrc);
    	}
      return "main";
    }

    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getImageFile(String sign) throws IOException {
        System.out.println("fileName : " + sign);

        File file = new File("C:/upload/books", sign);

        System.out.println("filePath : " + file.getPath());

        HttpHeaders headers = new HttpHeaders();

        String contentType = Files.probeContentType(file.toPath());
        headers.add("Content-Type", contentType);

        byte[] imageData = FileCopyUtils.copyToByteArray(file);

        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(imageData, headers, HttpStatus.OK);

        return responseEntity;
    }
    
    @GetMapping("/view")
    @ResponseBody
    public ResponseEntity<byte[]> getProfile(String sign) throws IOException {
        System.out.println("fileName : " + sign);

        File file = new File("C:/upload/profile", sign);

        System.out.println("filePath : " + file.getPath());

        HttpHeaders headers = new HttpHeaders();

        String contentType = Files.probeContentType(file.toPath());
        headers.add("Content-Type", contentType);

        byte[] imageData = FileCopyUtils.copyToByteArray(file);

        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(imageData, headers, HttpStatus.OK);

        return responseEntity;
    }
    
    
    

    @GetMapping("/boardDisplay")
    @ResponseBody
    public ResponseEntity<byte[]> getBoardImageFile(String fileName) throws IOException {
        System.out.println("fileName : " + fileName);

        File file = new File("C:/upload/temp", fileName);
       
        System.out.println("filePath : " + file.getPath());

        HttpHeaders headers = new HttpHeaders();

        String contentType = Files.probeContentType(file.toPath());
        headers.add("Content-Type", contentType);
        
        byte[] imageData = FileCopyUtils.copyToByteArray(file);
       
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(imageData, headers, HttpStatus.OK);
      
        return responseEntity;
    }
    
    
    @GetMapping(value = "/boardDownload", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(String fileName) throws UnsupportedEncodingException {
		System.out.println("fileName : " + fileName);
		
		File file = new File("C:/upload/temp", fileName);
		
		Resource resource = new FileSystemResource(file);
		System.out.println("resource : " + resource);
		
		if (resource.exists() == false) { 
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND); // 자원 없음 응답코드로 응답보내고 종료
		}
	
		
		String resourceName = resource.getFilename();
		System.out.println("resourceName : " + resourceName);
		
		int beginIndex = resourceName.indexOf("_") + 1;
		String originFilename = resourceName.substring(beginIndex); // 순수 파일명 구하기
		System.out.println("originFilename : " + originFilename);
		
		String downloadName = new String(originFilename.getBytes("UTF-8"), "ISO-8859-1"); // 다운로드 파일명으로 변환하기
		System.out.println("downloadName : " + downloadName);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=" + downloadName); // 다운로드 파일명을 헤더에 설정하기
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
    
    
    
}
