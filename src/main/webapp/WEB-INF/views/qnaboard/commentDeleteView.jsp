<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.6.0.js"></script>
	<script>
	$(document).ready(function(){
		var formObj = $("form[name='deleteForm']");
		
		$(".cancel_btn").on("click", function() {
			location.href = "/qnaboard/content?boardId=${commentDelete.boardId}"
				+ "&pageNum=${pageNum}";
		})
	})
	
	</script>
</head>
<body>

	<div>${boardVO.boardId}</div>
	
	<section id="container">
		<form name="deleteForm" role="form" method="post" action="/qnaboard/commentDelete">
			<input type="hidden" name="boardId" value="${commentDelete.boardId}"/>
			<input type="hidden" name="commentId" value="${commentDelete.commentId }"/>
			<input type="hidden" name="pageNum" value="${pageNum }">
		<div>
			<p>삭제 하시겠습니까?</p>
			<button type="submit" class="delete_btn">삭제</button>
			<button type="button" class="cancel_btn">취소</button>
		</div>
		</form>
	</section>

</body>
</html>