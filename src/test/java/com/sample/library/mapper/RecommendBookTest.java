package com.sample.library.mapper;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.sample.library.domain.BookAttachVO;
import com.sample.library.domain.BookVO;
import com.sample.library.domain.RecommendDTO;
import com.sample.library.domain.RecommendItemDTO;
import com.sample.library.service.BookApiService;
import com.sample.library.service.BookAttachService;
import com.sample.library.service.BookService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class RecommendBookTest {
    @Autowired
    BookApiService bookApiService;

    @Autowired
    BookAttachService bookAttachService;

    @Autowired
    BookService bookService;

    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String str = sdf.format(new Date());
        return str;
    }

    @Test
    public void recommendTest() throws IOException {
        System.out.println(bookApiService.recommendBook());
    }
    @Test
    public void requestBookdTest() throws IOException {
        bookApiService.requestCurrentBook(1);
    }
    @Test
    public void apiToDB() throws IOException {
        RecommendDTO recommendDTO = bookApiService.recommendBook();
        RecommendItemDTO[] items = recommendDTO.getList();

        for(RecommendItemDTO item : items){
            BookVO bookVO = new BookVO();

            // insert할 새 글번호 가져오기
            int num = bookService.nextNum();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String curr_time = sdf.format(new Date());
            bookVO.setBookId(num);
            bookVO.setBookImg(item.getRecomfilepath());
            bookVO.setBookDetail(item.getRecomcontens());
            bookVO.setBookName(item.getRecomtitle());
            bookVO.setBookRegdate(curr_time);
            bookVO.setCategoryCode("new");
            bookVO.setBookIsbn("Y");
            bookVO.setBookAuthor(item.getRecomauthor());

            System.out.println("upload: " + item.getRecomtitle());
            bookService.save(bookVO);
        }
    }

}
