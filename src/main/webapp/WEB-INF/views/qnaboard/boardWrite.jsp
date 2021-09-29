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
		<form method="post" action="/qnaboard/write" enctype="multipart/form-data">
		<input type="hidden" id="userid" name="userid" value="${sessionScope.userid}">
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
				<div style="text-align: center; margin-top: 20px;">
				 <button type="button" class="btn btn-primary my-3" id="btnAddFile">파일 추가</button>
				</div>
			  <div style="text-align: center; margin-top: 20px;"><span>첨부 파일</span></div>
			  <div id="fileBox" style="text-align: center;">
			  
			  	<div class="my-2">
                  <input type="file" name="files" multiple>
                  <button type="button" class="btn btn-primary btn-sm delete-file">
                  	<i class="material-icons align-middle">clear</i>
                  	<span class="align-middle">삭제</span>
                  </button>
                </div>
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
<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
const MAX_FILE_COUNT = 5;
let fileCount = 1;  // 화면에 보이는 file 입력상자 개수

$('#btnAddFile').on('click', function (event) {
	if (fileCount >= MAX_FILE_COUNT) {
		alert('첨부파일은 최대 5개 까지만 첨부할 수 있습니다.')
		return;
	}
	
	var str = `
		<div class="my-2">
            <input type="file" name="files" multiple>
            <button type="button" class="btn btn-primary btn-sm delete-file">
            	<i class="material-icons align-middle">clear</i>
            	<span class="align-middle">삭제</span>
            </button>
        </div>
	`;
	$('div#fileBox').append(str);
	
	fileCount++;
});

$('div#fileBox').on('click', 'button.delete-file', function (event) {
	
	
	$(this).closest('div').remove();
	fileCount--;
});


</script>

</body>
</html>