<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="syspj.JDBCPostgreSQL" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="auth.jsp" %><%--ユーザー認証--%>
<%
    //POSTで受けっとったデータの文字コード設定
    request.setCharacterEncoding("UTF-8");

    String userName = request.getParameter("userName");
    String oldPassWord = request.getParameter("password1");
    String PassWord1 = request.getParameter("password2");
    String PassWord2 = request.getParameter("password3");

    String message;

    //再入力用のボタン表示フラグ
    Boolean button = false;

    //セッション変数
    String userID = (String) session.getAttribute("userID");

    JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
    dbAdapter.open(); //データベースに接続

    String sql = "select * from users where id = '" + userID + "' and pass = '" + oldPassWord + "';"; //SQL
    String[] column = {"id", "name"};

    ArrayList<HashMap<String, String>> resultData = dbAdapter.get(sql, column);

    if (userName.equals("") || PassWord1.equals("")) {
        message = "ユーザー名またはパスワードが指定されていません。";
    } else if (resultData.size() == 1 && PassWord1.equals(PassWord2)) {
        String updateSQL = "update users set name = '" + userName + "', pass = '" + PassWord1 + "' where id = '" + userID + "';";
        if (dbAdapter.set(updateSQL) == 1) {
            message = "ユーザー情報を変更しました。";
            button = true;
        } else {
            message = "ユーザー情報の変更に失敗しました。";
        }
    } else {
        message = "パスワード異なります。";
    }

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

        <p style="color: red;"><%=message%>
        </p>


        <form name="mainForm" method="post" action="userconfig1.jsp">
            <% if (button) {%>
            <table>
                <tr>
                    <td>ユーザー名</td>
                    <td><%=userName%>
                    </td>
                </tr>
                <tr>
                    <td>新しいパスワード</td>
                    <td>**************</td>
                </tr>
            </table>
            <% } else { %>
            <input type="submit" value="再入力">
            <%}%>
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


