<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="syspj.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //POSTで受けっとったデータの文字コード設定
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

    if (request.getParameter("last") != null) {
        year = month <= 1 ? year - 1 : year;
        month = month <= 1 ? 12 : month - 1;
    } else if (request.getParameter("next") != null) {
        year = month >= 12 ? year + 1 : year;
        month = month >= 12 ? 1 : month + 1;
    }

    String userID = "S001";

    JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
    dbAdapter.open(); //データベースに接続

    String sql = "select * from shift where name = '" + userID + "';"; //SQL
    String[] column = {"date", "begin", "finish"}; //取得したい列名を配列にする

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
                <th>date</th>
                <th>begin</th>
                <th>finish</th>
            </tr>
            <%
                for (HashMap<String, String> rowData : resultData) {
            %>
            <tr>
                <td><%=rowData.get("date")%>
                </td>
                <td><%=rowData.get("begin")%>
                </td>
                <td><%=rowData.get("finish")%>
                </td>
            </tr>
            <%}%>
        </table>
        <% } //if文の終わり
        %>

        <br>

        <h2><%=year%>年<%=month%>月の予定</h2>
        <form method="post" action="shift1.jsp">
            <input type="hidden" name="year" value="<%=year%>">
            <input type="hidden" name="month" value="<%=month%>">
            <input type="submit" name="last" value="<%=month<=1?12:month-1%>月へ">
            &nbsp;<%=month%>月&nbsp;
            <input type="submit" name="next" value="<%=month>=12?1:month+1%>月へ">
        </form>
        <form name="mainForm" method="post" action="shift2.jsp">
            <input type="hidden" name="year" value="<%=year%>">
            <input type="hidden" name="month" value="<%=month%>">
            <input type="hidden" name="day" value=""/>

            <table class="type11">
                <tr>
                    <th>日</th>
                    <th>月</th>
                    <th>火</th>
                    <th>水</th>
                    <th>木</th>
                    <th>金</th>
                    <th>土</th>
                </tr>
                <%
                    int[][] calendarMatrix = MonthlyCalendar.getInt(year, month);

                    for (int i = 0; i < calendarMatrix.length; i++) {
                        if (i > 0 && calendarMatrix[i][0] == 0) {
                            break;
                        }
                %>
                <tr><%
                    for (int j = 0; j < calendarMatrix[i].length; j++) {
                        int day = calendarMatrix[i][j];
                        if (day == 0) {
                %>
                    <td></td>
                    <%
                    } else {
                    %>
                    <td>
                        <div style="height: 20%; text-align: right"><a
                                href="javascript:setAndSubmit('<%=String.valueOf(day)%>')">
                            <%=String.valueOf(day)%>
                        </a>
                        </div>
                        <div style="height: 80%"></div>
                    </td>
                    <%
                            }
                        }
                    %></tr>
                <%
                    }
                %>
            </table>
        </form>

    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <hr>
        フッタ領域
    </div>
</div>
</body>
</html>

