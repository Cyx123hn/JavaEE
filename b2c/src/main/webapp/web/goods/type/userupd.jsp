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
			<div class="layui-form-item" pane>
				<label class="layui-form-label">编号：</label>
				<div class="layui-input-inline">

					<input type="text" name="code" readonly="readonly" required lay-verify="required"
						placeholder="请输入账号" autocomplete="off" value="${user.code}" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item" pane>
				<label class="layui-form-label">名称：</label>
				<div class="layui-input-inline">

					<input type="text" name="name" required lay-verify="required"
					 value="${user.name}"	placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
			
            <div class="layui-form-item" pane>
				<label class="layui-form-label">描述：</label>
				<div class="layui-input-inline">

					<input type="text" name="descr" required lay-verify="required"
					value="${user.descr}"	placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
		
           <div class="layui-form-item" pane>
				<label class="layui-form-label">所属分类：</label>
				<div class="layui-input-inline">
					<select name="parentcode" >

                     <c:forEach items="${list}" var="W" varStatus="WW">
                      <option  value="${W.code}">${W.name}</option>
                             
                   </c:forEach>

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
formSubmit('/goodsType/update.do', 'submit(updUser)', 'json', function(data) {
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
	
	$("select[name='parentcode']").val("${user.parentcode}");
};
form.render();

</script>
</body>
</html>