<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="contentstyle.css">
</head>

<body>

    <!-- Navbar -->
    <div class="container">
        <h1>Board Form</h1>
    </div>
    <p></p>

    <!-- Post -->
    <section class="post" id="post" style="margin-top: 30px;">
        <form method="post" action="#">

            <!-- 제목 -->
            <div class="t1">제목</div>
            <div class="subject">
                <input type="text" class="form-subject" placeholder="게시글 제목" name="boTitle" maxlength="50" required>
            </div>
            <!-- 내용 -->
            <div class="t1">내용</div>
            <div class="content_box">
                <div class="content">
                    <textarea class="form-content" id="textarea" name="textarea" maxlength="2048" rows="6" placeholder="게시글 내용"></textarea>
                </div>

                <!-- 글목록 버튼 생성 -->
                <div class="btn_box">
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
        <i class="fa fa-user fa-5x"></i>
        <div class="media-body">
            <h4 class="mt-0">Media heading</h4>
            <p>Will you do the same for me? It's time to face the music I'm no longer your muse. Heard it's beautiful, be the judge and my girls gonna take a vote. I can feel a phoenix inside of me. Heaven is jealous of our love, angels are crying from up above. Yeah, you take me to utopia.</p>
        </div>
    </div>
    
    <div class="media">
        <i class="fa fa-user fa-5x"></i>
        <div class="media-body">
            <h4 class="mt-0">Media heading</h4>
            <p>Will you do the same for me? It's time to face the music I'm no longer your muse. Heard it's beautiful, be the judge and my girls gonna take a vote. I can feel a phoenix inside of me. Heaven is jealous of our love, angels are crying from up above. Yeah, you take me to utopia.</p>
        </div>
    </div>
    
    <!-- footer -->
</body></html>