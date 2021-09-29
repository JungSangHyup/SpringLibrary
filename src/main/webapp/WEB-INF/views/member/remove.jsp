<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 탈퇴</title>

  <!-- Google Fonts and Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <!-- <link rel="stylesheet" href="/resources/css/bootstrap.css"> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/resources/css/modify.css">
</head>
<body class="wrap">
    <!-- navbar  -->
    <jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	
	<!-- include sidebar -->


    <!-- middle container -->
    <div class="container mt-4">
        <div class="row">
        <!-- left area -->
        <div class="col-sm-3">
            <!-- Vertical Nav -->
            <nav class="navbar" style="background: #ECE6CC;">
              <span class="navbar-brand mb-0 h1" style="white-space:nowrap; margin: auto;">마이페이지</span>
            </nav>
            <ul class="nav flex-column nav-pills" style="background: #ECE6CC; white-space:nowrap;">
              <li class="nav-item">
                <a class="nav-link" href="/member/rental" style="color: black;">
                  <i class="material-icons align-middle">menu_book</i> 대여도서관리</a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/myWish" style="color: black;">
                <i class="material-icons align-middle">bookmarks</i> 찜목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/beforeModify" style="color: black;">
                <i class="material-icons align-middle">build_circle</i> 회원정보수정</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/changePw" style="color: black;">
                <i class="material-icons align-middle">vpn_key</i> 비밀번호 변경</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="background-color: #2f3542;">
                <i class="material-icons align-middle">clear</i> 회원탈퇴</a>
            </li>
          </ul>
          <!-- end of Vertical Nav -->

        </div>
        <!-- left area end -->


        <!-- right area -->
        <div class="col-sm-9">
            <!-- Contents area -->
          <div class="border border p-4" style="background: #ECE6CC;">
            <form action="/member/remove" method="POST">
              <h3>회원탈퇴</h3>
              <hr>
              <div class="form-group row mb-2">
                <label for="password" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">lock</i>
                  <span class="align-middle">현재 비밀번호</span>
                </label>
                <div class="col-auto">
                  <input type="password" class="form-control" id="passwd" aria-describedby="pwdHelp" name="passwd" required>
                  <small id="pwdHelp" class="form-text text-muted">본인 확인을 위해 비밀번호를 입력해주세요.</small>
                </div>
              </div>
              
              <div class="my-3 text-center">
                <button type="submit" class="btn btn-danger" onclick="removeAlert(event)">탈퇴하기</button>
              </div>
              <hr>
              <div>
              <h5><i class="material-icons align-middle">warning</i> 주의사항</h5>
              1. 탈퇴 즉시 회원정보가 파기되며 복구할 수 없습니다.<br>
              2. 대여중인 도서나 연체정보가 있다면 탈퇴할 수 없습니다. 도서를 모두 반납하거나 연체정보 소멸시 탈퇴가 가능합니다.<br>
              3. 탈퇴 전 작성한 글이나 댓글은 탈퇴 이후에 수정, 삭제가 불가능합니다.<br>
              </div>
            </form>

          </div>
          <!-- end of Contents area -->
        </div>
        <!-- right area end -->
    </div>
    </div>
    <!-- middle container end -->
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />

    

    

</body>
<script>
function removeAlert(event){
    let con = confirm("삭제된 회원정보는 복구가 불가능합니다.\n정말로 탈퇴하시겠습니까?")
    if(!con){
        event.preventDefault();
    }
    return;
}

</script>

</html>