<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <style type="text/css">
        html{background: url(${pageContext.request.contextPath}/img/login-background.jpg) no-repeat 0px 0px;}
    </style>
    <meta charset="UTF-8">
    <title>数据智能监控平台-用户登入</title>
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
    <style>
        img{width:100%; height:auto;}
    </style>
</head>

<body>
<div id="loginDiv" style="height: 350px">

    <form action="${pageContext.request.contextPath}/system/user/login" method="post" id="form">
        <h1>用户登录</h1>
        <div id="loginMsg">${loginMsg}</div>

        <p>用户名:<input id="username" name="userName" type="text"></p>
        <p>密码:<input id="password" name="password" type="password"></p>
        <div id="subDiv">
            <input type="submit" class="button" value="登录">
            <input type="reset" class="button" value="重置">&nbsp;&nbsp;&nbsp;
        </div>
    </form>

</div>

</body>
</html>