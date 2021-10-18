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
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>
    <script>
        showModal = function () {
            $(() => {
                $.ajax({
                    url: "/ajax_picture_finder",
                    data: "",
                    success: function (result) {
                        var container = document.getElementById("container");
                        while ( container.hasChildNodes() ) { container.removeChild( container.firstChild ); }
                        $("#container").html(result);
                    }
                });
            });
        };
    </script>
</head>
<body>
<jsp:include page="../header_footer/header_login.jsp"></jsp:include>
<main class="has_bg_harp" style="height: 100%;">
    <div id = "container" class="container">
        <div style="grid-column:1/3; display:flex;flex-direction: column; gap:40px; padding-top: 20px; background-color: #a2b0b36e">
            <div style="display: flex;justify-content: space-evenly; ">
                <span style=" color: var(--color-river-bed)"><i class="fas fa-bell fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 10px; color: var(--color-river-bed)"><a href="mypage12.html">My Page</a></div>
            </div>
            <div style="display: flex;justify-content: space-evenly;">
                <span style="color: var(--color-river-bed)"><i class="fas fa-question fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 15px; color: var(--color-river-bed)">구매내역</div>
            </div>
            <div style="display: flex;justify-content: space-evenly;">
                <span style="color: var(--color-river-bed)"><i class="fas fa-question fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 15px; color: var(--color-river-bed)">장바구니</div>
            </div>
            <div style="display: flex;justify-content: space-evenly;">
                <span style="color: var(--color-river-bed)"><i class="fas fa-question fa-lg"></i></span>
                <div style=" display:flex;align-items: center; margin-left: 15px; color: var(--color-river-bed)">질문내역</div>
            </div>
        </div>
        <div class="ui card" style="height: 80%;">
            <div class="content">
                <div class="right floated meta">14h</div>
                <img src="${cardVOlist.avatarimg}"
                     style="border-radius:50%;width:3em;height:3em;object-fit:cover;">
            </div>
            <div class="image">
                <img src="${cardVOlist.paintingmimg}"onclick="buypainting(${cardVOlist.no_painting});"
                     style="object-fit: cover; height: 250px">
            </div>
            <div class="content">
                    <span class="right floated">
                      <i class="heart outline like icon"></i>17 likes</span>
                <i class="comment icon"></i>3 comments
            </div>
            <div class="extra content">
                <div class="ui large transparent left icon input" style="display: flex;">
                    <i class="heart outline icon"></i>
                    <input type="text" placeholder="Add Comment..." maxlength='20' style="font-size: 0.8em"/>
                </div>
                <button class="ui blue icon button" onclick="" style="float: right; font-size: 0.8em;">Add</button>
            </div>
        </div>
        <div class="ui segments" style="grid-column:4/12; text-align: center; margin-top:15px; border-radius:8px;height:fit-content; ">
                <div style="font-size:2em; text-align: center;" class="ui segment">
                    <p>My Page</p>
                </div>
                <div class="ui segment">
                    <div  class="has_flex_center" style="font-size:2em;">
                        <img class="ui avatar image" src="<c:out value="${mypageVO.avatarimg}"/>">
                        <span style="color:black"><c:out value="${mypageVO.nickname}"/></span>
                    </div>
                </div>
                <div  class="ui segment">
                    <div style="font-size:2em;"><i class="truck icon"></i> 포인트 <div style="font-size:20px;"><c:out value="${mypageVO.dreampay}"/></div></div>
                </div>
                <div  class="ui segment">
                    <div style="font-size:2em;"><i class="truck icon"></i> 배송지 <div style="font-size:20px;"><c:out value="${mypageVO.addr}"/></div></div>
                </div>
                <div class="ui segment">
                    <div style="font-size:2em;"><i class="envelope icon"></i> e-mail <div style="font-size:20px;"><c:out value="${mypageVO.email}"/></div></div>
                </div>
                <div class="ui segment">
                    <div style="font-size:2em;"><i class="phone icon"></i> phone <div style="font-size:20px;"><c:out value="${mypageVO.tel}"/></div></div>
                </div>
                <div class="ui segment">
                    <p style="display:flex; justify-content: space-evenly;">
                        <a href="/charge"><button class="ui button " style="width:200px; height:50px; background-color:#a2b0b36e">포인트충전</button></a>
                        <button class="ui button" style="width:200px; height:50px; background-color:#a2b0b36e">수정하기</button>
                        <button class="ui button" style="width:200px; height:50px; background-color:#a2b0b36e">탈퇴하기</button>
                    </p>
                </div>
            </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>