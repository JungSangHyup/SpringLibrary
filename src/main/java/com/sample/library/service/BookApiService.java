package com.sample.library.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSession;

import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.Gson;
import com.sample.library.domain.BooksResponseDTO;
import com.sample.library.domain.DocDTO;

@Service
public class BookApiService {
    private final String CERTKEY =  "340b9ec4f3156a95aac8ffcc340c6d2f737f50e38c4773ffa3cd206f6232fb59";

    public static String callURL(String myURL) {
        System.out.println("Requeted URL:" + myURL);
        StringBuilder sb = new StringBuilder();
        URLConnection urlConn = null;
        InputStreamReader in = null;

        //error : Caused by: javax.net.ssl.SSLPeerUnverifiedException: Hostname not verified:
        HostnameVerifier allHostsValid = new HostnameVerifier() {
            @Override
            public boolean verify(String hostname, SSLSession session) {
                //특정 hostname만 승인을 해주는 형태
                return true;
            }
        };
        //
        HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);

        try {
            URL url = new URL(myURL);
            urlConn = url.openConnection();
            if (urlConn != null)
                urlConn.setReadTimeout(60 * 1000);
            if (urlConn != null && urlConn.getInputStream() != null) {
                in = new InputStreamReader(urlConn.getInputStream(), StandardCharsets.UTF_8);
                //charset 문자 집합의 인코딩을 사용해 urlConn.getInputStream을 문자스트림으로 변환 객체를 생성.
                BufferedReader bufferedReader = new BufferedReader(in);
                //주어진 문자 입력 스트림 inputStream에 대해 기본 크기의 버퍼를 갖는 객체를 생성.
                if (bufferedReader != null) {
                    int cp;
                    while ((cp = bufferedReader.read()) != -1) {
                        sb.append((char) cp);
                    }
                    bufferedReader.close();
                }
            }
            in.close();
        } catch (Exception e) {
            throw new RuntimeException("Exception URL:"+ myURL, e);
        }
        return sb.toString();
    }



    public BooksResponseDTO requestBookByKeyword(String keyword){
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .scheme("http")
                .host("seoji.nl.go.kr")
                .path("/landingPage/SearchApi.do")
                .queryParam("cert_key", CERTKEY)
                .queryParam("result_style", "json")
                .queryParam("page_no", 1)
                .queryParam("page_size", 20)
                .queryParam("title", keyword)
                .build()
                .encode(StandardCharsets.UTF_8);

        String jsonString = callURL(uriComponents.toString());

        Gson gson = new Gson();
        BooksResponseDTO booksResponseDto = gson.fromJson(jsonString, BooksResponseDTO.class);
        return booksResponseDto;
    }

    public BooksResponseDTO requestCurrentBook(int page){
        DateFormat format = new SimpleDateFormat("yyyyMMdd");
        String datestr = format.format(Calendar.getInstance().getTime());
        datestr = format.format(new Date());

        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .scheme("http")
                .host("seoji.nl.go.kr")
                .path("/landingPage/SearchApi.do")
                .queryParam("cert_key", CERTKEY)
                .queryParam("result_style", "json")
                .queryParam("page_no", String.valueOf(page))
                .queryParam("page_size", 20)
                .queryParam("start_publish_date", datestr)
                .queryParam("end_publish_date", datestr)
                .build()
                .encode(StandardCharsets.UTF_8);



        String jsonString = callURL(uriComponents.toString());

        Gson gson = new Gson();
        BooksResponseDTO booksResponseDto = gson.fromJson(jsonString, BooksResponseDTO.class);

        return booksResponseDto;
    }

}
