<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page="/WEB-INF/views/include/head.jsp"/>
  <title>Document</title>
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
        integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="/resources/css/star.css" />

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
				<c:if test="${bookVO.bookIsbn eq 'Y'}"><button type="button" class="btn btn-primary rental">대여</button></c:if>
				<c:if test="${bookVO.bookIsbn eq 'N'}"><button type="button" class="btn btn-danger rental" disabled=”disabled”>대여 중</button></c:if>
              <button type="button" class="btn btn-primary wish">찜하기</button>
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

        <c:choose>
          <c:when test="${reviewList.size() > 0}">
            <c:forEach var="review" items="${reviewList}">
              <div class="card rounded m-2">
                <div class="card-body ">
                  <div class="row">
                    <div class="col-md-2">
                      <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" />
                    </div>
                    <div class="col-md-10">
                      <p>
                        <a class="float-left" href=""><strong>${userId}</strong></a>
                        <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                        <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                        <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                        <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                      </p>
                      <p>${ review.content }</p>
                      <p>
                        <a class="float-right btn text-white btn-primary"> <i class="fa fa-heart"></i>좋아요</a>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:when>
          <c:when test="${reviewList.size() == 0}">
            <div class="card rounded">
              <div class="card-body ">
                <div class="row">
                  <div class="col-md-12">
                    <p>아직 리뷰가 없습니다.</p>
                  </div>
                </div>
              </div>
            </div>
          </c:when>
        </c:choose>
      <form name="commentForm" method="post" action="/comment/write">
        <div class="card mb-3 rounded">
          <div class="no-gutters row">
            <div class="col-md-2 align-content-center">
              <img src="/resources/images/default_book.jpg" alt="..." class="w-100">
            </div>
            <div class="col-md-10">
              <div class="card-body">
                <h5 class="card-title">책 평가하기</h5>
                <div class="stars">
                  <input class="star star-5" id="star-5" type="radio" name="star" value="5"/>
                  <label class="star star-5" for="star-5"></label>
                  <input class="star star-4" id="star-4" type="radio" name="star" value="4"/>
                  <label class="star star-4" for="star-4"></label>
                  <input class="star star-3" id="star-3" type="radio" name="star" value="3"/>
                  <label class="star star-3" for="star-3"></label>
                  <input class="star star-2" id="star-2" type="radio" name="star" value="2"/>
                  <label class="star star-2" for="star-2"></label>
                  <input class="star star-1" id="star-1" type="radio" name="star" value="1"/>
                  <label class="star star-1" for="star-1"></label>
                </div>
                <textarea id="textarea" class="form-control card-text"> </textarea>
                <div class="mt-3 d-flex justify-content-between">
                  <button class="btn btn-sm btn-primary card-">등록</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>







  </div>
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp"/>
	<script src="/resources/js/bootstrap.js"></script>
    <script src="/resources/js/jquery-3.6.0.js"></script>
	<script>
      $(document).ready(function() {
        $('#rateMe2').mdbRate();
      });

		document.querySelector('.rental').addEventListener('click', (e) => {
		  e.preventDefault();
		  let rent = confirm(`대여하시겠습니까?`);
		  if(rent){
            location.href='/book/rental?num=${ bookVO.bookId }';
          }
        })
	</script>
</body>
</html>