<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
<%@   include file="/web/header.jsp"%>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>商品类型维护--添加信息</legend>
		<form class="layui-form layui-form-pane" lay-filter="upduser"
			method="post">			
			<div class="layui-form-item" >
				<label class="layui-form-label">订单编号：</label>
				<div class="layui-input-inline">

					<input type="text" name="orderCode" readonly="readonly" required lay-verify="required"
						placeholder="请输入账号" autocomplete="off" value="${user.userCode}" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" >
				<label class="layui-form-label">商品编号：</label>
				<div class="layui-input-inline">

					<input type="text" name="goodsCode" readonly="readonly" required lay-verify="required"
						placeholder="请输入账号" autocomplete="off" value="${user.goodsCode}" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item" pane>
				<label class="layui-form-label">数量：</label>
				<div class="layui-input-inline">

					<input type="text" name="num" required lay-verify="required"
					 value="${user.num}"	placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			
            <div class="layui-form-item" pane>
				<label class="layui-form-label">小计：</label>
				<div class="layui-input-inline">

					<input type="text" name="price" required lay-verify="required"
					value="${user.price}"	placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
		




			<div class="layui-form-item" pane>
				<label class="layui-form-label"></label>
				<div class="layui-input-inline">
					<input type="button" class="layui-btn" lay-submit lay-filter="updUser"
						value="确定" /> <input type="button" class="layui-btn"
						onclick="closeThis()" value="取消" />
				</div>
			</div>
			
		</form>
	</fieldset>

<script type="text/javascript">

//提交修改
formSubmit('/orderGoods/update.do', 'submit(updUser)', 'json', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});


</script>

<script type="text/javascript">

form.render();

</script>
</body>
</html>