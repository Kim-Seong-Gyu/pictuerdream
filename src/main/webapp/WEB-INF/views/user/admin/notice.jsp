<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String conPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/dreampicturesytle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}</style>
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script>
        function modal() {document.getElementById("modaldiv")}
    </script>
    <script type="text/javascript">
        push_notice = function () {
            $(() => {
                let title = document.getElementById("title").value;
                let question = document.getElementById("question").value;
                $.ajax({
                    url: "/ajax_push_notice",
                    data: "title=" + title + "&question=" + question,
                    success: function () {
                        document.location.href = "/admin/notice";
                    }
                });
            });
        };
        showModal = function () {$('.ui.tiny.modal').modal('show');};
    </script>
</head>
<body class="w3-light-grey">
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s8 w3-bar" style="text-align: center;margin-left: 50px">
            <span>Welcome, <strong>Master</strong></span><br>
            <form action="<%=conPath%>/admin/login" method="post">
                <button class="ui secondary button" style="height:35px;font-family: 'BMHANNAPro';">로그아웃</button>
            </form>
        </div>
    </div>
    <hr>
    <div class="w3-container"></div>
    <div class="w3-bar-block">
        <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
        <a href="/admin/main" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  관리자 메인으로</a>
        <a href="/admin/notice" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-bullseye fa-fw"></i>  공지사항</a>
        <a href="/admin/qa" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  질문사항</a>
        <a href="/admin/salesHistory" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  판매현황</a>
        <a href="/admin/report" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  신고내역</a>
        <a href="/admin/blacklist" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  블랙리스트</a>
        <a href="/admin/allmembers" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  회원현황</a><br><br>
    </div>
</nav>
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
<div class="w3-main" style="margin-left:300px;">
    <main class="has_bg_harp" style="height: auto;">
        <div class="container" style="height: 100%;margin-left: 200px">
            <div class="has_flex_end" style="grid-column: 1/13; flex-wrap: wrap; margin-top: 20px;margin-bottom: 20px;">
                <div tabindex="0" onclick="showModal()" style="display: flex;margin-top: 50px;margin-right: 100px;">
                    <h1 class="ui header" style="margin-right: 230px;font-family: 'BMHANNAPro';color:var(--color-chathams-blue)">공지사항</h1>
                    <button class="ui button" style="font-family: 'BMHANNAPro';height: 50px">공지사항 올리기</button>
                </div>
                <div class="manager_card" style="display: grid;grid-template-columns:repeat(3,1fr);grid-gap:1rem;width: 100%;">
                    <c:forEach var="noticeVOList" items="${noticeVOList}">
                        <div class="ui card" style="height: 100%; margin: 0 auto;" >
                            <div class="content" style="height: 100%; margin: 0 auto;">
                                <div class="header">${noticeVOList.title}</div>
                                <div class="meta">${noticeVOList.writedate}</div>
                                <div class="description"><p>${noticeVOList.content}</p></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="container" style="display: flex;justify-content: center;margin-top:30px;padding-bottom: 30px;">
            <div>
                <div class="ui animated button" tabindex="0"
                     style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                    <div class="visible content">Perv</div>
                    <div class="hidden content">
                        <i class="left arrow icon"></i>
                    </div>
                </div>
                <c:forEach var="i" begin="1" end="${pageNum}">
                    <div class="ui animated button" tabindex="0"
                         style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                        <div class="visible content">${i}</div>
                        <div class="hidden content">${i}</div>
                    </div>
                </c:forEach>
                <div class="ui animated button" tabindex="0"
                     style="color:var(--color-white);background-color: var(--color-chathams-blue);">
                    <div class="visible content">Next</div>
                    <div class="hidden content">
                        <i class="right arrow icon"></i>
                    </div>
                </div>
                </br>
            </div>
        </div>
    </main>
    <div class="ui tiny modal">
        <div class="header">공지 사항</div>
        <div class="ui form">
            <div class="field">
                <div class="field" placeholder="Last Name">
                    <div class="ui blue large label">제목을 입력해주세요</div>
                    <input type="text" id="title">
                    <div class="ui blue large label">공지내용을 입력해주세요</div>
                    <input type="text" id="question">
                </div>
            </div>
        </div>
        <div class="actions" style="background-color: #95afc0">
            <div class="ui positive right labeled icon button" style="background-color: var(--color-metallic-blue)" onclick="push_notice()">올리기<i class="checkmark icon"></i></div>
        </div>
    </div>
</div>
<script>
    var mySidebar = document.getElementById("mySidebar");
    var overlayBg = document.getElementById("myOverlay");
    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
            overlayBg.style.display = "none";
        } else {
            mySidebar.style.display = 'block';
            overlayBg.style.display = "block";
        }
    }
    function w3_close() {
        mySidebar.style.display = "none";
        overlayBg.style.display = "none";
    }
</script>
</body>
</html>