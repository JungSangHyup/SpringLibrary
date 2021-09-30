<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 변경</title>

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
              <a class="nav-link active" style="background-color: #2f3542;">
                <i class="material-icons align-middle">vpn_key</i> 비밀번호 변경</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/remove" style="color: black;">
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
            <form action="/member/changePw" method="POST">
              <h3>비밀번호 변경</h3>
              <hr>
              <div class="form-group row mb-2">
                <label for="password" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">lock</i>
                  <span class="align-middle">현재 비밀번호</span>
                </label>
                <div class="col-auto">
                  <input type="password" class="form-control" id="oldPw" aria-describedby="pwdHelp" name="oldPw" required>
                  <small id="pwdHelp" class="form-text text-muted">현재 비밀번호는 필수 입력 요소입니다.</small>
                </div>
              </div>
              <div class="form-group row mb-2">
                <label for="password" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">lock</i>
                  <span class="align-middle">새 비밀번호</span>
                </label>
                <div class="col-auto">
                  <input type="password" class="form-control" id="newPw1" aria-describedby="pwdHelp" name="newPw1">
                  <small id="pwdHelp" class="form-text text-muted">새로 변경할 비밀번호를 입력해주세요.</small>
                </div>
              </div>
              <div class="form-group row mb-2">
                <label for="password2" class="col-sm-3 col-form-label" style="white-space:nowrap;">
                  <i class="material-icons align-middle">check</i>
                  <span class="align-middle">새 비밀번호 확인</span>
                </label>
                <div class="col-auto">
                  <input type="password" class="form-control" id="newPw2" aria-describedby="pwdHelp2" name="newPw2">
                  <small id="pwdHelp2" class="form-text text-muted">새 비밀번호 확인을 위해 다시 입력해주세요</small>
                </div>
              </div>


              
              <div class="my-3 text-right">
                <button type="submit" class="btn btn-secondary">변경하기</button>
                <button type="reset" class="btn btn-secondary ml-3">취소</button>
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
</html>