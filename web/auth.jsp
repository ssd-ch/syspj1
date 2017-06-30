<%
    // セッション変数がセットされていない場合はリダイレクト
    String authentication = (String) session.getAttribute("userID");
    if (authentication == null) {
        application.getRequestDispatcher("/login.jsp").forward(request, response);
    }
%>
