<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<%--文字コードやcss,jsの設定を記述する、今回はhead_meta.htmlに記述するのでインクルードを行う--%>
<jsp:include page="head_meta.html"/>
<body>
<div id="container">
    <div id="header">
        <%--body内でのヘッダ部分を記述する--%>
    </div>
    <div id="main">
        <h1>ログインページ</h1>

        <form method="post" action="sample1.jsp">
            <input type="hidden" name="next" value="shift1">
            <input type="submit" value="ログイン">
        </form>
    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
    </div>
</div>
</body>
</html>

