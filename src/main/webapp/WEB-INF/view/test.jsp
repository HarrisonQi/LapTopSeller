<%--
  Created by IntelliJ IDEA.
  User: HarrisonQI
  Date: 2018/4/25
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
</head>
<body>
<jsp:include page="Sidebar.jsp"/>
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

</body>
</html>
