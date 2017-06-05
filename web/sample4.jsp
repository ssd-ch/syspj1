<%@ page import="syspj.JDBCPostgreSQL" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //POSTで受けっとったデータの文字コード設定
    request.setCharacterEncoding("UTF-8");

    //データベースのアクセスをしやすくするために自作のクラスを利用する
    JDBCPostgreSQL dbAdapter = new JDBCPostgreSQL();
    dbAdapter.open(); //データベースに接続

    String sql = "insert into pay values ('00001',950);"; //SQL(insert,delete,update)

    /*
    setというメソッドを使ってsqlを指定する,
    データは成功した件数が返ってくる,エラーが発生した場合は-1
     */
    int resultCnt = dbAdapter.set(sql);

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
        <h1>サンプルページ4</h1>
        このページではデータベースにアクセスし、データを登録します。<br>

        <%=sql%>というSQLを実行しました。<br>
        結果は<%=resultCnt%>件処理されました。

    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <hr>
        フッタ領域
    </div>
</div>
</body>
</html>

