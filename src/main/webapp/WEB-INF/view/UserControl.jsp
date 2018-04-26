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
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>

<body class="layui-layout-body">
<jsp:include page="Sidebar.jsp"/>

<div class="layui-body">
    <!-- 内容主体区域 -->
    <div>
        <button class="layui-btn layui-btn-lg" style="margin-left: 10px; margin-top: 75px"
                onclick="window.location.href='${pageContext.request.contextPath}/main/addUser?username=${user.username }'">
            新增用户
        </button>
        <button class="layui-btn layui-btn-lg layui-btn-danger" style="margin-left: 10px; margin-top: 75px"
                onclick="window.location.href='${pageContext.request.contextPath}/main/delUser?username=${user.username }'">
            删除用户
        </button>
    </div>
    <table class="layui-hide" id="userTable"></table>
</div>

<div class="layui-footer">
    <!-- 底部固定区域 -->
    <%--© layui.com - 底部固定区域--%>
</div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;
    });

</script>

<script>

    var list;

    $(function () {
        getAllLaptops();
    })

    function getAllLaptops() {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/user/getAllUser',
            data: {
                // username: $('#username').val(),
                // password: $('#password').val()
            },

            dataType: 'json',
            success: function (result) {
                if (result.code == 0) {
                    list = result.data;
                } else {
                    alert(result.msg);
                }
            }
        });
    }


    layui.use('table', function () {
        var table = layui.table;

        //展示已知数据
        table.render({
            elem: '#userTable'
            , cols: [[ //标题栏
                {field: 'username', title: '用户名', sort: true}
                , {field: 'password', title: '密码', sort: true}
                , {field: 'level', title: '等级', sort: true}
                , {field: 'mobile', title: '手机号', sort: true}
            ]]
            , data: list
            //,skin: 'line' //表格风格
            , even: true
            //,page: true //是否显示分页
            //,limits: [5, 7, 10]
            //,limit: 5 //每页默认显示的数量
        });
    });
</script>
</body>
</html>
