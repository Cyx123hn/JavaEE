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
		<legend>维护--修改信息</legend>
		<form class="layui-form layui-form-pane" lay-filter="upduser"
			method="post">			
			<div class="layui-form-item">
		<label class="layui-form-label">编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="code" size="20" maxlength="6"
				 required lay-verify="required"  readonly="readonly"	class="layui-input" value="${user.code}" />
			</div>
			</div>
			<div class="layui-form-item">
			<label class="layui-form-label">用户编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="userCode" size="20" maxlength="6"
				 required lay-verify="required" readonly="readonly"	class="layui-input" value="${user.userCode}" />
			
			</div>
			</div>
			<div class="layui-form-item">
			<label class="layui-form-label">订单时间：</label>
			<div class="layui-input-inline">
				<input id="test1"  type="text" name="entryTime1" size="20" maxlength="6"
					class="layui-input"   readonly="readonly" value="${user.entryTime}"/>
			</div>
			<div class="layui-form-item">
			<label class="layui-form-label">收货地址：</label>
			<div class="layui-input-inline">
				<input type="text" name="typeCode" size="20" maxlength="100"
					class="layui-input" value="${user.typeCode}" />
			</div>
			</div>
			</div>
			<div class="layui-form-item">
			<label class="layui-form-label">状态：</label>
			<div class="layui-input-inline">
				<select name="state">
				<option>未发货</option>
				<option>已发货</option>
				<option>未付款</option>
				</select>
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
formSubmit('/order/update.do', 'submit(updUser)', 'json', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});


</script>

<script type="text/javascript">
init()
function init(){
	
	$("select[name='entryTime1']").val("${user.entryTime}");
};


form.render();

</script>
<script type="text/javascript">
layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  
	  //执行一个laydate实例
	  laydate.render({
	  elem: '#test1'
	,format:  'yyyy-MM-dd HH:mm:ss'
	  ,change: function(value, date){ //监听日期被切换
	    lay('#test1').val(value);
	  }
	});
	});

</script>

</body>
</html>