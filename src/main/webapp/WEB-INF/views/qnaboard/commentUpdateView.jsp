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
		$(document).ready(function() {
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function() {
				location.href = "/qnaboard/content?boardId=${commentUpdate.boardId}"
					+ "&pageNum=${pageNum}";
			})
		})
	</script>
</head>
<body>
	
	<div>${boardVO.boardId}</div>
	
	<section id="container">
		<form name="updateForm" role="form" method="post" action="/qnaboard/commentUpdate">
			<input type="hidden" name="boardId" value="${commentUpdate.boardId}"/>
			<input type="hidden" name="commentId" value="${commentUpdate.commentId }"/>
			<input type="hidden" name="pageNum" value="${pageNum }">
			
			<input type="text" id="content" name="content" value="${commentUpdate.content }"/>
		
		<div>
			<button type="submit" class="update_btn">저장</button>
			<button type="button" class="cancel_btn">취소</button>
		</div>
		</form>
	</section>
	
</body>
</html>