<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="syspj.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //これはPOSTで受けっとったデータの文字コード設定
    request.setCharacterEncoding("UTF-8");

    int year = Calendar.getInstance().get(Calendar.YEAR);
    String yearStr = request.getParameter("year");
    if (yearStr != null) {
        year = Integer.valueOf(yearStr);
    }

    int month = Calendar.getInstance().get(Calendar.MONTH) + 1;
    String monthStr = request.getParameter("month");
    if (monthStr != null) {
        month = Integer.valueOf(monthStr);
    }

    JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
    dbAdapter.open(); //データベースに接続

    String sql = "select * from users;"; //SQL
    String[] column = {"id", "name", "mail"}; //取得したい列名を配列にする

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
        <h1>シフト表１</h1>
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

        <br>

        <h2><%=year%>年<%=month%>月の予定</h2>
        <form method="post" action="shift1.jsp">
            <input type="hidden" name="year" value="<%=month<=1?year-1:year%>">
            <input type="hidden" name="month" value="<%=month<=1?12:month-1%>">
            <input type="submit" name="button" value="<%=month<=1?12:month-1%>月へ">
        </form>
        <form method="post" action="shift1.jsp">
            <input type="hidden" name="year" value="<%=month>=12?year+1:year%>">
            <input type="hidden" name="month" value="<%=month>=12?1:month+1%>">
            <input type="submit" name="button" value="<%=month>=12?1:month+1%>月へ">
        </form>
        <%=new MonthlyCalendar(year, month)%>

    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <hr>
        フッタ領域
    </div>
</div>
</body>
</html>

