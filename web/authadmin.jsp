<%
    // セッション変数がセットされていない場合はリダイレクト
    String authenticationAdmin = (String) session.getAttribute("permission");
    if (authenticationAdmin != null) {
        if (Integer.valueOf(authenticationAdmin) == 0) {
            response.sendRedirect("shift1.jsp");
        }
    }
%>
