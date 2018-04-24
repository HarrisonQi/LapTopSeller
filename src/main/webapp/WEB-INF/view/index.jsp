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
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">
            <%--<i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe68e;</i>--%>
            <a style="color: #5FB878; font-size: large"
               href="${pageContext.request.contextPath}/main/index?username=${user.username }">笔记本销售后台管理</a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <c:if test="${user.level==1}">
                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath}/main/authorityControl?username=${user.username }">权限控制</a>
                </li>
            </c:if>
            <li class="layui-nav-item"><a
                    href="${pageContext.request.contextPath}/main/commodityControl?username=${user.username }">商品管理</a>
            </li>
            <li class="layui-nav-item"><a
                    href="${pageContext.request.contextPath}/main/userControl?username=${user.username }">用户管理</a></li>
            <li class="layui-nav-item"><a
                    href="${pageContext.request.contextPath}/main/orderControl?username=${user.username }">订单交易管理</a>
            </li>
            <%--<li class="layui-nav-item">--%>
            <%--<a href="javascript:;">其它系统</a>--%>
            <%--<dl class="layui-nav-child">--%>
            <%--<dd><a href="">邮件管理</a></dd>--%>
            <%--<dd><a href="">消息管理</a></dd>--%>
            <%--<dd><a href="">授权管理</a></dd>--%>
            <%--</dl>--%>
            <%--</li>--%>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="font-size: larger">
                    <%--<img src="http://t.cn/RCzsdCq" class="layui-nav-img">--%>
                    ${user.username}
                </a>
                <dl class="layui-nav-child">
                    <%--<dd><a href="">基本资料</a></dd>--%>
                    <dd><a href="${pageContext.request.contextPath}/main/securitySettings?username=${user.username }">安全设置</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/main/login" onclick="logout()">退出</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">游戏本</a></dd>
                        <dd><a href="javascript:;">商务本</a></dd>
                        <dd><a href="javascript:;">上网本</a></dd>
                        <%--<dd><a href="">超链接</a></dd>--%>
                    </dl>
                </li>
                <%--<li class="layui-nav-item">--%>
                <%--<a href="javascript:;">解决方案</a>--%>
                <%--<dl class="layui-nav-child">--%>
                <%--<dd><a href="javascript:;">列表一</a></dd>--%>
                <%--<dd><a href="javascript:;">列表二</a></dd>--%>
                <%--<dd><a href="">超链接</a></dd>--%>
                <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item"><a href="">云市场</a></li>--%>
                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath}/main/uploadCommodity?username=${user.username }">发布商品</a>
                </li>
                <li class="layui-nav-item"><a
                        href="${pageContext.request.contextPath}/main/securitySettings?username=${user.username }">安全设置</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <%--<div style="padding: 15px;">商品列表:</div>--%>
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>商品列表</legend>
        </fieldset>
        <div>
            <button class="layui-btn layui-btn-lg" style="margin-left: 10px; margin-top: 10px"
                    onclick="window.location.href='${pageContext.request.contextPath}/main/uploadCommodity?username=${user.username }'">
                发布商品
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

    function logout() {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/logout',
            data: {
                username: $('#username').val()
            },

            dataType: 'json',
            success: function () {

                window.location.href = '${pageContext.request.contextPath}/main/login';

            }
        });
    }
</script>
<script>

    var list;

    $(function () {
        getAllLaptops();
    })

    function getAllLaptops() {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/laptop/getAll',
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
            elem: '#demo'
            , cols: [[ //标题栏
                {field: 'id', title: 'ID', sort: true}
                , {field: 'name', title: '电脑名称', sort: true}
                , {field: 'price', title: '价格', sort: true}
                , {field: 'producer', title: '生产商', sort: true}
                , {field: 'brand', title: '品牌', sort: true}
                , {field: 'model', title: '型号', sort: true}
                , {field: 'tag', title: '标签', sort: true}
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
