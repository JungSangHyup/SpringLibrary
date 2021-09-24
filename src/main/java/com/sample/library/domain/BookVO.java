package com.sample.library.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BookVO {
	private int bookId;
	private String bookName;
	private int bookPrice;
	private String bookDes;
	private String bookImg;
	private String bookPages;
	private String bookIsbn;
	private String bookWriter;
	private String bookRegdate;
	private String categoryCode;
	private String bookDetail;
	
	private List<BookAttachVO> bookAttachList;
}
