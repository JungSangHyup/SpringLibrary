<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  
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
		<form method="post" action="/qnaboard/modify" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${ pageNum }">
              <input type="hidden" name="boardId" value="${ board.boardId }">
			
			 <!-- 제목 작성 -->
				<div class="t1">제목 작성</div>
				<div class="subject">
					<input type="text" class="form-subject"
						name="subject" maxlength="50" value="${board.subject}"
						 required>
				</div>
				<!--  내용 작성 -->
				<div class="t1">내용 작성</div>
                
                <div class="content_box">
				<div class="content">
					<textarea class="form-content" id="content"
						name="content" maxlength="2048" rows="6">${board.content}</textarea>
				</div>
				
				<div style="text-align: center; margin-top: 20px;">
				<button type="button" class="btn btn-primary my-3" id="btnAddFile">파일 추가</button>
			  	</div>
			  <div style="text-align: center; margin-top: 10px;"><span>첨부 파일</span></div>
			  
			  
			  <!-- 기존 첨부파일 영역. 삭제할 파일정보 표현 용도 -->
			  <div id="oldFileBox" style="text-align: center;">
			  
			  <!-- .delete-oldfile 삭제버튼 클릭 시 hidden input 요소의 name 속성을 oldfile → delfile 로 수정함 -->
			  <!-- 서버에서는 oldfile은 찾지않고 delfile만 찾아서 파일 삭제처리 -->
			  <c:forEach var="attach" items="${ attachList }">
			  	<input type="hidden" name="oldfile" value="${ attach.uuid }">
			  	<div>
			  		<span>${ attach.filename }</span>
			  		<button type="button" class="btn btn-primary btn-sm delete-oldfile">
	                	<i class="material-icons align-middle">clear</i>
	                	<span class="align-middle">삭제</span>
	                </button>
			  	</div>
			  </c:forEach>
			  
			  </div>
			  
			  
			  <!-- 신규 첨부파일 영역. 새로 첨부될 파일 업로드 용도 -->
			  <div id="newFileBox" style="text-align: center;"></div>
				
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
	let fileCount = ${ fn:length(attachList) };  
	
	$('button.delete-oldfile').on('click', function (event) {
		
		$(this).parent().prev().prop('name', 'delfile');
		
		$(this).parent().remove(); 
		fileCount--;
	});
	
	
	
	$('#btnAddFile').on('click', function (event) {
		if (fileCount >= MAX_FILE_COUNT) {
			alert('첨부파일은 최대 5개 까지만 첨부할 수 있습니다.')
			return;
		}
		
		var str = `
			<div class="my-2">
                <input type="file" name="files" multiple>
                <button type="button" class="btn btn-primary btn-sm delete-addfile">
                	<i class="material-icons align-middle">clear</i>
                	<span class="align-middle">삭제</span>
                </button>
            </div>
		`;
		$('div#newFileBox').append(str);
		
		fileCount++;
	});
	
	
	$('div#newFileBox').on('click', 'button.delete-addfile', function (event) {
		
		
		$(this).closest('div').remove(); 
		
		fileCount--;
	});
	</script>


</body>
</html>