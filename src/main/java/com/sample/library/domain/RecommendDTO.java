package com.sample.library.domain;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
public class RecommendDTO {
    private int totalCount;
    private RecommendItemDTO[] list;
}
