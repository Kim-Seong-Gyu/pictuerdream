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
    <script>
        //a태그 마우스오버1
        function mouseOver() {
            document.getElementById('noticeLink').style.backgroundColor = "gray";
            document.getElementById('menuFont').style.color = "white";
            document.getElementById('menuIcon').style.color = "white";
        }

        //a태그 마우스오버
        function mouseOver2() {
            document.getElementById('noticeLink2').style.backgroundColor = "gray";
            document.getElementById('menuFont2').style.color = "white";
            document.getElementById('menuIcon2').style.color = "white";
        }

        //a태그 마우스아웃
        function mouseOut() {
            document.getElementById('noticeLink').style.backgroundColor = "rgba(255,255,255,0)";
            document.getElementById('menuFont').style.color = "var(--color-river-bed)";
            document.getElementById('menuIcon').style.color = "var(--color-river-bed)";
        }

        //a태그 마우스아웃2
        function mouseOut2() {
            document.getElementById('noticeLink2').style.backgroundColor = "rgba(255,255,255,0)";
            document.getElementById('menuFont2').style.color = "var(--color-river-bed)";
            document.getElementById('menuIcon2').style.color = "var(--color-river-bed)";
        }

        function modal() {
            document.getElementById("modaldiv")
        }
    </script>

    <script type="text/javascript">
        let status = undefined; //0~4 까지 질문 종류

        showModal = function () {
            $('.ui.modal').modal('show');
        };
        requestQA = function () {
            $(() => {
                if (status == undefined) return;
                let question = document.getElementById("question").value;
                $.ajax({
                    url: "/ajax_request_QA",
                    data: "question=" + question + "&status=" + status,
                    success: function (result) {
                        document.location.href = "/notice";
                    }
                });
            });
        };
        selectedBtn = function (number) {
            $(() => {
                status = number
            });
        };

    </script>
</head>
<body>
<% if (session.getAttribute("logStatus") == "Y") { %>
<jsp:include page="../header_footer/header_login.jsp">
    <jsp:param name="user" value="${user}"/>
</jsp:include>
<% } %>
<% if (session.getAttribute("logStatus") == null) { %>
<jsp:include page="../header_footer/header_not_login.jsp"></jsp:include>
<% } %>
<main class="has_bg_harp" style="height: auto;">
    <div class="ui modal">
        <div class="header">질문 사항</div>
        <div class="ui form">
            <div class="field">
                <div class="five ui buttons">
                    <button class="ui button" onclick="selectedBtn(0)">운영 정책</button>
                    <button class="ui button" onclick="selectedBtn(1)">구매/판매</button>
                    <button class="ui button" onclick="selectedBtn(2)">가격 정책</button>
                    <button class="ui button" onclick="selectedBtn(3)">계정 인증</button>
                    <button class="ui button" onclick="selectedBtn(4)">그 외 질문</button>
                </div>
                <textarea id="question"></textarea>
            </div>
        </div>
        <div class="actions" style="background-color: #95afc0">
            <div class="ui positive right labeled icon button" style="background-color: var(--color-metallic-blue)"
                 onclick="requestQA()">
                올리기
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="has_flex_column" style="grid-column:1/3; gap:40px;padding-top: 30px; background-color: #a2b0b36e">
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content">공지사항</div>
                <div class="visible content">
                    <i class="bullhorn icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content">자주 묻는 질문</div>
                <div class="visible content">
                    <i class="question circle icon"></i>
                </div>
            </div>
            <div class="ui vertical animated button" tabindex="0" onclick="showModal()">
                <div class="hidden content">질문하기</div>
                <div class="visible content">
                    <i class="comments outline icon"></i>
                </div>
            </div>
        </div>
        <div class="has_flex_end" style="grid-column: 3/13; flex-wrap: wrap; margin-top: 20px; margin-bottom: 20px;">
            <div tabindex="0" onclick="showModal()">
                <button class="ui button" style="font-family: 'BMHANNAPro';">질문하기</button>
            </div>
            <div class="manager_card"
                 style="display: grid;grid-template-columns:repeat(3,1fr);grid-gap:1rem;width: 100%;">
                <c:forEach var="noticeVOList" items="${noticeVOList}">
                    <div class="ui card" style="height: 100%; margin: 0 auto;">
                        <div class="content">
                            <div class="right floated meta">14h</div>
                            <img src="${noticeVOList.avatarimg}"
                                 style="border-radius: 50%; width: 3em;height: 3em;object-fit: cover;">
                        </div>
                        <div class="image">
                            <img src="${noticeVOList.paintingmimg}" style="object-fit: cover; height: 250px"></a>
                        </div>
                        <div class="content" style="display: flex;justify-content: center;">
                            <span>${noticeVOList.content}</span>
                        </div>
                        <div class="extra content">
                            <div class="ui large transparent left icon input" style="display: flex;">
                                <i class="pencil alternate icon"></i>
                                <input type="text" id="${cardVOlist.no_painting}" placeholder="Add Comment..."
                                       maxlength='20'
                                       style="font-size: 0.8em"/>
                            </div>
                            <button class="ui blue icon button" onclick="addComment(${cardVOlist.no_painting})"
                                    style="float: right; font-size: 0.8em;">Add
                            </button>
                        </div>
                        <div class="ui bottom attached button collapsible">
                            <i class="add icon"></i>
                            <span><i class="comment icon"></i>${cardVOlist.commentNumber}</span>
                        </div>
                        <div class="comments_css">
                            <div class="ui comments">
                                <c:forEach var="commentVOList" items="${cardVOlist.commentVOList}">
                                    <h4 class="ui" style="user-select: auto;"></h4>
                                    <div class="comment" style="margin-left: 10px; margin-bottom: 10px;">
                                        <a class="avatar"><img src="${commentVOList.avatarimg}"
                                                               style="border-radius: 50%; height:40px; width:40px;object-fit: cover;"></a>
                                        <div class="content">
                                            <a class="author">${commentVOList.author}</a>
                                            <div class="metadata">
                                                <span class="date">${commentVOList.date}</span>
                                            </div>
                                            <div class="text">${commentVOList.comments}</div>
                                            <div class="actions"></div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>
<jsp:include page="../header_footer/footer.jsp"></jsp:include>
</body>
</html>