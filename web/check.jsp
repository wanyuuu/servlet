<%--
  Created by IntelliJ IDEA.
  User: samsung
  Date: 2017/10/10
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="com.wanyu.vo.User,com.wanyu.service.IUserService" %>
<%@ page import="com.wanyu.service.UserServiceImpl" %>
<%
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String id=request.getParameter("id");
    User u=new User();
    u.setUsername(username);
    u.setPassword(password);
    IUserService service=new UserServiceImpl();
    if(service.queryByName(username)){
        %>
    <script type="text/javascript">
        alert('有重复的用户名')
        window.location="index.jsp"
    </script>
<%
        return ;
    }
    if(id!=""){//修改
        u.setId(Integer.parseInt(id));
        if(service.update(u)){
            %>
<script type="text/javascript">
    alert('编辑成功')
    window.location="index.jsp"
</script>
<%
        }else {
            %>
<script type="text/javascript">
    alert('编辑失败')
    window.location="index.jsp"
</script>
<%
        }
    }else {
    if(service.add(u)){
        %>
<script type="text/javascript">
    alert('注册成功')
    window.location="index.jsp"
</script>
<%
    }else {
        %>
<script type="text/javascript">
    alert('注册失败')
    window.location="index.jsp"
</script>
<%
    }
    }
%>