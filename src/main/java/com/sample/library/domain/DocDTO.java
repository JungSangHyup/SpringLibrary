package com.sample.library.domain;

import lombok.Data;

@Data
public class DocDTO {
    private String TITLE;	//책 제목
    private String AUTHOR;  //저자명
    private String TITLE_URL;
    private String SERIES_NO;
    private String BOOK_INTRODUCTION_URL;
    private String BOOK_SUMMARY_URL;
    private String SUBJECT;
}
