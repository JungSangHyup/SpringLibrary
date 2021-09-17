package com.sample.library.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
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
	private int book_id;
	private String book_name;
	private int book_price;
	private String book_des;
	private String book_img;
	private String book_pages;
	private String book_isbn;
	private String book_writer;
	private String book_regdate;
	private String category_code;
}
