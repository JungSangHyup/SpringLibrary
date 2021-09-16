<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
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


        <div class="card mb-3">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="/resources/images/l9791166815782.jpg" alt="..." style="max-width: 180px;">
            </div>
            <div class="col-md-8">
              <div class="card-body float-left">
                <h5 class="card-title ">하버드 회복탄력성 수업</h5>
                <p class="text-right text-primary">대여가능</p>
                <p class="card-text">우울, 불안, 번아웃, 스트레스에 무너지지 않는 멘탈관리 프로젝트! 지금 바로 시작하자</p>
              </div>
            </div>
          </div>
        </div>
        <div class="card mb-3">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="/resources/images/l9791166815782.jpg" alt="..." style="max-width: 180px;">
            </div>
            <div class="col-md-8 ">
              <div class="card-body ">
                <h5 class="card-title ">하버드 회복탄력성 수업</h5>
                <p class="text-right text-primary">대여가능</p>
                <p class="card-text">우울, 불안, 번아웃, 스트레스에 무너지지 않는 멘탈관리 프로젝트! 지금 바로 시작하자</p>
              </div>
            </div>
          </div>
        </div>
      
      
        <div class="card mb-3">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="/resources/images/l9791166815782.jpg" alt="..." style="max-width: 180px;">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">하버드 회복탄력성 수업</h5>
                <p class="text-right text-danger">대여중</p>
                <p class="card-text">우울, 불안, 번아웃, 스트레스에 무너지지 않는 멘탈관리 프로젝트! 지금 바로 시작하자</p>
              </div>
            </div>
          </div>
        </div>


        <div class="card mb-3">
          <div class="row no-gutters">
            <div class="col-md-4">
              <img src="/resources/images/l9791166815782.jpg" alt="..." style="max-width: 180px;">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">하버드 회복탄력성 수업</h5>
                <p class="text-right text-danger">대여중</p>
                <p class="card-text">우울, 불안, 번아웃, 스트레스에 무너지지 않는 멘탈관리 프로젝트! 지금 바로 시작하자</p>
              </div>
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