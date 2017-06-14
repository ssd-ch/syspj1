<%@ page import="syspj.JDBCPostgreSQL" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // セッション変数がセットされている場合はリダイレクト
    if (session.getAttribute("userID") != null) {
        response.sendRedirect("shift1.jsp");
    }

    //フォームに入力されたIDを取得
    request.setCharacterEncoding("UTF-8");
    String requestUserID = request.getParameter("userID");
    String requestPassword = request.getParameter("password");

    String message = "";

    if (requestUserID != null) {
        JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
        dbAdapter.open(); //データベースに接続

        String sql = "select * from users where id = '" + requestUserID + "' and pass = '" + requestPassword + "';"; //SQL
        String[] column = {"id", "name", "permission"}; //取得したい列名を配列にする

        ArrayList<HashMap<String, String>> resultData = dbAdapter.get(sql, column);

        if (resultData.size() == 1) {
            session.setAttribute("userID", resultData.get(0).get("id"));
            session.setAttribute("userName", resultData.get(0).get("name"));
            System.out.println(resultData.get(0).get("permission"));
            session.setAttribute("permission", Integer.valueOf(resultData.get(0).get("permission")));
            response.sendRedirect("shift1.jsp");
        } else {
            message = "IDまたはパスワードが違います。";
        }

        dbAdapter.close(); //データベースを閉じる
    } else {
        requestUserID = "";
    }
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
        <h1>ログインページ</h1>

        <p style="color: red"><%=message%>
        </p>

        <form method="post" action="login.jsp">

            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="userID" value="<%=requestUserID%>"></td>
                </tr>
                <tr>
                    <td>パスワード</td>
                    <td><input type="password" name="password"></td>
                </tr>
            </table>

            <input type="submit" value="ログイン">
            <br><br>
        </form>
    </div>
    <div id="footer">
        <hr>
    </div>
</div>
</body>
</html>

