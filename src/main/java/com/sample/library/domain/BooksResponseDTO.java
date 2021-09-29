package com.sample.library.domain;

import lombok.Data;

@Data
public class BooksResponseDTO {
    private String PAGE_NO;
    private String TOTAL_COUNT;
    private DocDTO[] docs;


}