<%
    // セッション変数がセットされていない場合はリダイレクト
    int authenticationAdmin = (int) session.getAttribute("permission");
    if (authenticationAdmin == 0) {
        response.sendRedirect("shift1.jsp");
    }
%>
