<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/19
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>增加用户</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
</head>

<body class="layui-layout-body"><jsp:include page="Sidebar.jsp"/>

<div class="layui-body">
    <!-- 内容主体区域 -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>增加用户</legend>
    </fieldset>
    <form class="layui-form" >


        <div style="margin-left: 10px; margin-top: 10px; width: 600px;">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input id='username' type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input id='password' type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input id='mobile' type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">等级</label>
                <div id='level' class="layui-input-block">
                    <input type="radio" name="kind" value="1" title="1">
                    <input type="radio" name="kind" value="2" title="2">
                    <input type="radio" name="kind" value="3" title="3" checked="">
                </div>
            </div>
        </div>

    </form>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn"  lay-filter="formDemo" onclick="add()">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</div>


<div class="layui-footer">
    <!-- 底部固定区域 -->
    <%--© layui.com - 底部固定区域--%>
</div>
</div>


<script>
    function add() {
        $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/user/addUser',
                data: {
                    username: $('#username').val(),
                    password: $('#password').val(),
                    mobile: $('#mobile').val(),
                    level: $('input:radio[name="kind"]:checked').val()

                },

                dataType: 'json',
                success: function (result) {
                    if(result.code==0){
                        window.location.href = '${pageContext.request.contextPath}/main/userControl?username=${user.username}';
                    }else{
                        alert(result.data);
                    }

                }
            }
        );
    }

</script>
<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
    })
</script>
</body>
</html>
