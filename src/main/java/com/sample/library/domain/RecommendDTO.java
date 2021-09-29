package com.sample.library.domain;

import lombok.Data;

@Data
public class RecommendDTO {
    private int totalCount;
    private RecommendItemDTO[] list;
}
