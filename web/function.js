function setAndSubmit(id) {
    //alert("dayのhiddenのvalue値を[" + id + "]に乗せ変えて遷移するよ");
    document.mainForm.day.value = id;
    document.mainForm.submit();
}

function deleteUser(id) {
    if (window.confirm("ID : " + id + "を削除してもよろしいですか？")) {
        // エレメントを作成
        var ele = document.createElement('input');
        // データを設定
        ele.setAttribute('type', 'hidden');
        ele.setAttribute('name', 'deleteUserID');
        ele.setAttribute('value', id);
        // 要素を追加
        document.mainForm.appendChild(ele);
        return true;
    }
    else {
        return false;
    }
}

function updateAdmin(id, a) {

    // エレメントを作成
    var eleA = document.createElement('input');
    // データを設定
    eleA.setAttribute('type', 'hidden');
    eleA.setAttribute('name', 'adminStatus');
    eleA.setAttribute('value', a ? "1" : "0");
    // 要素を追加
    document.mainForm.appendChild(eleA);

    // エレメントを作成
    var ele = document.createElement('input');
    // データを設定
    ele.setAttribute('type', 'hidden');
    ele.setAttribute('name', 'updateUserID');
    ele.setAttribute('value', id);
    // 要素を追加
    document.mainForm.appendChild(ele);

    if (a) {
        if (window.confirm("ID : " + id + "に管理者権限を付与しますか？")) {
            return true;
        }
        else {
            return false;
        }
    } else {
        if (window.confirm("ID : " + id + "の管理者権限を剥奪しますか？")) {
            return true;
        }
        else {
            return false;
        }
    }
}
