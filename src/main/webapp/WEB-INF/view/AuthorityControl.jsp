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
    <title>权限控制</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>

<body class="layui-layout-body">
<jsp:include page="Sidebar.jsp"/>

<div class="layui-body">
    <!-- 内容主体区域 -->
    <%--<div style="padding: 15px;">内容主体区域</div>--%>
    <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 75px;">--%>
        <%--<legend>权限控制</legend>--%>
    <%--</fieldset>--%>
    <div style="margin-left: 10px">
        <button style="margin-top: 75px;"class="layui-btn layui-btn-lg layui-btn-normal"
                onclick="window.location.href='${pageContext.request.contextPath}/main/updateUserLevel?username=${user.username }'">
            编辑
        </button>
    </div>

    <table class="layui-hide" id="userTable"></table>


</div>


<div class="layui-footer">
    <!-- 底部固定区域 -->
</div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<%--<script type="text/html" id="barDemo">--%>
<%--<div class="layui-form-item">--%>
<%--<div id="tag">--%>
<%--<input type="radio" name="kind" value="1" title="1">--%>
<%--<input type="radio" name="kind" value="2" title="2">--%>
<%--<input type="radio" name="kind" value="3" title="3">--%>
<%--</div>--%>
<%--</div>--%>
<%--</script>--%>
<script>

    var list;

    $(function () {
        getAllUsers();
    })

    function getAllUsers() {
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
                    $('#hintText').text(result.msg);
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
                , {field: 'level', title: '等级', sort: true}
                // , {field: 'right', title: '操作', toolbar: "#barDemo"}
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
