<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="syspj.JDBCPostgreSQL" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="auth.jsp" %><%--ユーザー認証--%>
<%
    //POSTで受けっとったデータの文字コード設定
    request.setCharacterEncoding("UTF-8");

    String userID = (String) session.getAttribute("userID");

    JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
    dbAdapter.open(); //データベースに接続

    String sql = "select * from users where id = '" + userID + "';";
    String[] column = {"id", "name"};

    ArrayList<HashMap<String, String>> resultData = dbAdapter.get(sql, column);

    dbAdapter.close(); //データベースを閉じる
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
        <h1>ユーザー設定</h1>

        <form name="mainForm" method="post" action="userconfig2.jsp">
            <table>
                <tr>
                    <td>ユーザー名</td>
                    <td><input type="text" name="userName" value="<%=resultData.get(0).get("name")%>"></td>
                </tr>
                <tr>
                    <td>パスワード(現在)</td>
                    <td><input type="password" name="password1"></td>
                </tr>
                <tr>
                    <td>新しいパスワード</td>
                    <td><input type="password" name="password2"></td>
                </tr>
                <tr>
                    <td>新しいパスワード(確認)</td>
                    <td><input type="password" name="password3"></td>
                </tr>
            </table>
            <input type="submit" value="変更">
        </form>

        <br>

        <a href="shift1.jsp">戻る</a>

    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <jsp:include page="footer_div.jsp"/>
    </div>
</div>
</body>
</html>

