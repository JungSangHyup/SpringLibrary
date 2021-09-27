<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- navbar  -->
    <jsp:include page="/WEB-INF/views/include/navbar.jsp" />
    
<div class="boardform">
    <h1>Book Search</h1>
    <form action="/qnaboard/list?#qnaboard" method="get">
     <div class="search_box">
         
	<select name="type" id="keyword-select">
        <option value="T" ${ (pageMaker.cri.type eq 'T') ? 'selected' : '' }>제목</option>
        <option value="W" ${ (pageMaker.cri.type eq 'W') ? 'selected' : '' }>글쓴이</option>
        <option value="C" ${ (pageMaker.cri.type eq 'C') ? 'selected' : '' }>내용</option>
    </select>
         <i class="fa fa-search"></i>
    <input class="search" type="text" id="keyword" name="keyword" value="${ pageMaker.cri.keyword }">
    <button class="search_btn" type="submit" name="search_btn" >검색</button>
    </div>
    </form>
</div>

	<table class="table">
		<thead class="thead-dark" id="board">
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">작성일자</th>
				<th scope="col">답변</th>
				<c:if test="${ sessionScope.userid eq 'admin' }">
				<th scope="col">답변완료 체크<input id="allCheck" type="checkbox" name="allCheck" class="allCheck"/></th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:choose>
              	<c:when test="${ pageMaker.totalCount gt 0 }">
              	
              		<c:forEach var="board" items="${ boardList }">
              			<tr>
		                  <th>${ board.boardId }</th>
		                  <td>${ board.userid }</td>
		                  <td><a class="align-middle" href="/qnaboard/content?boardId=${ board.boardId }&pageNum=${ pageMaker.cri.pageNum }">${ board.subject }</a>
		                  <c:if test="${board.commentCnt ne 0 }">
		                  	<small><b>[&nbsp;<c:out value="${board.commentCnt}"/>&nbsp;]</b></small>
		                  </c:if>
		                  </td>
		                  <td><fmt:formatDate value="${ board.regdate }" pattern="yyyy.MM.dd" /></td>
		               	  <td>${ board.status }</td>
		               	  <c:if test="${ sessionScope.userid eq 'admin' }">
		               	  <td><input type="checkbox" class="RowCheck" name="RowCheck" value="${ board.boardId }"></td>
		               	  </c:if>
		                </tr>
              		</c:forEach>
              	
              	</c:when>
              	<c:otherwise>
              		<tr>
	                  <td colspan="4" class="text-center">게시판 글이 없습니다.</td>
	                </tr>
              	</c:otherwise>
              </c:choose>
		</tbody>
	</table>
	
	<c:if test="${ sessionScope.userid eq 'admin' }">
		<input type="button" value="답변확인" class="Chkbtn" onclick="updateChk();">
	</c:if>
  
    
    <c:if test="${ not empty sessionScope.userid }">
    <button style="width: 80px;" class="write_btn" type="button" name="write_btn" onclick="location.href = '/qnaboard/write?pageNum=${ pageMaker.cri.pageNum }';">글쓰기</button>
	</c:if>
    
    
    <nav aria-label="Page navigation example">
   <c:if test="${ not empty sessionScope.userid }">
  <ul class="pagination">
 
  <%-- 이전 --%>
    <li class="page-item ${ (pageMaker.prev) ? '' : 'disabled' }">
      <a class="page-link" href="${ (pageMaker.prev) ? '/qnaboard/list?pageNum=' += (pageMaker.startPage - 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#qnaboard" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    
    <%-- 시반페이지 번호 ~ 끝페이지 번호 --%>
    <c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" step="1">
    <li class="page-item ${ (pageMaker.cri.pageNum eq i) ? 'active' : '' }">
    	<a class="page-link" href="/qnaboard/list?pageNum=${ i }&type=${ pageMaker.cri.type }&keyword=${ pageMaker.cri.keyword }#qnaboard">${ i }</a>
    </li>
    </c:forEach>
    
  
  	<%-- 다음 --%>
    <li class="page-item ${ (pageMaker.next) ? '' : 'disabled' }">
      <a class="page-link" href="${ (pageMaker.next) ? '/qnaboard/list?pageNum=' += (pageMaker.endPage + 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#qnaboard" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    
  </ul>
   </c:if>
   
   
   <c:if test="${ empty sessionScope.userid }">
  <ul class="pagination" style="margin-top: 50px;">
 
  <%-- 이전 --%>
    <li class="page-item ${ (pageMaker.prev) ? '' : 'disabled' }">
      <a class="page-link" href="${ (pageMaker.prev) ? '/qnaboard/list?pageNum=' += (pageMaker.startPage - 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#qnaboard" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    
    <%-- 시반페이지 번호 ~ 끝페이지 번호 --%>
    <c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" step="1">
    <li class="page-item ${ (pageMaker.cri.pageNum eq i) ? 'active' : '' }">
    	<a class="page-link" href="/qnaboard/list?pageNum=${ i }&type=${ pageMaker.cri.type }&keyword=${ pageMaker.cri.keyword }#qnaboard">${ i }</a>
    </li>
    </c:forEach>
    
  
  	<%-- 다음 --%>
    <li class="page-item ${ (pageMaker.next) ? '' : 'disabled' }">
      <a class="page-link" href="${ (pageMaker.next) ? '/qnaboard/list?pageNum=' += (pageMaker.endPage + 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#qnaboard" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
    
  </ul>
   </c:if>
   
</nav>
<!-- footer -->
<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />
 <link rel="stylesheet" type="text/css" href="${path}/resources/css/liststyle.css">
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script>
$(function() {
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("#allCheck").click(function() {
		if(document.getElementById("allCheck").checked==true){
		$("input[name=RowCheck]:checkbox").prop("checked", "checked");
		} else {
			$("input[name=RowCheck]:checkbox").removeProp("checked");
		}
	});
	
	$(".RowCheck").on('click', function(){
		if($(".RowCheck:checked").length == rowCnt){
			$(".allCheck")[0].checked = true;
		}
		else {
			$(".allCheck")[0].checked = false;
		}
	});
});

function updateChk() {
	var url = "/qnaboard/check";
	var valueArr = new Array();
	var list = $(".RowCheck");
	for(var i = 0; i < list.length; i++) {
		if(list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length == 0) {
		alert("선택된 글이 없습니다.");
	}
	else {
		$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data : {
				valueArr : valueArr
			},
			success : function(jdata) {
				if(jdata = 1) {
					alert("답변완료");
					location.replace("list")
				}
			}
		});
	}
}

</script>

</body>
</html>

