package com.sample.library.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.sample.library.domain.RentalVO;

@Mapper
public interface RentalMapper {
	@Select("SELECT IFNULL(MAX(rental_id), 0) + 1 AS book_id FROM rental_list")
	int nextNum(); 
	
	@Insert("INSERT INTO rental_list(rental_id, userid, status, rental_name, rental_addr, rental_addr2, rental_phone, rental_date, rental_title, tracking)"
			+ "VALUES(#{rentalId}, #{userid}, #{status}, #{rentalName}, #{rentalAddr}, #{rentalAddr2}, #{rentalPhone}, #{rentalDate}, #{rentalTitle}, #{tracking})")
	int rentalBookbyId(RentalVO rentalVO);
}
