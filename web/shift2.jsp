<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="auth.jsp" %><%--ユーザー認証--%>
<%
    //POSTで受けっとったデータの文字コード設定
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ja">
<jsp:include page="head_meta.html"/>
<body>
<div id="container">
    <div id="header">
        <%--body内でのヘッダ部分を記述する--%>
        <jsp:include page="header_div.jsp"/>
    </div>
    <div id="main">
        <%--メインコンテンツを記述する--%>
        <h1>シフト表２</h1>

        <br>
        シフト表１から<%=request.getParameter("year")%>年<%=request.getParameter("month")%>月<%=request.getParameter("day")%>日
        というデータを受け取ったよ

    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <jsp:include page="footer_div.jsp"/>
    </div>
</div>
</body>
</html>

<%--
    共通で行って欲しいところ
    2 , 14 , 27 行目のインクルード
    divの領域わけ( header , main , footer)
    それぞれのページ名（シフト１やユーザー管理など）はmainの中で一番上にh1タグで記述
--%>
