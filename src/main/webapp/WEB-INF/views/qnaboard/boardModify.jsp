<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     
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
		<form method="post" action="/qnabaord/modify">
		<input type="hidden" name="pageNum" value="${ pageNum }">
              <input type="hidden" name="boardId" value="${ board.boardId }">
			
			 <!-- 제목 작성 -->
				<div class="t1">제목 작성</div>
				<div class="subject">
					<input type="text" class="form-subject" placeholder="게시글 제목"
						name="subject" maxlength="50"
						 required>
				</div>
				<!--  내용 작성 -->
				<div class="t1">내용 작성</div>
                
                <div class="content_box">
				<div class="content">
					<textarea class="form-content" id="content"
						name="content" maxlength="2048" rows="6" placeholder="게시글 내용"></textarea>
				</div>
                <!-- 글쓰기 버튼 생성 -->
                <div class="btn_box">
                <input type="submit" class="sub_btn" value="글쓰기">
                <input type="button" class="list_btn" value="글목록" onclick="location.href = '/qnaboard/list?pageNum=${ pageNum }';">
                </div>
                </div> 
		</form>
	</section>
    
    <!-- footer -->
    <jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/writestyle.css">
</body>
</html>