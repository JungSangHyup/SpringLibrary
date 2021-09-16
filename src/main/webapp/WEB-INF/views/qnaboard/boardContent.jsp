<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/contentstyle.css">
</head>

<body>

    <!-- Navbar -->
    <jsp:include page="/WEB-INF/views/include/navbar.jsp" />
    
    <div class="boardform">
        <h1>Board Form</h1>
    </div>
    <p></p>

    <!-- Post -->
    <section class="post" id="post" style="margin-top: 30px;">
        <h4 style="text-align: center;"> 게시글 </h4>

        <div class="hrtag">
            <hr class="my-1" style="height: 2px; background: #ECE6CC; border-radius: 10px;">
        </div>

        <form method="post" action="#">
            <!-- 제목 -->

            <div style="text-align: center;"><i class="fa fa-user fa-2x"></i></div>
            <div style="text-align: center; margin-bottom: 5px;">작성자</div>
            <div class="userid">
                <div class="form-userid">${boardVO.userid}</div>
            </div>
            <div style="text-align: center; margin-bottom: 5px;">제목</div>
            <div class="subject">
                <div class="form-subject">${boardVO.subject}</div>
            </div>
            <!-- 내용 -->
            <div style="text-align: center; margin-bottom: 10px; margin-top: 10px;">내용</div>
            <div class="content_box">
                <div class="content">
                    <div class="form-content">${boardVO.content}</div>
                </div>

                <!-- 글목록 버튼 생성 -->
                <div class="btn_box">
                	<input type="button" class="sub_btn" value="글수정">
                    <input type="button" class="list_btn" value="글목록">
                </div>

            </div>
        </form>

    </section>

    <div class="hrtag">
        <hr class="my-4">
    </div>

    <h3> 댓글 </h3>

    <div class="media">
        <i class="fa fa-user fa-5x" style="margin: 10px; line-height: 90px; font-size: 80px;"></i>
        <div class="media-body">
            <h4 class="mt-0">Media heading</h4>
            <p>Will you do the same for me? It's time to face the music I'm no longer your muse. Heard it's beautiful, be the judge and my girls gonna take a vote. I can feel a phoenix inside of me. Heaven is jealous of our love, angels are crying from up above. Yeah, you take me to utopia.</p>
        </div>
    </div>

    <div class="media">
        <i class="fa fa-user fa-5x" style="margin: 10px; line-height: 90px; font-size: 80px;"></i>
        <div class="media-body">
            <h4 class="mt-0">Media heading</h4>
            <p>Will you do the same for me? It's time to face the music I'm no longer your muse. Heard it's beautiful, be the judge and my girls gonna take a vote. I can feel a phoenix inside of me. Heaven is jealous of our love, angels are crying from up above. Yeah, you take me to utopia.</p>
        </div>
    </div>
    
    <!-- footer -->
<jsp:include page="/WEB-INF/views/include/bottomFooter.jsp" />
</body>
</html>