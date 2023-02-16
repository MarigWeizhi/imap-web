<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <style type="text/css">
        html{background: url(${pageContext.request.contextPath}/img/login-background.jpg) no-repeat 0px 0px;}
    </style>
    <meta charset="UTF-8">
    <title>数据智能监控系统-用户登入</title>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
    <style>
        img{width:100%; height:auto;}
    </style>
</head>

<body>
<div id="loginDiv" style="height: 350px">

    <form action="${pageContext.request.contextPath}/system/user/login" method="post" id="form">
        <h1>LOGIN IN</h1>
        <div id="loginMsg">${loginMsg}</div>

        <p>Username:<input id="username" name="userName" type="text"></p>
        <p>Password:<input id="password" name="password" type="password"></p>
        <p>Remember:<input id="remember" name="remember" type="checkbox"></p>
        <div id="subDiv">
            <input type="submit" class="button" value="login up">
            <input type="reset" class="button" value="reset">&nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}register.jsp">没有账号？</a>
        </div>
    </form>

</div>

</body>
</html>