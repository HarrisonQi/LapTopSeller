<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/19
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>
<body>
<div class="layui-body">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input id="username" type="text" name="" required lay-verify="required" placeholder="请输入用户名"
                       autocomplete="off"
                       class="layui-input"/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input id="password" type="password" name="" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input"/>
            </div>
            <%--<div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
        </div>
        <div><span id="hintText" style="color: red"></span></div>

    </form>
    <div>
        <button class="layui-btn" lay-submit lay-filter="formDemo" onclick="login()">立即提交</button>
    </div>
</div>

<script type="text/javascript">


    function login() {

        if ($('#username').val() == '' || $('#username').val() == null) {
            $('#hintText').text("用户名不能为空！");
            return;
        }
        if ($('#password').val() == '' || $('#password').val() == null) {
            $('#hintText').text("密码不能为空！");
            return;
        }
        $('#hintText').text("");

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/login',
            data: {
                username: $('#username').val(),
                password: $('#password').val()
            },

            dataType: 'json',
            success: function (result) {
                if (result.code == 0) {
                    window.location.href = '${pageContext.request.contextPath}/main/index?username=' + result.data.username;
                } else {
                    $('#hintText').text(result.msg);
                }
            }
        });
    }
</script>


</body>
</html>
