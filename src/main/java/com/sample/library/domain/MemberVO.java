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
	private String gender;
	private String birthday;
	private String userphone;
	private String userphone1;
	private String userphone2;
	private String userphone3;
	private String useraddr1;
	private String useraddr2;
	private String useremail;
	private String recvemail;
	private String profile;
	private Date regdate;
	private String grade;
	private Integer mileage;


}







