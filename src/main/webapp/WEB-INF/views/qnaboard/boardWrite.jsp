<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link rel="stylesheet" type="text/css" href="${path}/resources/css/writestyle.css">
</head>
<body>

<!-- Navbar -->
<jsp:include page="/WEB-INF/views/include/navbar.jsp" />

    <div class="boardform">
    <h1>Board Form</h1>
</div>
    <p></p>
    
	<!-- Post -->
	<section class="post" id="post" style="margin-top: 30px;">
		<form method="post" action="#">
			
			 <!-- 제목 작성 -->
				<div class="t1">제목 작성</div>
				<div class="subject">
					<input type="text" class="form-subject" placeholder="게시글 제목"
						name="boTitle" maxlength="50"
						 required>
				</div>
				<!--  내용 작성 -->
				<div class="t1">내용 작성</div>
                
                <div class="content_box">
				<div class="content">
					<textarea class="form-content" id="exampleFormControlTextarea1"
						name="boContent" maxlength="2048" rows="6" placeholder="게시글 내용"></textarea>
				</div>
                <!-- 글쓰기 버튼 생성 -->
                <div class="btn_box">
                <input type="submit" class="sub_btn" value="글쓰기">
                <input type="button" class="list_btn" value="글목록">
                </div>
                </div> 
		</form>
	</section>
    
    <!-- footer -->
    <jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />
</body>
</html>