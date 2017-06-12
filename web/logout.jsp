<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //セッション終了
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<%--文字コードやcss,jsの設定を記述する、今回はhead_meta.htmlに記述するのでインクルードを行う--%>
<jsp:include page="head_meta.html"/>
<body>
<div id="container">
    <div id="header">
        <hr>
    </div>
    <div id="main">
        <h1>終わり</h1>
        ログアウトしました。
        <br>
        <a href="login.jsp">ログインへ</a>
    </div>
    <div id="footer">
        <hr>
    </div>
</div>
</body>
</html>

