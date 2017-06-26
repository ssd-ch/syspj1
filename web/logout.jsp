<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="auth.jsp" %><%--ユーザー認証--%>
<!DOCTYPE html>
<html>
<%--文字コードやcss,jsの設定を記述する、今回はhead_meta.htmlに記述するのでインクルードを行う--%>
<jsp:include page="head_meta.html"/>
<%
    //セッション終了
    session.invalidate();
%>
<body>
<div id="container">
    <div id="header">
        <h1>勤怠管理システム</h1>
        <hr>
    </div>
    <div id="main">
        <h1>終わり</h1>
        ログアウトしました。
        <br>
        <a href="login.jsp">ログインへ</a>
    </div>
    <div id="footer">
        <jsp:include page="footer_div.jsp"/>
    </div>
</div>
</body>
</html>

