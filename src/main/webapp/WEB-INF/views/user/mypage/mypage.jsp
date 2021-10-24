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
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.js"></script>

</head>
<body>
<jsp:include page="../header_footer/header_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div id="container" class="container">
        <div style="grid-column:1/3;display:flex;flex-direction: column;gap:40px; padding-top: 20px; background-color: #a2b0b36e">
            <div class="has_flex_column"
                 style="grid-column:1/3; gap:40px;padding-top: 30px;">
                <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                    <div class="hidden content"><a href="/mypage/+${user}">My Page</a></div>
                    <div class="visible content">
                        <i class="red user circle icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                    <div class="hidden content"><a href="/buylist">구매내역</a></div>
                    <div class="visible content">
                        <i class="orange shipping fast icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                    <div class="hidden content"><a href="/selllist">판매내역</a></div>
                    <div class="visible content">
                        <i class="orange shipping fast icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                    <div class="hidden content"><a href="/cart">장바구니</a></div>
                    <div class="visible content">
                        <i class="yellow shopping cart icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                    <div class="hidden content"><a href="/qalist">질문내역</a></div>
                    <div class="visible content">
                        <i class="green comments outline icon"></i>
                    </div>
                </div>
                <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                    <div class="hidden content"><a href="/charge">포인트 입출금</a></div>
                    <div class="visible content">
                        <i class="blue money bill alternate outline icon"></i>
                    </div>
                </div>
            </div>
        </div>
        <div style="grid-column: 3/13;display: flex;flex-direction: column;justify-content: space-between;align-items: center;justify-content: space-evenly">
            <div style="font-weight:bold;font-family:'Gowun Dodum';color:var(--color-chathams-blue);font-size:var(--font-size-xll);padding-top: 25px;">MY PAGE</div>
            <div class="ui card" style="width:500px;grid-column: 5/12;height: fit-content;">
                <div class="content" style="display:flex;justify-content: space-evenly;align-items: center;">
                    <div><img src="${mypageVO.avatarimg}" style="border-radius:50%;width:5em;height:5em; object-fit:cover;"></div>
                    <div style="color:black;font-size: 3em;"><c:out value="${mypageVO.nickname}"/></div>
                </div>
                <div class="content">
                    <span class="right floated"></span>
                    <div class="ui segment" style="text-align:center;">
                        <div style="font-size:1.5em;"><i class="money bill alternate outline icon"></i>포인트<div style="font-size:25px;"><c:out value="${mypageVO.dreampay}"/></div></div>
                    </div>
                    <div class="ui segment" style="text-align:center;">
                        <div style="font-size:1.5em;"><i class="truck icon"></i>배송지<div style=";font-size:25px;"><c:out value="${mypageVO.addr}"/></div></div>
                    </div>
                    <div class="ui segment" style="text-align:center;">
                        <div style="font-size:1.5em;"><i class="envelope icon"></i>이메일<div style="font-size:25px;"><c:out value="${mypageVO.email}"/></div></div>
                    </div>
                    <div class="ui segment" style="text-align:center;">
                        <div style="font-size:1.5em;"><i class="phone icon"></i>연락처<div style=";font-size:25px;"><c:out value="${mypageVO.tel}"/></div></div>
                    </div>
                </div>
                <div class="extra content">
                    <div style="display:flex; justify-content: space-evenly;">
                        <button class="ui primary basic button" style="font-weight:bold;font-family: 'Gowun Dodum';width:150px; height:50px;">수정하기</button>
                        <button class="ui primary basic button" style="font-weight:bold;font-family: 'Gowun Dodum';width:150px; height:50px;">탈퇴하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    $(document).ready(function ()
    {
        $('.ui.segment').hover(function(){
            $(this).css('background','#E7F0F0');
        }, function() {
            $(this).css('background','white');
        });
    });
</script>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>
