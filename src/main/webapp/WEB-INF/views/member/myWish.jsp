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
  <link rel="stylesheet" type="text/css" href="${path}/resources/css/myWishlist.css">
</head>
<body>
    <!-- include navbar -->
	
	<!-- include sidebar -->


    <!-- middle container -->
    <div class="container mt-4">
        <div class="row">
        <!-- left area -->
        <div class="col-sm-3">
            <!-- Vertical Nav -->
          <ul class="nav flex-column nav-pills" style="white-space:nowrap;">
            <li>
              <h3>마이페이지</h3>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">대여도서목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active">찜목록</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/member/modify">회원정보수정</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">회원탈퇴</a>
            </li>
          </ul>
          <!-- end of Vertical Nav -->
        </div>
        <!-- left area end -->


        <!-- right area -->
        <div class="col-sm-9">
            <!-- Contents area -->
          <div class="border border-info p-4 rounded" >
            <form action="/member/myWishlist" method="POST">
            <table class="table table-hover">
                <thead class="text-center">
                  <tr>
                    <th scope="col" style="width: 10%;">#</th>
                    <th scope="col" style="width: 15%;"></th>
                    <th scope="col" >도서 제목</th>
                    <th scope="col" style="width: 15%;">상태</th>
                    <th scope="col" style="width: 15%;">신청 가능일</th>
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
                    <td class="align-middle" style="width: 15%; color: red;">대여불가</td>
                    <td class="align-middle" style="width: 15%;">2019.09.30</td>
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
                    <td class="align-middle" style="width: 15%; color: blue;">대여가능</td>
                    <td class="align-middle" style="width: 15%;">-</td>
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
                    <td class="align-middle" style="width: 15%; color: blue;">대여가능</td>
                    <td class="align-middle" style="width: 15%;">-</td>
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
                    <td class="align-middle" style="width: 15%; color: blue;">대여가능</td>
                    <td class="align-middle" style="width: 15%;">-</td>
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
                    <td class="align-middle" style="width: 15%; color: blue;">대여가능</td>
                    <td class="align-middle" style="width: 15%;">-</td>
                  </tr>

                </tbody>
              </table>
              <div class="my-3 text-right">
                <button type="submit" class="btn btn-primary">대여신청</button>
                <button type="reset" class="btn btn-danger ml-3">삭제</button>
              </div>
            </form>
          </div>
          <!-- end of Contents area -->
        </div>
        <!-- right area end -->
    </div>
    </div>
    <!-- middle container end -->

    

    

</body>
</html>