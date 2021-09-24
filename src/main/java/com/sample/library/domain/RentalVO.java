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
public class RentalVO {
	private String rentalId;
	private String userid;
	private String status;
	private String rentalName;
	private String rentalAddr;
	private String rentalAddr2;
	private String rentalAddr3;
	private String rentalPhone;
	private String rentalDate;
	private String rentalTitle;
	private String tracking;
	
	private String bookImg;
}
