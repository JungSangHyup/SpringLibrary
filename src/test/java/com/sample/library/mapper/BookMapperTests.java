package com.sample.library.mapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sample.library.domain.BookVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class BookMapperTests {
	@Autowired
	private BookMapper bookMapper;
	
	@Test
	public void insertBook() {
		bookMapper.deleteAll();
        Random random = new Random();

        for (int i = 1; i <= 20; i++) {
            BookVO bookVO = new BookVO();
            int num = bookMapper.nextNum();
            bookVO.setBook_id(i);
            bookVO.setBook_name("hello");
            bookVO.setBook_price(random.nextInt(200) * 10);
            bookVO.setBook_pages(String.valueOf(random.nextInt(200)));
            bookVO.setBook_des("test");
            bookVO.setBook_isbn("N");
            bookVO.setBook_writer("testwriter");
            bookVO.setCategory_code("history");
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String curr_time = sdf.format(new Date());
            bookVO.setBook_regdate(curr_time);
            
            bookMapper.save(bookVO);
        }
	}

}
