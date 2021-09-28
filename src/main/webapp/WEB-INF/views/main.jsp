<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="resources/css/mainstyle.css">
<link rel="stylesheet" href="/resources/css/bootstrap.css">

</head>

<body class="wrap">
	<%-- include topNavbar.jsp --%>
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />

	<!-- Carousel -->
	<div id="carouselExampleIndicators" class="carousel slide container"
		data-ride="carousel" style="background: #ECE6CC;">
		<ol class="carousel-indicators ">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active bg-dark"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"
				class="bg-dark"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"
				class="bg-dark"></li>
		</ol>
		<div class="carousel-inner ">
			<div class="carousel-item active text-center">
				<img src="/resources/images/newbooks1.jpg"
					class="d-block rounded mx-auto d-block" alt="..."
					style="height: 480px;">
			</div>
			<div class="carousel-item">
				<img src="/resources/images/l9791188331796.jpg"
					class="d-block rounded mx-auto d-block" alt="..."
					style="height: 480px;">
			</div>
		</div>
		<a class="carousel-control-prev " href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon bg-dark" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next bl" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon bg-dark" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<!-- end of Carousel -->
	<div class="container" style="background: #ECE6CC;">
		<div class="row">
			<div class="col-3">
				<div class="text-center mt-5 login-form">
					<c:choose>
						<c:when test="${ not empty sessionScope.userid }">
							<!-- 로그인 했을때 -->
							<span>LIBRARY에 오신걸 환영합니다!</span><br/>
							<span>${ sessionScope.userid } 님</span><br/>
							<button type="submit" class="btn btn-link btn-sm pt-1"
								onclick="location.href='/member/beforeModify'">내정보수정</button><br/>
							<button type="submit" class="btn btn-danger btn-sm mt-1"
								onclick="location.href='/member/logout'">로그아웃</button>
						</c:when>
						<c:otherwise>
							<!-- 로그인 안했을때 -->
							<button type="submit" class="btn btn-secondary btn-lg"
								onclick="location.href='/member/login'">로그인</button><br/>
							<button type="submit" class="btn btn-secondary btn-sm mt-2"
								onclick="location.href='/member/join'">회원가입</button>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${ not empty sessionScope.userid }">
							<button type="submit" class="btn btn-primary "
								onclick="location.href='/member/logout'">로그아웃</button>
					</c:if> --%>

					<!-- <button type="submit" class="btn btn-primary "
						onclick="location.href='/member/login'">로그인</button>
					<button type="submit" class="btn btn-primary"
						onclick="location.href='/member/join'">회원가입</button> -->
				</div>

				<div class="jumbotron mt-5">
					<h1 class="display-4">Hello, world!</h1>
					<p class="lead">This is a simple hero unit, a simple
						jumbotron-style component for calling extra attention to featured
						content or information.</p>
					<hr class="my-4">
					<p>It uses utility classes for typography and spacing to space
						content out within the larger container.</p>
					<p class="lead">
						<a class="btn btn-primary btn-lg" href="#" role="button">Learn
							more</a>
					</p>
				</div>
			</div>
			<div class="container col-9 ">
				<div class="row text-center text-lg-start">
					<div class="d-flex flex-wrap align-bottom">
						<span class="badge badge-primary m-2">NEW</span>
						<h5 class="m-2">새로나온 책</h5>

						<div class="card-group best-seller">
							<div class="row row-cols-1 row-cols-md-5">
							<c:forEach var="doc" items="${docList}">
								<c:if test="${doc.TITLE_URL != ''}">
									<div class="card">
										<a href="#" class="">
											<img class="card-img-top mt-2" src="${ doc.TITLE_URL }" alt="Card image cap" style="max-width: 150px;">
										</a>
										<div class="card-body">
											<h5 class="card-title">${ doc.TITLE }</h5>
											<p class="card-text">${ doc.AUTHOR }</p>
										</div>
									</div>
								</c:if>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>



				<div class="row text-center text-lg-start">
					<div class="d-flex flex-wrap align-bottom">
						<span class="badge badge-primary m-2">BEST</span>
						<h5 class="m-2">요즘 이 책</h5>

						<div class="card-group new-book">
							<div class="card col-lg-3 col-md-4 col-6">
								<a href="#" class=""> <img class="card-img-top"
									src="/resources/images/l9791191360196.jpg" alt="Card image cap"
									style="max-width: 170px;">
								</a>
								<div class="card-body">
									<h5 class="card-title">미래의부</h5>
									<p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게
										될 것이다.</p>
								</div>
							</div>
							<div class="card col-lg-3 col-md-4 col-6">
								<a href="#" class=""> <img class="card-img-top"
									src="/resources/images/l9791166815782.jpg" alt="Card image cap"
									style="max-width: 170px;">
								</a>
								<div class="card-body">
									<h5 class="card-title">미래의부</h5>
									<p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게
										될 것이다.</p>
								</div>
							</div>
							<div class="card col-lg-3 col-md-4 col-6">
								<a href="#" class=""> <img class="card-img-top"
									src="/resources/images/l9791197413025.jpg" alt="Card image cap"
									style="max-width: 170px;">
								</a>
								<div class="card-body">
									<h5 class="card-title">미래의부</h5>
									<p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게
										될 것이다.</p>
								</div>
							</div>
							<div class="card col-lg-3 col-md-4 col-6">
								<a href="#" class=""> <img class="card-img-top"
									src="/resources/images/l9791197413025.jpg" alt="Card image cap"
									style="max-width: 170px;">
								</a>
								<div class="card-body">
									<h5 class="card-title">미래의부</h5>
									<p class="card-text">이 책을 읽게 되면 당장 해외 주식 앱을 다운로드중인 자신을 발견하게
										될 것이다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--    include bottomFooter.jsp--%>
	<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />
	<script src="/resources/js/bootstrap.js"></script>
	<script src="/resources/js/jquery-3.6.0.js"></script>
</body>

</html>