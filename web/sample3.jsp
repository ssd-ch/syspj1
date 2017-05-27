<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="syspj.JDBCPostgreSQL" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //これはPOSTで受けっとったデータの文字コード設定
    request.setCharacterEncoding("UTF-8");

    //データベースのアクセスをしやすくするために自作のクラスを利用する
    JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
    dbAdapter.open(); //データベースに接続

    String sql = "select * from users;"; //SQL
    String[] column = {"id", "name", "mail"}; //取得したい列名を配列にする

    /*
    sqlと取得する列名を指定してデータを取得する,
    データはHashMapを値とするArrayListオブジェクトが帰ってくる,エラーが発生した場合はNULL
     */
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
        <h1>サンプルページ3</h1>
        このページではデータベースにアクセスし、データを取得します。

        <br>
        <%
            if (resultData.size() > 0) {
        %>
        <table border="1">
            <tr>
                <th>id</th>
                <th>name</th>
                <th>mail</th>
            </tr>
            <%
                for (HashMap<String, String> rowData : resultData) {
            %>
            <tr>
                <td><%=rowData.get("id")%>
                </td>
                <td><%=rowData.get("name")%>
                </td>
                <td><%=rowData.get("mail")%>
                </td>
            </tr>
            <%}%>
        </table>
        <% } //if文の終わり
        %>

    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <hr>
        フッタ領域
    </div>
</div>
</body>
</html>

