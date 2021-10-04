package com.sample.library.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class WishVO {
	private int cartId;
	private String userid;
	private int bookId;
	
	private String bookIsbn;
	private String posiDate;
	
	private String bookName;
	private String bookImg;
}
