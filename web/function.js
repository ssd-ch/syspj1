function setAndSubmit(id) {
    //alert("dayのhiddenのvalue値を[" + id + "]に乗せ変えて遷移するよ");
    document.mainForm.day.value = id;
    document.mainForm.submit();
}

function deleteUser(id) {
    if (window.confirm("id : " + id + "を削除してもよろしいですか？")) {
        // エレメントを作成
        var ele = document.createElement('input');
        // データを設定
        ele.setAttribute('type', 'hidden');
        ele.setAttribute('name', 'userID');
        ele.setAttribute('value', id);
        // 要素を追加
        document.mainForm.appendChild(ele);
        return true;
    }
    else{
        return false;
    }

}
