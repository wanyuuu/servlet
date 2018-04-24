<%@ page import="com.wanyu.service.IUserService" %>
<%@ page import="com.wanyu.service.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: samsung
  Date: 2017/10/10
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<%
    IUserService service=new UserServiceImpl();
    String id=request.getParameter("id");
    if(service.del(Integer.parseInt(id))){
        response.sendRedirect("index.jsp");
    }else {
        %>
<script type="text/javascript">
    alert("删除失败!")
    window.location="index.jsp"
</script>
<%
    }
%>
