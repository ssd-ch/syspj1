<%--jspでのコメント文はこのタグで囲う(こっちはJavaプログラムのコメントなのでブラウザのソース表示では見れない)--%>
<!--htmlでのコメント文はこのタグで囲う(こっちはhtmlのコメントなのでブラウザのソース表示で見れる)-->
<%--この下の行のやつはjspのコードの設定なので特にいじる必要はない--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<%--headタグの情報はほとんど共通なので別のファイルにしてインクルードするようにする--%>
<jsp:include page="head_meta.html"/>
<body>
<%--bodyタグの中に実際に表示する内容を記述する--%>
<%--
divタグは領域を指定するためのタグでcssとかで使うので最初のうちから分けとく
例えば、idがheaderの背景色は青で、idがfooterの文字の色は緑にするとかできるようになる
このページの装飾の設定はcssファイルに記述する,cssファイルの読み込みの設定は上でインクルードしたhead_meta.htmlに記述している
--%>
<div id="container">
    <div id="header">
        <%--body内でのヘッダ部分を記述する--%>
        ヘッダ領域
        <hr>
        <%--線を引く--%>
    </div>
    <div id="main">
        <%--メインコンテンツを記述する--%>
        <h1>サンプルページ1</h1>

        <%--
        formはデータを入力してもらってボタンなどで次のページに移動してもらいたい時に使う
        methodは基本POSTにする(GETはURLに情報が載ってしまう)
        actionに遷移先のページ名を指定する
        --%>
        <form method="post" action="sample2.jsp">

            <h3>テキストボックス</h3>
            <input type="text" name="color" placeholder="検索ワードを入力" >

            <br>

            <h3>チェックボックス</h3>
            <input type="checkbox" name="fruit" value="りんご">りんご
            <input type="checkbox" name="fruit" value="みかん">みかん
            <input type="checkbox" name="fruit" value="バナナ">バナナ

            <br>

            <h3>ラジオボタン</h3>
            <input type="radio" name="place" value="島根" checked="checked">島根
            <input type="radio" name="place" value="東京">東京
            <input type="radio" name="place" value="大阪">大阪

            <br>

            <h3>メニュー</h3>
            <select name="sports">
                <option value="野球">野球</option>
                <option value="サッカー">サッカー</option>
                <option value="テニス">テニス</option>
            </select>

            <br>
            <br>

            <%--hiddenは隠しデータでformの中に記述しておけばユーザーの操作に関係なく値をやり取りできる。--%>
            <%--ただ、htmlのソースを見るとわかってしまう--%>
            <input type="hidden" name="mode" value="good">

            <%--リセットボタンはページを読み込んだ時の状態に戻す,値がクリアになるわけではないことに注意--%>
            <input type="reset" value="リセット">

            <input type="submit" name="button" value="移動ボタン">
            <br>

            移動ボタンを押すとページが移動します
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
