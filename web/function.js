function setAndSubmit(id) {
    //alert("dayのhiddenのvalue値を[" + id + "]に乗せ変えて遷移するよ");
    document.mainForm.day.value = id;
    document.mainForm.submit();
}
