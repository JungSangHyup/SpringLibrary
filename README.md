# Spring 도서관리

 도서를 등록, 관리 할 수 있고 회원가입과 게시판 댓글 구성 등을 할 수 있는 웹사이트

### 기여자

류재현 남윤이 정상협 김경준

### 사용 기술

###### 스프링 레거시


```
spring-context
spring-webmvc
spring-test
spring-jdbc
spring-tx
```

###### 디비

```
mybatis
mybatis-spring
mysql-connector-java
```

###### 디비 커넥션 풀

```
HikariCP
```

###### 서블릿

```
javax.servlet-api
jsp-api
jstl // JSP 내 템플릿 엔진
```

###### 유틸

```
lombok // Getter, Setter 관련 편리한 기능 제공
thumbnailator // 이미지 파일 업로드시 자그마한 이미지로 가공해줌
quartz // 배치 프로그램
quartz-jobs
```


### Main Page

- 메인 화면은 사용자의 프로필과 신간, 추천 책 목록을 보여주는 페이지이다.


![image](https://user-images.githubusercontent.com/51068026/136132557-c2d0fcea-0901-42e4-80f1-3b3812cbd65b.png)

![image](https://user-images.githubusercontent.com/51068026/136132576-d2b19e23-3b01-4ae0-9f0f-01ac330492af.png)

![image](https://user-images.githubusercontent.com/51068026/136132606-d5f11c04-ab24-4b37-b7d4-e326710f1fac.png)

![image](https://user-images.githubusercontent.com/51068026/136132632-9947f32f-24dc-447f-8b67-21ee55b06477.png)

### 도서 목록

- 책 목록 보기 

- 대여 가능한 목록만 따로 검색 가능

- 이미지 로만 볼 수 있는 갤러리 기능

- 국립 중앙도서관의 데이터로 업데이트

![image](https://user-images.githubusercontent.com/51068026/136132681-48d60083-0066-4162-beea-702c33bb5725.png)

#### 국립중앙도서관 api 활용

![image](https://user-images.githubusercontent.com/51068026/136132960-9614bbf8-fce2-415c-b099-7541e1261535.png)

 XML로 받아온 데이터를 Jackson을 통해 JSON 으로 변환 후 GSON으로 모델과 ORM 매칭함


### 도서 콘텐츠

- 대여/ 찜하기로 책을 대여

- 상세 이미지에서 책 확인 가능

- 리뷰에서 책의 평점을 볼 수 있다 (소수점 한 자리 수 까지 가능)

- 사용자 평가에서 직접 별을 달고 댓글 가능

![image](https://user-images.githubusercontent.com/51068026/136133056-514fc964-b978-4a60-977c-a99e6ef601c1.png)

### 사용자 평가

-  총합 리뷰 개수와 평균을 볼 수 있다.

- 개수만큼 프로세스바가 변경됨

- 평가하기 에서 별의 애니메이션 시각적 효과

 ![image](https://user-images.githubusercontent.com/51068026/136133087-2d9215d7-f061-414b-b830-e05948b1e23a.png)
 
 ### 대여도서 관리
 
 - 대여중인 도서가 보여지며 반납하기를 통해 체크표시된 도서를 반납 할 수 있다.

![image](https://user-images.githubusercontent.com/51068026/136133292-c9397b50-4369-4689-b1fc-e245d45b43ed.png)

### 로그인 && 로그아웃

![image](https://user-images.githubusercontent.com/51068026/136133320-fad12730-05b8-4c8d-9e76-21b4ef9da6ed.png)
![image](https://user-images.githubusercontent.com/51068026/136133322-b9229bbc-a7cb-4450-b0a9-14c349fbc8a1.png)

### ID && Password 찾기

![image](https://user-images.githubusercontent.com/51068026/136133385-50372dbe-2a66-42e7-9685-79c152ab4bd1.png)
![image](https://user-images.githubusercontent.com/51068026/136133390-7d8d5b91-3b80-4778-a65d-17f6d7974399.png)

### 회원가입

- - 사용자가 회원가입을 하게 되면 보여지는 회원가입 페이지이다.

![image](https://user-images.githubusercontent.com/51068026/136133415-1fa893f3-8512-482a-b0cb-3b23ab0f0712.png)

### 회원 정보 수정 && 비밀번호 변경

![image](https://user-images.githubusercontent.com/51068026/136133477-18f4bf36-6da4-4402-bd2a-1929475fed5c.png)
![image](https://user-images.githubusercontent.com/51068026/136133483-16f8e87b-f7bc-4923-b8fc-29d0de6186a7.png)


