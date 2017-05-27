<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
        <h1>サンプルページ2</h1>
        <%--
        postで受け取った値はrequest.getParameter("inputのnameで指定した名前")で取得できる
        <%= %>はjspで変数の中身のみ出力したい時に便利
        --%>
        <h3>テキストボックス</h3>
        <%--<input type="text" name="color" placeholder="検索ワードを入力" >--%>
        変数colorには「<%=request.getParameter("color")%>」が格納されています

        <br>

        <h3>チェックボックス</h3>
        <%--<input type="checkbox" name="fruit" value="りんご">りんご--%>
        <%--<input type="checkbox" name="fruit" value="みかん">みかん--%>
        <%--<input type="checkbox" name="fruit" value="バナナ">バナナ--%>

        <%
            //変数fruitはチェックボックスなので複数の値が選択される可能性があるので文字列配列として処理する
            String[] fruits = request.getParameterValues("fruit");
            if (fruits != null) { //値が一つも選択されていない場合はnullでエラーになるので
                for (int i = 0; i < fruits.length; i++) {
        %>
        配列fruitの<%=i%>番目には「<%=fruits[i]%>」が格納されています<br>
        <% }
        } else {%>
        配列fruitは空です<br>
        <%}%>

        <h3>ラジオボタン</h3>
        <%--<input type="radio" name="place" value="島根" checked="checked">島根--%>
        <%--<input type="radio" name="place" value="東京">東京--%>
        <%--<input type="radio" name="place" value="大阪">大阪--%>
        変数placeには「<%=request.getParameter("place")%>」が格納されています

        <br>

        <h3>メニュー</h3>
        <%--<select name="sports">--%>
        <%--<option value="野球">野球</option>--%>
        <%--<option value="サッカー">サッカー</option>--%>
        <%--<option value="テニス">テニス</option>--%>
        <%--</select>--%>

        変数sportsには「<%=request.getParameter("sports")%>」が格納されています

        <br>
        <br>

        <%--<input type="hidden" name="mode" value="good">--%>
        変数modeには「<%=request.getParameter("mode")%>」が格納されています

        <br>

        <%--<input type="submit" name="button" value="移動ボタン">--%>
        <%--ボタンにも変数と値を設定できる--%>
        変数buttonには「<%=request.getParameter("button")%>」が格納されています
        <br>

        <br>

        <%--aタグはリンクでformとは違いデータの受け渡しはせず、遷移のみ行う--%>
        <a href="sample1.jsp">戻る</a>
    </div>
    <div id="footer">
        <%--ページのフッタ情報を記述する--%>
        <hr>
        フッタ領域
    </div>
</div>
</body>
</html>
