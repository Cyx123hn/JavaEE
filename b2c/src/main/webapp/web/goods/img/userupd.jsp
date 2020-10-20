<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
<%@   include file="/web/header.jsp"%>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>用户维护--添加信息</legend>
		<form class="layui-form layui-form-pane" lay-filter="upduser"
			method="post">
			<div class="layui-form-item" pane>
				<label class="layui-form-label">编号：</label>
				<div class="layui-input-inline">

					<input type="text" name="goodsCode" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item" pane>
				<label class="layui-form-label">名称：</label>
				<div class="layui-input-inline">

					<input type="text" name="url" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item" pane>
				<label class="layui-form-label">类型：</label>
				<div class="layui-input-inline">

					<input type="text" name="type" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
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

init();

function init(){
	
    var code = '<%=request.getParameter("goodsCode")%>';
   
	$.ajax({
        url:con.app+'/goodsImg/selectByCode.do',
        data : {goodsCode:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	console.log(data.code);
        	console.log(data.name);
        	form.val("upduser", 
        	{goodsCode: data.goodsCode,
        		url:data.url, type:data.type 
        		
        	
        	})
            form.render();//重新渲染
//          $("input[name='usercode']").val(data.code);
//          $("input[name='username']").val(data.name);
//          $("input[name='usercode']").prop("readonly","readonly");
         
        }
    })
}
//提交修改
formSubmit('/goodsImg/update.do', 'submit(updUser)', 'json', function(data) {
	if (data == 1) {
        layer.msg('修改成功');
        closeThis(3000);
    } else {
        layer.msg('修改失败');
    }
});



</script>




</body>
</html>