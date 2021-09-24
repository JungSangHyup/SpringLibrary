<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page="/WEB-INF/views/include/head.jsp"/>
  <title>Document</title>
  </head>
<body class="wrap">
	<jsp:include page="/WEB-INF/views/include/navbar.jsp"/>
  <div class="container bg_color" style="max-width: 720px;" >
      <div class="card mb-3">
        <div class="row no-gutters">
          <div class="col-md-4">
            <img src="/display?sign=${ bookVO.bookImg }" alt="..." class="m-2">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">${bookVO.bookName}</h5>
              <p class="card-text">${bookVO.bookWriter}</p>
              <p class="card-text">${bookVO.bookDes}</p>
              <button type="button" class="btn btn-primary">대여</button>
              <button type="button" class="btn btn-primary">찜하기</button>
            </div>
          </div>
        </div>
      </div>
    <div class="description">
    ${ bookVO.bookDetail }
    </div>
    <hr>
    <div class="detail-img">
      <h4>상세 이미지</h4>
      <img src="/display?sign=${ bookVO.bookImg }" alt="">
    </div>
    <hr>
    <div class="review">
      <h4>리뷰</h4>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="well well-sm">
            <div class="row">
              <div class="col-xs-6 col-md-6 text-center">
                <h1 class="rating-num">
                  4.0</h1>
                <div class="rating">
                  <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                  </span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                  </span><span class="glyphicon glyphicon-star-empty"></span>
                </div>
                <div>
                  <span class="glyphicon glyphicon-user"></span>1,001 평가
                </div>
              </div>
              <div class="col-xs-6 col-md-6">
                <div class="row rating-desc">
                  <div class="col-xs-3 col-md-3 text-right">
                    <span class="glyphicon glyphicon-star"></span>5
                  </div>
                  <div class="col-xs-8 col-md-9">
                    <div class="progress progress-striped">
                      <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0"
                        aria-valuemax="100" style="width: 80%">
                        <span class="sr-only">80%</span>
                      </div>
                    </div>
                  </div>
                  <!-- end 5 -->
                  <div class="col-xs-3 col-md-3 text-right">
                    <span class="glyphicon glyphicon-star"></span>4
                  </div>
                  <div class="col-xs-8 col-md-9">
                    <div class="progress">
                      <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0"
                        aria-valuemax="100" style="width: 60%">
                        <span class="sr-only">60%</span>
                      </div>
                    </div>
                  </div>
                  <!-- end 4 -->
                  <div class="col-xs-3 col-md-3 text-right">
                    <span class="glyphicon glyphicon-star"></span>3
                  </div>
                  <div class="col-xs-8 col-md-9">
                    <div class="progress">
                      <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0"
                        aria-valuemax="100" style="width: 40%">
                        <span class="sr-only">40%</span>
                      </div>
                    </div>
                  </div>
                  <!-- end 3 -->
                  <div class="col-xs-3 col-md-3 text-right">
                    <span class="glyphicon glyphicon-star"></span>2
                  </div>
                  <div class="col-xs-8 col-md-9">
                    <div class="progress">
                      <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20" aria-valuemin="0"
                        aria-valuemax="100" style="width: 20%">
                        <span class="sr-only">20%</span>
                      </div>
                    </div>
                  </div>
                  <!-- end 2 -->
                  <div class="col-xs-3 col-md-3 text-right">
                    <span class="glyphicon glyphicon-star"></span>1
                  </div>
                  <div class="col-xs-8 col-md-9">
                    <div class="progress">
                      <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0"
                        aria-valuemax="100" style="width: 15%">
                        <span class="sr-only">15%</span>
                      </div>
                    </div>
                  </div>
                  <!-- end 1 -->
                </div>
                <!-- end row -->
              </div>
            </div>
          </div>
    
        </div>
      </div>
      <!-- 리뷰 -->
        <h2 class="text-left">사용자 평가</h2>
    
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-2">
                <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" />
                <p class="text-secondary text-center">user1</p>
              </div>
              <div class="col-md-10">
                <p>
                  <a class="float-left" href=""><strong>Maniruzzaman
                      Akash</strong></a>
                  <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                  <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                  <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                  <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                </p>
                <div class="clearfix"></div>
                <p>책이 정말 유익해요</p>
                <p>
                  <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i>좋아요</a>
                </p>
              </div>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-2">
                <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" />
                <p class="text-secondary text-center">user2</p>
              </div>
              <div class="col-md-10">
                <p>
                  <a class="float-left" href=""><strong>Maniruzzaman
                      Akash</strong></a>
                  <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                  <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                  <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                  <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                </p>
                <div class="clearfix"></div>
                <p>책이 정말 유익해요</p>
                <p>
                  <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i>좋아요</a>
                </p>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp"/>
	<script src="/resources/js/bootstrap.js"></script>
    <script src="/resources/js/jquery-3.6.0.js"></script>

</body>
</html>