<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="syspj.JDBCPostgreSQL" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="auth.jsp" %><%--ユーザー認証--%>
<%
    //POSTで受けっとったデータの文字コード設定
    request.setCharacterEncoding("UTF-8");

    JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
    dbAdapter.open(); //データベースに接続

    String deleteUserID = request.getParameter("deleteUserID");
    String adminStatus = request.getParameter("adminStatus");

    if (deleteUserID != null) {
        String deleteSQL = "delete from users where id = '" + deleteUserID + "';";
        dbAdapter.set(deleteSQL);
    }
    else if (adminStatus !=null){
        String updateUserID = request.getParameter("updateUserID");
        String updateSQL = "update users set permission = "+ adminStatus +" where id = '" + updateUserID + "';";
        dbAdapter.set(updateSQL);
    }

    String sql = "select * from users order by id";
    String[] column = {"id", "name", "permission"};

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
        ヘッダ領域
        <hr>
    </div>
    <div id="main">
        <%--メインコンテンツを記述する--%>
        <h1>ユーザー管理</h1>

        <br>
        <form method="post" action="user.html">
            <input type="submit" value="ユーザーを追加する">
        </form>

        <br>

        <form name="mainForm" method="post" action="useradmin.jsp">
            <table class="type11">
                <tr>
                    <th>ID</th>
                    <th>ユーザー名</th>
                    <th colspan="2">管理者権限</th>
                    <th>削除</th>
                </tr>
                <%
                    for (HashMap<String, String> rowData : resultData) {
                        int userStatus = Integer.valueOf(rowData.get("permission"));
                %>
                <tr style="height: 30px;">
                    <td><%=rowData.get("id")%>
                    </td>
                    <td><%=rowData.get("name")%>
                    </td>
                    <td><%=userStatus == 1 ? "あり" : "なし"%>
                    </td>
                    <td><input type="submit" value="変更" onclick="return updateAdmin('<%=rowData.get("id")%>',<%= userStatus == 1 ? "false" : "true" %>)">
                    </td>
                    <td><input type="submit" value="削除" onclick="return deleteUser('<%=rowData.get("id")%>')">
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </form>

        <br>

        <a href="shift1.jsp">戻る</a>

    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <hr>
        フッタ領域
    </div>
</div>
</body>
</html>

