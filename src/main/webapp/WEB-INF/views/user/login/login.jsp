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
    <script src="https://kit.fontawesome.com/b14e6f064f.js" crossorigin="anonymous"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <script>
        showModal = function () {
            $('.ui.modal').modal('show');
        };
    </script>
</head>
<body>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<main class="has_bg_harp">
    <div class="ui modal">
        <div class="header">비밀번호 찾기 <i class="unlock alternate icon"></i></div>
        <div class="ui form">
            <div class="has_flex_column" style="gap:30px; margin-top: 20px; margin-bottom: 20px;">
                <div class="ui input">
                    <input class="find_pwd" type="text" placeholder="아이디를 입력해주세요." style="user-select: auto;">
                </div>
                <div class="ui input">
                    <input class="find_pwd" type="text" placeholder="연락처를 입력해주세요." style="user-select: auto;">
                </div>
            </div>
        </div>
        <div class="actions" style="background-color: #95afc0">
            <div class="ui positive right labeled icon button" style="background-color: var(--color-metallic-blue)"
                 onclick="requestQA()">
                찾기
               <i class="checkmark icon"></i>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="contents" style="grid-column: 5/9; margin-top: 50px">
            <form action="<%=conPath%>/login_check" method="post" id="frm">
                <div class="has_flex_space_cl" style="height: 650px;">
                    <div class="title">로그인 화면</div>
                    <div class="has_flex_left"><input type="text" class="is_login_input has_width_full" name="email"
                                                      id="email" required="required" placeholder="이메일"></div>
                    <div class="has_flex_left"><input type="password" placeholder="Password" name="pwd" id="pwd"
                                                      class="is_login_input has_width_full"/></div>
                    <div class="has_flex_center" style="display: flex; width: 100%; justify-content: space-around;">
                        <div style="display: flex;align-items: center;gap:10px; ">
                            <input type="checkbox" id="login_check" style="height: 20px;">
                            <span class="has_black has_font-xs">Remember me</span>
                        </div>

                        <div onclick="showModal()"><a href='#' class="has_black"> <i class="large unlock alternate icon"></i> Forgot password?</a></div>
                    </div>
                    <a href="/login_check">
                        <button class='button is_login has_shadow has_width_full has_flex_center'><i
                                class="fas fa-key"></i><span class="has_padding">로그인</span></button>
                    </a>
                    <button class='button is_login has_shadow has_flex_center has_bg_turbo has_width_full'><i
                            class="fas fa-comment"></i></i></i><span
                            class="has_padding">카카오톡 로그인</span></button>
                    <button class='button is_login has_shadow has_flex_center has_bg_white has_width_full'><i
                            class="fab fa-google"></i><span
                            class="has_padding">구글계정</span></button>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>