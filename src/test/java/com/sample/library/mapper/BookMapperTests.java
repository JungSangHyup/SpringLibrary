package com.sample.library.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sample.library.domain.BookVO;
import com.sample.library.service.BookService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class BookMapperTests {
	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private BookService bookService;
	
	@Test
	public void insertBook() {
		bookService.deleteAll();
        Random random = new Random();

        for (int i = 1; i <= 20; i++) {
            BookVO bookVO = new BookVO();
            int num = bookService.nextNum();
            bookVO.setBookId(i);
            bookVO.setBookName("hello");
            bookVO.setBookPrice(random.nextInt(200) * 10);
            bookVO.setBookPages(String.valueOf(random.nextInt(200)));
            bookVO.setBookDes("test");
            bookVO.setBookIsbn("N");
            bookVO.setBookWriter("testwriter");
            bookVO.setCategoryCode("history");
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String curr_time = sdf.format(new Date());
            bookVO.setBookRegdate(curr_time);
            
            bookService.save(bookVO);
        }
	}
	
//	@Test
//	public void getAllbook() {
//		List<BookVO> bookList = bookService.getAllbook();
//		
//		for(BookVO book : bookList) {
//			if(book != null) {
//				System.out.println(book.getBookId());
//			}
//			
//		}
//		System.out.println(bookList.size());
//	}
//	
//	
//	@Test
//	public void getBook() {
//		BookVO book = bookMapper.getBook(1);
//		System.out.println(book.getBookName());
//	}

}
