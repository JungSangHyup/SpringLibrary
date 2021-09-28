package com.sample.library.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.library.domain.BooksResponseDTO;
import com.sample.library.domain.DocDTO;
import com.sample.library.service.BookApiService;

@Controller
public class HomeController {
    @Autowired
    BookApiService bookApiService;

    @GetMapping("/")
    public String home(Model model) {
        System.out.println("home");

        BooksResponseDTO booksResponseDto = bookApiService.requestCurrentBook();

        DocDTO[] docs = booksResponseDto.getDocs();
        List<DocDTO> docList = Arrays.asList(docs);
        System.out.println(docList.toString());
        model.addAttribute("docList", docList);


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
}
