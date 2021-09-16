<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

<div class="container">
  <div class="row">

    <div class="col-3 ">
      <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
        <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab"
          aria-controls="v-pills-home" aria-selected="true">신간</a>
        <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab"
          aria-controls="v-pills-profile" aria-selected="false">건강/취미</a>
        <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
          aria-controls="v-pills-messages" aria-selected="false">경제/경영</a>
        <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
          aria-controls="v-pills-settings" aria-selected="false">사회/정치</a>
        <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
          aria-controls="v-pills-settings" aria-selected="false">소설/시</a>
        <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab"
          aria-controls="v-pills-messages" aria-selected="false">여행/예술</a>
        <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
          aria-controls="v-pills-settings" aria-selected="false">IT모바일</a>
        <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab"
          aria-controls="v-pills-settings" aria-selected="false">유아</a>
      </div>
    </div>


    <div class="col-9 bg-light">
      <div class="row">
        <div class="custom-control custom-switch col-3">
          <input type="checkbox" class="custom-control-input" id="rental_btn">
          <label class="custom-control-label m-2 " for="rental_btn">대여 가능만</label>
        </div>
        <div class="custom-control custom-switch text-right">
          <input type="checkbox" class="custom-control-input" id="image_btn">
          <label class="custom-control-label m-2 " for="image_btn">펼쳐보기</label>
        </div>
      </div>
      <!-- Page Content -->
      <div class="container">
        <div class="row text-center text-lg-start">
      
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791166815782.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791188331796.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791191360196.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791197413025.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791166815782.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791188331796.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791191360196.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791197413025.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791166815782.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791188331796.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791191360196.jpg" alt="">
            </a>
          </div>
          <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
              <img class="img-fluid img-thumbnail" src="resources/images/l9791197413025.jpg" alt="">
            </a>
          </div>
        </div>
      </div>


      <nav aria-label="..." class="row" style="float: none; margin:100 auto;">
        <div class="col-md-6" style="margin:0 auto;">
          <ul class="pagination">
            <li class="page-item disabled">
              <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item active" aria-current="page">
              <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item">
              <a class="page-link" href="#">다음</a>
            </li>
          </ul>
        </div>
      </nav>


    </div>
  </div>
</div>
 
</body>
</html>