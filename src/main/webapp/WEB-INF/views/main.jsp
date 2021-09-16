<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
    integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>

<body>
	<%-- include topNavbar.jsp --%>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>

  <!-- Carousel -->


  <div id="carouselExampleIndicators" class="carousel slide container" data-ride="carousel">
    <ol class="carousel-indicators ">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active bg-dark"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1" class="bg-dark"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2" class="bg-dark"></li>
    </ol>
    <div class="carousel-inner ">
      <div class="carousel-item active text-center">
        <img src="/resources/images/newbooks1.jpg" class="d-block rounded mx-auto d-block" alt="..." style="width: 580px;">
      </div>
      <div class="carousel-item">
        <img src="/resources/images/l9791188331796.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="..." class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="/resources/images/newbooks1.jpg" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="/resources/images/newbooks1.jpg" class="d-block w-100" alt="...">
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

<div class="container">
  <div class="row">
    <div class="col-3 bg-light">
      <div class=" modal-dialog modal-sm text-center mt-5 ">
        <button type="submit" class="btn btn-primary ">로그인</button>
        <button type="submit" class="btn btn-primary">회원가입</button>
      </div>
      <div class="jumbotron mt-5">
        <h1 class="display-4">Hello, world!</h1>
        <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured
          content or information.</p>
        <hr class="my-4">
        <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
        <p class="lead">
          <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
        </p>
      </div>
    </div>

     <div class="container col-9 ">
      <div class="row text-center text-lg-start">
        <div class="d-flex flex-wrap align-bottom">
          <span class="badge badge-primary m-2">NEW</span>
          <h5 class="m-2">새로나온 책</h5>

          <div class="card-group">
            <div class="card col-lg-3 col-md-4 col-6">
              <a href="#" class="">
                <img class="card-img-top" src="/resources/images/l9791191360196.jpg" alt="Card image cap" style="max-width: 170px;">
              </a>
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
            <div class="card col-lg-3 col-md-4 col-6">
              <a href="#" class="">
                <img class="card-img-top" src="/resources/images/l9791166815782.jpg" alt="Card image cap" style="max-width: 170px;">
              </a>
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
            <div class="card col-lg-3 col-md-4 col-6">
              <a href="#" class="">
                <img class="card-img-top" src="/resources/images/l9791197413025.jpg" alt="Card image cap" style="max-width: 170px;">
              </a>
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
            <div class="card col-lg-3 col-md-4 col-6">
              <a href="#" class="">
                <img class="card-img-top" src="/resources/images/l9791197413025.jpg" alt="Card image cap" style="max-width: 170px;">
              </a>
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      
      
<div class="row text-center text-lg-start">
        <div class="d-flex flex-wrap align-bottom">
          <span class="badge badge-primary m-2">NEW</span>
          <h5 class="m-2">요즘 이 책</h5>
      
          <div class="card-group">
            <div class="card col-lg-3 col-md-4 col-6">
              <a href="#" class="">
                <img class="card-img-top" src="/resources/images/l9791191360196.jpg" alt="Card image cap"
                  style="max-width: 170px;">
              </a>
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
            <div class="card col-lg-3 col-md-4 col-6">
              <a href="#" class="">
                <img class="card-img-top" src="/resources/images/l9791166815782.jpg" alt="Card image cap"
                  style="max-width: 170px;">
              </a>
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
            <div class="card col-lg-3 col-md-4 col-6">
              <a href="#" class="">
                <img class="card-img-top" src="/resources/images/l9791197413025.jpg" alt="Card image cap"
                  style="max-width: 170px;">
              </a>
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
            <div class="card col-lg-3 col-md-4 col-6">
              <a href="#" class="">
                <img class="card-img-top" src="/resources/images/l9791197413025.jpg" alt="Card image cap"
                  style="max-width: 170px;">
              </a>
              <div class="card-body">
                <h5 class="card-title">미래의부</h5>
                <p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게 될 것이다.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	  <%--    include bottomFooter.jsp--%>
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp"/>
</body>

</html>