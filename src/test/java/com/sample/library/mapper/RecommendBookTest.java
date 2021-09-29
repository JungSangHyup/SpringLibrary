package com.sample.library.mapper;

import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sample.library.service.BookApiService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RecommendBookTest {
    @Autowired
    BookApiService bookApiService;

    @Test
    public void recommendTest() throws IOException {
        System.out.println(bookApiService.recommendBook());
    }


    @Test
    public void requestBookdTest() throws IOException {
        bookApiService.requestCurrentBook(1);
    }
}
