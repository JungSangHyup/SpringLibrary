package com.sample.library.task;

import net.coobird.thumbnailator.Thumbnailator;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.sample.library.domain.BookAttachVO;
import com.sample.library.domain.BookVO;
import com.sample.library.domain.RecommendDTO;
import com.sample.library.domain.RecommendItemDTO;
import com.sample.library.service.BookApiService;
import com.sample.library.service.BookAttachService;
import com.sample.library.service.BookService;

@Component
@EnableScheduling
public class ApiToDB {
    @Autowired
    BookApiService bookApiService;

    @Autowired
    BookService bookService;

    @Autowired
    BookAttachService bookAttachService;

    // 년/월/일 형식의 폴더명 리턴하는 메소드
    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String str = sdf.format(new Date());
        return str;
    }

    // 이미지 파일인지 여부 리턴하는 메소드
    private boolean checkImageType(File file) throws IOException {
        boolean isImage = false;

        String contentType = Files.probeContentType(file.toPath()); // "image/jpg"
        System.out.println("contentType : " + contentType);

        isImage = contentType.startsWith("image");
        return isImage;
    }

    @Scheduled(cron = "0 0 2 * * ?")  // 매일 오전 2시 (cron = "0 0 2 * * ?")
    public void apiToDB() throws IOException {
        RecommendDTO recommendDTO = bookApiService.recommendBook();
        RecommendItemDTO[] items = recommendDTO.getList();

        for(RecommendItemDTO item : items){
            BookVO bookVO = new BookVO();

            // insert할 새 글번호 가져오기
            int num = bookService.nextNum();

            String uploadFolder = "C:/upload/books";  // 업로드 기준경로
            File uploadPath = new File(uploadFolder, getFolder()); // C:/upload/2021/08/31

            if (uploadPath.exists() == false) {  // !uploadPath.exists()
                uploadPath.mkdirs();
            }

            
            //이미지 저장하기
            String IMAGE_URL = item.getRecomfilepath();
            try {
                // if you want to get png or jpg ... you can do it
                URL url = new URL(IMAGE_URL);
                String extension = IMAGE_URL.substring(IMAGE_URL.indexOf('.') + 1);

                BufferedImage image = ImageIO.read(url);

                UUID uuid = UUID.randomUUID();
                String originalFilename = item.getRecomtitle();
                String uploadFilename = uuid.toString() + "_" + originalFilename;
                File outFile = new File(uploadPath, "s_" + uploadFilename);

                ImageIO.write(image, extension, outFile);

                BookAttachVO attachVO = new BookAttachVO();
                attachVO.setUuid(uuid.toString());
                attachVO.setUploadpath(getFolder());
                attachVO.setFilename(originalFilename);
                attachVO.setFiletype("I");
                attachVO.setBno(num);

                bookVO.setBookImg(getFolder() + "/s_" + uploadFilename);
                bookAttachService.insertAttach(attachVO);

            } catch (IOException e) {
                e.printStackTrace();
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            String curr_time = sdf.format(new Date());

            bookVO.setBookId(num);
            bookVO.setBookDetail(item.getRecomcontens());
            bookVO.setBookName(item.getRecomtitle());
            bookVO.setBookRegdate(curr_time);
            bookVO.setCategoryCode("new");

            System.out.println("upload: " + item.getRecomtitle());
            bookService.save(bookVO);
        }
    }
}
