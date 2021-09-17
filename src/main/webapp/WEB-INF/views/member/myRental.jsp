<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>찜목록</title>

  <!-- Google Fonts and Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Bootstrap CSS -->
  <!-- <link rel="stylesheet" href="/resources/css/bootstrap.css"> -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="/resources/css/myRental.css">
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
              <a class="nav-link active" style="background-color: #2f3542;"">
                <i class="material-icons align-middle">menu_book</i> 대여도서관리</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/myWish" style="color: black;">
                <i class="material-icons align-middle">bookmarks</i> 찜목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/modify" style="color: black;">
                <i class="material-icons align-middle">build_circle</i> 회원정보수정</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">
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
            <form action="/member/myWishlist" method="POST">
            <table class="table table-hover table-borderless">
                <thead class="text-center" style="background-color: #2f3542; color: white;">
                  <tr>
                    <th scope="col" style="width: 10%;"></th>
                    <th scope="col" style="width: 15%;"></th>
                    <th scope="col" >도서 제목</th>
                    <th scope="col" style="width: 15%;">대여일자</th>
                    <th scope="col" style="width: 15%; white-space: nowrap;">남은 대여일 수</th>
                    <th scope="col" style="width: 15%;">상태</th>
                    
                  </tr>
                </thead>
                <tbody class="text-center">
                  <tr>
                    <td class="align-middle" style="width: 10%;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <label class="custom-control-label" for="customCheck1"></label>
                          </div>
                    </td>
                    <td class="align-middle" style="width: 15%;"><img src="/resources/images/s_l9791166815782.jpg" alt="썸네일"></td>
                    <td class="align-middle">책제목1</td>
                    <td class="align-middle" style="width: 15%;">2019.07.01</td>
                    <td class="align-middle" style="width: 15%; color: red;">0일</td>
                    <td class="align-middle" style="width: 15%; color: red;">연체</td>
                  </tr>
                  <tr>
                    <td class="align-middle" style="width: 10%;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck2">
                            <label class="custom-control-label" for="customCheck2"></label>
                          </div>
                    </td>
                    <td class="align-middle" style="width: 15%;"><img src="/resources/images/s_l9791166815782.jpg" alt="썸네일"></td>
                    <td class="align-middle">책제목2</td>
                    <td class="align-middle" style="width: 15%;">2021.09.10</td>
                    <td class="align-middle" style="width: 15%;">9일</td>
                    <td class="align-middle" style="width: 15%;">대여중</td>
                  </tr>
                  <tr>
                    <td class="align-middle" style="width: 10%;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck3">
                            <label class="custom-control-label" for="customCheck3"></label>
                          </div>
                    </td>
                    <td class="align-middle" style="width: 15%;"><img src="/resources/images/s_l9791166815782.jpg" alt="썸네일"></td>
                    <td class="align-middle">책제목3</td>
                    <td class="align-middle" style="width: 15%;">2021.09.03</td>
                    <td class="align-middle" style="width: 15%;">5일</td>
                    <td class="align-middle" style="width: 15%; color: blue;">대여중<br>(연장1회)</td>
                  </tr>
                  <tr>
                    <td class="align-middle" style="width: 10%;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck4">
                            <label class="custom-control-label" for="customCheck4"></label>
                          </div>
                    </td>
                    <td class="align-middle" style="width: 15%;"><img src="/resources/images/s_l9791166815782.jpg" alt="썸네일"></td>
                    <td class="align-middle">책제목4</td>
                    <td class="align-middle" style="width: 15%;">2021.09.10</td>
                    <td class="align-middle" style="width: 15%;">9일</td>
                    <td class="align-middle" style="width: 15%;">대여중</td>
                  </tr>
                  <tr>
                    <td class="align-middle" style="width: 10%;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck5">
                            <label class="custom-control-label" for="customCheck5"></label>
                          </div>
                    </td>
                    <td class="align-middle" style="width: 15%;"><img src="/resources/images/s_l9791166815782.jpg" alt="썸네일"></td>
                    <td class="align-middle">책제목5</td>
                    <td class="align-middle" style="width: 15%;">2021.09.10</td>
                    <td class="align-middle" style="width: 15%;">9일</td>
                    <td class="align-middle" style="width: 15%;">대여중</td>
                  </tr>

                </tbody>
              </table>
              <div class="my-3 text-right">
                <button type="submit" class="btn btn-secondary">연장신청</button>
                <button type="reset" class="btn btn-secondary ml-3">반납하기</button>
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