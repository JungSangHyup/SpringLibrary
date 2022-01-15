# Spring Library

![image](https://user-images.githubusercontent.com/51068026/149612967-dae32303-0bda-4abb-b5d6-6145a1819688.png)

 도서를 등록, 관리 할 수 있고 회원가입과 게시판 댓글 구성 등을 할 수 있는 웹사이트

## 주제 선정 배경
- 지금까지 배워온 지식들을 바탕으로 인터넷 도서 대여관리시스템을 만들기로 선정함
- 사람들이 편리하게 오프라인에서 도서 대여시스템을 이용할 수 있는 인터넷 도서 대여관리시스템 구현에 중점을 둠

## 구현 목표
- 회원 가입 및 로그인 DB이용
- 관리자/회원/비회원 권한설정
	관리자 - 도서관리, 회원관리, 게시판 이용
	회원 – 도서 대여, 리뷰, 게시판 이용, 회원정보 수정
	공통 – 도서 검색
- 도서 검색, 대여, 평점 등록
- 질문 게시판

## 개발 환경
###### Spring legacy


```
spring-context
spring-webmvc
spring-test
spring-jdbc
spring-tx
```

###### Db

MySQL 사용

```
mybatis
mybatis-spring
mysql-connector-java
HikariCP
```

###### Servlet

```
javax.servlet-api
jsp-api
jstl // JSP 내 템플릿 엔진
```

###### Util

```
lombok // Getter, Setter 관련 편리한 기능 제공
thumbnailator // 이미지 파일 업로드시 자그마한 이미지로 가공해줌
quartz // 배치 프로그램
quartz-jobs
```

## UseCase

- 회원 : 도서대여, 정보 수정, 리뷰 작성, 검색, 회원가입, 도서 조회, 게시판, 로그인
- 비회원 : 검색, 회원가입, 도서 조회
- 관리자 : 회원관리, 도서관리, 게시판 관리

## ERD

![image](https://user-images.githubusercontent.com/51068026/149613067-d92f060f-0cf1-45ec-a465-89a6f216f571.png)

### Main Page

- 메인 화면은 사용자의 프로필과 신간, 추천 책 목록을 보여주는 페이지이다.

![image](https://user-images.githubusercontent.com/51068026/136132576-d2b19e23-3b01-4ae0-9f0f-01ac330492af.png)

![image](https://user-images.githubusercontent.com/51068026/136132606-d5f11c04-ab24-4b37-b7d4-e326710f1fac.png)

### Library List

- 책 목록 보기 

- 대여 가능한 목록만 따로 검색 가능

- 이미지 로만 볼 수 있는 갤러리 기능

- 국립 중앙도서관의 데이터로 업데이트

![image](https://user-images.githubusercontent.com/51068026/136132681-48d60083-0066-4162-beea-702c33bb5725.png)

![image](https://user-images.githubusercontent.com/51068026/136132960-9614bbf8-fce2-415c-b099-7541e1261535.png)

 XML로 받아온 데이터를 Jackson을 통해 JSON 으로 변환 후 GSON으로 모델과 ORM 매칭함

### Library Contents

- 대여/ 찜하기로 책을 대여

- 상세 이미지에서 책 확인 가능

- 리뷰에서 책의 평점을 볼 수 있다 (소수점 한 자리 수 까지 가능)

- 사용자 평가에서 직접 별을 달고 댓글 가능

![image](https://user-images.githubusercontent.com/51068026/136133056-514fc964-b978-4a60-977c-a99e6ef601c1.png)

### Review

-  총합 리뷰 개수와 평균을 볼 수 있다.

- 개수만큼 프로세스바가 변경됨

- 평가하기 에서 별의 애니메이션 시각적 효과

 ![image](https://user-images.githubusercontent.com/51068026/136133087-2d9215d7-f061-414b-b830-e05948b1e23a.png)
 
 ### Rental service
 
 - 대여중인 도서가 보여지며 반납하기를 통해 체크표시된 도서를 반납 할 수 있다.

![image](https://user-images.githubusercontent.com/51068026/136133292-c9397b50-4369-4689-b1fc-e245d45b43ed.png)

### Join

- - 사용자가 회원가입을 하게 되면 보여지는 회원가입 페이지이다.

![image](https://user-images.githubusercontent.com/51068026/136133415-1fa893f3-8512-482a-b0cb-3b23ab0f0712.png)

### Modify && Password

![image](https://user-images.githubusercontent.com/51068026/136133477-18f4bf36-6da4-4402-bd2a-1929475fed5c.png)
![image](https://user-images.githubusercontent.com/51068026/136133483-16f8e87b-f7bc-4923-b8fc-29d0de6186a7.png)

## 팀원 후기

### - 맡은 부분 (정상협) – 메인, 도서 페이지
 국립중앙도서관과 API를 통한 JSON을 모델 데이터로 변환 방법을 공부 할 수 있는 기회였습니다. 팀원과 형상관리를 한 경험도 잊혀지지 않는 경험이었습니다.

### - 맡은 부분 (류재현) – 로그인, ID찾기
한줄평 – 아직 Security를 제대로 공부하지 않아 Security를 적용하는 과정에서 이것저것 건들다 보니 코드가 날아가는 경험도 있었고 향후 보완사항으로 Security를 적용하여 기능을 구현하도록 노력하겠습니다.

### - 맡은 부분 (김경준) – 회원 가입 및 마이페이지
-한줄평 – 강의로만 들었던 부분을 실제로 구현하려 하니 막히는 부분이 많았고 그로인해 더 열심히 공부하게 되었습니다.

### - 맡은 부분 (남윤이) – 게시판 및 댓글
한줄평 - 댓글 기능 만들다 코드 꼬여서 하루 날리고, 백업을 해 두지 않아 롤백 했을 때 코드 다 날린 경험이 잊혀지지 않습니다. 백업의 소중함을 깨닫게 되었습니다.


