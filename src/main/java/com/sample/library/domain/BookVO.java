package com.sample.library.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BookVO {
	private int book_id;
	private String book_name;
	private int book_price;
	private String book_des;
	private String book_img;
	private String book_pages;
	private String book_isbn;
	private String book_writer;
	private int sales;
	private String category_code;
}
