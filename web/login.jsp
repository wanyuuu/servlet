<%--
  Created by IntelliJ IDEA.
  User: samsung
  Date: 2017/10/14
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        session.invalidate();
    %>
    <script>
        window.location="user?action=queryall";
    </script>
</body>
</html>
