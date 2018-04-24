<%@ page import="com.wanyu.service.IUserService" %>
<%@ page import="com.wanyu.service.UserServiceImpl" %>
<%@ page import="com.wanyu.vo.User" %>
<%@ page import="java.util.*" %>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head >
    <title>易圣通课堂练习</title>
    <meta charset="utf-8">
    <style>
        .username.ng-valid {
            background-color: lightgreen;
        }
        .username.ng-dirty.ng-invalid-required {
            background-color: red;
        }
        .username.ng-dirty.ng-invalid-minlength {
            background-color: yellow;
        }

        .email.ng-valid {
            background-color: lightgreen;
        }
        .email.ng-dirty.ng-invalid-required {
            background-color: red;
        }
        .email.ng-dirty.ng-invalid-email {
            background-color: yellow;
        }

    </style>
    <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
    <script>
        $(function () {
            $("#form1").submit(function () {
                var username=$("#username").val();
                var password=$("#password").val();
                if(username==""){
                    $("#uerror").html("您的用户名为空");
                }else {
                    $("#uerror").html("");
                }
                if(password==""){
                    $("#perror").html("您的密码为空");
                }else {
                    $("#perror").html("");
                }
                if(username==""||password==""){
                    return false;
                }
            });
            $("#rst").click(function () {
                $("#username").val('');
                $("#password").val('');
                $("#perror").html('');
                $("#uerror").html('');
            })
        })
    </script>

    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link href="css/app.css" rel="stylesheet"/>
</head>
<body>
<jsp:useBean id="service" class="com.wanyu.service.UserServiceImpl"/>
<div class="generic-container" >
    <div class="panel panel-default" >
        <div class="panel-heading"><span class="lead">注册用户 </span>
            <span class="lead">${requestScope.msg==null?requestScope.msg:""}</span>
        </div>
        <div class="panel-heading"><span class="lead">在线人数 </span>
            <span class="lead"><%=service.online()%></span>
            <a href="login.jsp">注销</a>
    </div>

            <div class="formcontainer">

            <form  name="myForm" class="form-horizontal" id="form1"
                   action="user"
                   method="post">
                <%--<%--%>
                    <%--User u=(User) request.getAttribute("user");--%>
                <%--%>--%>
                    <c:set var="u" value="${requestScope.user}"/>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable">姓名</label>
                        <div class="col-md-7">
                            <%--<input type="hidden" name="action"--%>
                                   <%--value="<%=u==null?"add":"edit"%>"/>--%>
                                <input type="hidden" name="action"
                                       value="${u==null?"add":"edit"}"/>
                            <%--<input type="hidden" name="id"--%>
                                   <%--value="<%=u!=null?u.getId():""%>"/>--%>
                                <input type="hidden" name="id"
                                       value="${u!=null?u.id:""}"/>
                            <%--<input type="text" name="username" id="username"--%>
                                   <%--value="<%=u!=null?u.getUsername():""%>"--%>
                                   <%--class="username form-control input-sm"--%>
                                   <%--placeholder="输入你的姓名"/>--%>
                                <input type="text" name="username" id="username"
                                       value="${u!=null?u.username:""}"
                                       class="username form-control input-sm"
                                        placeholder="输入你的姓名"/>
                            <div class="has-error">
                                <span id="uerror"></span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="col-md-2 control-lable" >密码</label>
                        <div class="col-md-7">
                            <%--<input type="text" name="password" id="password"--%>
                                   <%--value="<%=u!=null?u.getPassword():""%>"--%>
                                   <%--class="password form-control input-sm"--%>
                                   <%--placeholder="输入你的密码"--%>
                            <%--/>--%>
                                <input type="text" name="password" id="password"
                                       value="${u!=null?u.password:""}"
                                       class="password form-control input-sm"
                                       placeholder="输入你的密码"
                                />
                            <div class="has-error" >
                                <span id="perror"></span>

                            </div>
                        </div>
                    </div>
                </div>



                <div class="row">
                    <div class="form-actions floatRight">
                        <input type="submit" id="add"
                               value="提交"
                               class="btn btn-primary btn-sm"
                        >
                        <button type="button" id="rst"
                                class="btn btn-warning btn-sm">复原</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">用户列表 </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID.</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>

                <%--<%--%>
                    <%--int i=0;--%>
                    <%--List<User> list=(List<User>) request.getAttribute("list");--%>
                    <%--Iterator<User> it=list.iterator();--%>
                    <%--while(it.hasNext()){--%>
                        <%--User u1=it.next();--%>

                <%--%>--%>
                <c:forEach items="${requestScope.list}" var="u1" varStatus="status" >
                <tr>
                    <td>
                        ${status.count}
                    </td>
                    <td>
                        ${u1.username}
                    </td>
                    <td>
                        ${u1.password}
                    </td>
                    <td>
                        <a href="user?action=queryid&&id=${u1.id}"  class="btn btn-success custom-width">编辑</a>
                        <a href="user?action=del&&id=${u1.id}"  class="btn btn-danger custom-width">删除</a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
</html>