package com.sample.library.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class UserProfileVO {
    private String uuid;
    private String uploadpath;
    private String filename;
    private String filetype;
    private String mid;
}
