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
    <title>发布商品</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
</head>

<body class="layui-layout-body"><jsp:include page="Sidebar.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>发布商品</legend>
        </fieldset>
        <form class="layui-form" >


            <div style="margin-left: 10px; margin-top: 10px; width: 600px;">
                <div class="layui-form-item">
                    <label class="layui-form-label">笔记本名称</label>
                    <div class="layui-input-block">
                        <input id='name' type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">笔记本价格</label>
                    <div class="layui-input-block">
                        <input id='price' type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">生产商</label>
                    <div class="layui-input-block">
                        <input id='producer' type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">品牌</label>
                    <div class="layui-input-block">
                        <input id='brand' type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">型号</label>
                    <div class="layui-input-block">
                        <input id='model' type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">笔记本标签</label>
                    <div id='tag' class="layui-input-block">
                        <input type="radio" name="kind" value="上网本" title="上网本">
                        <input type="radio" name="kind" value="游戏本" title="游戏本" checked="">
                        <input type="radio" name="kind" value="商务本" title="商务本">
                        <input type="radio" name="kind" value="其他" title="其他">
                    </div>
                </div>
            </div>

        </form>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn"  lay-filter="formDemo" onclick="add()">立即提交</button>
                <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
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
                url: '${pageContext.request.contextPath}/laptop/add',
                data: {
                    username: $('#username').val(),
                    name: $('#name').val(),
                    price: $('#price').val(),
                    producer: $('#producer').val(),
                    brand: $('#brand').val(),
                    model: $('#model').val(),
                    tag: $('input:radio[name="kind"]:checked').val()

                },

                dataType: 'json',
                success: function (result) {
                    // alert(result.data);
                    window.location.href = '${pageContext.request.contextPath}/main/index?username=${user.username}';

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
