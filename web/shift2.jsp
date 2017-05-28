<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        ヘッダ領域
        <hr>
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
        <hr>
        フッタ領域
    </div>
</div>
</body>
</html>

