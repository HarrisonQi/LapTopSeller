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
    <title>订单管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>

<jsp:include page="Sidebar.jsp"/>

<div class="layui-body">
    <!-- 内容主体区域 -->
    <%--<div style="padding: 15px;">商品列表:</div>--%>
    <%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">--%>
    <%--<legend>商品列表</legend>--%>
    <%--</fieldset>--%>
    <div>
        <button class="layui-btn layui-btn-lg" style="margin-left: 10px; margin-top: 75px"
                onclick="window.location.href='${pageContext.request.contextPath}/main/addOrder?username=${user.username}'">
            新增订单
        </button>
    </div>
    <table class="layui-hide" id="demo"></table>
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
            url: '${pageContext.request.contextPath}/order/getAllRelation',
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
            elem: '#demo'
            , cols: [[ //标题栏
                {field: 'name', title: '笔记本名称', sort: true}
                , {field: 'brand', title: '品牌', sort: true}
                , {field: 'model', title: '型号', sort: true}
                , {field: 'mount', title: '数量', sort: true}
                , {field: 'price', title: '价格', sort: true}
                , {field: 'totalPrice', title: '总价', sort: true}
                , {field: 'time', title: '成交时间', sort: true}
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
