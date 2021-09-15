<%@ page language="java" contentType="text/html;charset=UTF-8" charset="UTF-8"pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>

<body>

  <!-- Carousel -->


  <div id="carouselExampleIndicators" class="carousel slide container" data-ride="carousel">
    <ol class="carousel-indicators ">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active bg-dark"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1" class="bg-dark"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2" class="bg-dark"></li>
    </ol>
    <div class="carousel-inner ">
      <div class="carousel-item active text-center">
        <img src="images/newbooks1.jpg" class="d-block rounded mx-auto d-block" alt="..." style="width: 580px;">
      </div>
      <div class="carousel-item">
        <img src="images/l9791188331796.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="..." class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="images/newbooks1.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="images/newbooks1.jpg" class="d-block w-100" alt="...">
      </div>
    </div>
    <a class="carousel-control-prev " href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon bg-dark" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next bl" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon bg-dark" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <!-- end of Carousel -->

<div class="container bg-light">
  <div class="row">
    <div class="col-3">
      <div class="dropdown-menu"></div>
        <form class="px-4 py-3">
          <div class="form-group">
            <label for="exampleDropdownFormEmail1">아이디</label>
            <input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="이메일">
          </div>
          <div class="form-group">
            <label for="exampleDropdownFormPassword1">비밀번호</label>
            <input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="비밀번호">
          </div>
          <div class="form-group">
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="dropdownCheck">
              <label class="form-check-label" for="dropdownCheck">
                로그인 유지
              </label>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">로그인</button>
        </form>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">회원가입</a>
      <a class="dropdown-item" href="#">비밀번호 찾기</a>
    </div>

    <div class="container col-9 ">
      <div class="row">
        <div class="d-flex flex-wrap align-bottom">
          <span class="badge badge-primary m-2">NEW</span>
          <h5 class="m-2">새로나온 책</h5>
          <div class="card-group">
            <div class="card">
              <img src="./images/l9791191360196.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
            <div class="card">
              <img src="./images/l9791166815782.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">하버드 회복탄력성 수업</h5>
                <p class="card-text">우울, 불안, 번아웃, 스트레스에 무너지지 않는 멘탈관리 프로젝트! 지금 바로 시작하자</p>
              </div>
            </div>
            <div class="card">
              <img src="./images/l9791188331796.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
              </div>
            </div>
            <div class="card">
              <img src="./images/l9791188331796.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="d-flex flex-wrap">
          <span class="badge badge-primary m-2">BEST</span>
          <h5 class="m-2">요즘 이 책</h5>
          <div class="card-group">
            <div class="card">
              <img src="./images/l9791191360196.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
            <div class="card">
              <img src="./images/l9791166815782.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">하버드 회복탄력성 수업</h5>
                <p class="card-text">우울, 불안, 번아웃, 스트레스에 무너지지 않는 멘탈관리 프로젝트! 지금 바로 시작하자</p>
              </div>
            </div>
            <div class="card">
              <img src="./images/l9791188331796.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
              </div>
            </div>
            <div class="card">
              <img src="./images/l9791188331796.jpg" class="card-img-top">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>

</html>