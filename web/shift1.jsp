<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="syspj.*" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="auth.jsp" %><%--ユーザー認証--%>
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

    // セッション変数の取得
    String userID = (String) session.getAttribute("userID");

    JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
    dbAdapter.open(); //データベースに接続

    String sql = "select date_part('DAY',date) as day, begin, finish from shift " +
            "where name = '" + userID + "'" +
            " and date_part('YEAR',date) = " + year +
            " and date_part('MONTH',date) = " + month + " order by day;"; //SQL
    String[] column = {"day", "begin", "finish"}; //取得したい列名を配列にする

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
        <h3><%=userID%>でログイン中</h3>
        <%
            String authenticationAdmin = (String) session.getAttribute("permission");
            if (authenticationAdmin != null) {
                if (Integer.valueOf(authenticationAdmin) == 1) {
        %>
        <a href="useradmin.jsp">ユーザー管理</a>
        <a href="paychange.jsp">時給変更</a>
        <%
                }
            }
        %>
        <a href="pay.jsp">時給確認</a>
        <a href="userconfig1.jsp">個人設定</a>
        <a href="logout.jsp">ログアウト</a>
        <hr>
    </div>
    <div id="main">
        <%--メインコンテンツを記述する--%>
        <h1>シフト表１</h1>
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
                    <th style="color: hotpink">日</th>
                    <th>月</th>
                    <th>火</th>
                    <th>水</th>
                    <th>木</th>
                    <th>金</th>
                    <th style="color: deepskyblue">土</th>
                </tr>
                <%
                    int[][] calendarMatrix = MonthlyCalendar.getInt(year, month);

                    int resultCnt = 0;

                    for (int i = 0; i < calendarMatrix.length; i++) {
                        if (calendarMatrix[i][0] == 0) {
                            break;
                        }
                %>
                <tr><%for (int j = 0; j < calendarMatrix[i].length; j++) {%>
                    <td style="height: 90px;">
                        <%
                            int day = calendarMatrix[i][j];
                        %>
                        <div style="height: 20%; text-align: right">
                            <% if ((i == 0 && day >= 23) || (i >= 4 && day <= 6)) {
                            %>
                            <%=String.valueOf(day)%>
                            <%} else {%>
                            <a href="javascript:setAndSubmit('<%=String.valueOf(day)%>')"><%=String.valueOf(day)%>
                            </a>
                            <%}%>
                        </div>
                        <div style="height: 80%">
                            <%
                                int db_day = resultData.size() > resultCnt ? Integer.valueOf(resultData.get(resultCnt).get("day")) : -1;
                                if (day == db_day) {
                            %>
                            <%=resultData.get(resultCnt).get("begin").replaceAll(":00$", "")%>
                            〜 <%=resultData.get(resultCnt).get("finish").replaceAll(":00$", "")%>
                            <%
                                    resultCnt++;
                                }
                            %>
                        </div>
                    </td>
                    <%}%>
                </tr>
                <%}%>
            </table>
        </form>

    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <hr>
        システム創成プロジェクトI グループ3
    </div>
</div>
</body>
</html>

