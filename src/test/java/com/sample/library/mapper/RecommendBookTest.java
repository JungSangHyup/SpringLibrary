package com.sample.library.mapper;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

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
    public void requestBookdTest() {
        bookApiService.requestCurrentBook(1);
    }
    @Test
    public void apiToDB() throws IOException {
        RecommendDTO recommendDTO = bookApiService.recommendBook();
        RecommendItemDTO[] items = recommendDTO.getList();

        String uploadFolder = "C:/upload/books";  // 업로드 기준경로
        File uploadPath = new File(uploadFolder, getFolder()); // C:/upload/2021/08/31

        if (uploadPath.exists() == false) {  // !uploadPath.exists()
            uploadPath.mkdirs();
        }

        for(RecommendItemDTO item : items){
            BookVO bookVO = new BookVO();

            // insert할 새 글번호 가져오기
            int num = bookService.nextNum();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String curr_time = sdf.format(new Date());
            bookVO.setBookId(num);
            bookVO.setBookDetail(item.getRecomcontens());
            bookVO.setBookName(item.getRecomtitle());
            bookVO.setBookRegdate(curr_time);
            bookVO.setCategoryCode("new");
            bookVO.setBookIsbn("Y");
            bookVO.setBookAuthor(item.getRecomauthor());


            UUID uuid = UUID.randomUUID();

            String originalFilename = item.getRecomtitle();
            String uploadFilename = uuid.toString() + "_" + originalFilename;
            File outFile = new File(uploadPath, "s_" + uploadFilename + ".jpg");


            String imgUrl = item.getRecomfilepath();
            imgUrl = imgUrl.replace("http", "https");

            try {
                // if you want to get png or jpg ... you can do it
                URL url = new URL(imgUrl);

                BufferedImage image = ImageIO.read(url);

                ImageIO.write(image, "jpg", outFile);

                BookAttachVO attachVO = new BookAttachVO();
                attachVO.setUuid(uuid.toString());
                attachVO.setUploadpath(getFolder());
                attachVO.setFilename(originalFilename);
                attachVO.setFiletype("I");
                attachVO.setBno(num);

                ImageIO.write(image, "jpg", outFile);
                bookVO.setBookImg(getFolder() + "/s_" + uploadFilename + ".jpg");
                bookAttachService.insertAttach(attachVO);
            } catch (IOException e) {
                e.printStackTrace();
            }

            System.out.println("upload: " + item.getRecomtitle());
            bookService.save(bookVO);
        }
    }

}
