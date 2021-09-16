package com.sample.library.domain;

import java.util.Date;

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
public class MemberVO {

	private String userid;
	private String userpass;
	private String username;
	private String userphone;
	private String useremail;
	private String useraddr1;
	private String useraddr2;
	private String birthday;
	private Date regdate;
	private String profile;
	private String grade;
	private Integer mileage;
}







