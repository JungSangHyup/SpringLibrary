package com.sample.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sample.library.domain.BookVO;
import com.sample.library.service.BookAttachService;
import com.sample.library.service.BookService;

@RestController
@RequestMapping("/api/book/*")
public class BookRestController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private BookAttachService bookAttachService;

	@GetMapping(value = "/list/{category}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<BookVO>> list(@PathVariable("category") String category) {
		List<BookVO> bookList = null;
		if(category != null)
			bookList = bookService.getBookbyCategory(category);
		else
			bookList = bookService.getAllbook();

		return new ResponseEntity<List<BookVO>>(bookList, HttpStatus.OK);
	}
	
	@GetMapping(value = "/list/{category}/{rental}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<BookVO>> list(@PathVariable("category") String category, @PathVariable("rental") String rental) {
		List<BookVO> bookList = null;
		System.out.println(rental);
		if(rental.equals("rental")){
			rental = "Y";
			bookList = bookService.getBookbyCategoryAndborrow(category, rental);
		}else {
			if(category != null)
				bookList = bookService.getBookbyCategory(category);
			else
				bookList = bookService.getAllbook();
		}

		return new ResponseEntity<List<BookVO>>(bookList, HttpStatus.OK);
	}
}
