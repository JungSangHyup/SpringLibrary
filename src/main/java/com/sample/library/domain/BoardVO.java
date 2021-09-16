package com.sample.library.domain;

import java.util.Date;

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
public class BoardVO {

	private int board_id;
	private String userid;
	private String subject;
	private String content;
	private Date regdate;
	private String status;
}
