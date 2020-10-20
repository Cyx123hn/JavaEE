<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加</title>
</head>
<body>
<%@   include file="/web/header.jsp"%>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 20px; padding: 15px;">
		<legend>订单维护--添加信息</legend>
		<form class="layui-form layui-form-pane" 
			>
					
		<div class="layui-form-item">
		<label class="layui-form-label">编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="code" size="20" maxlength="6"
					class="layui-input" />
			</div>
			</div>
			<div class="layui-form-item">
			<label class="layui-form-label">用户编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="userCode" size="20" maxlength="6"
					class="layui-input" />
			</div>
			</div>
			<div class="layui-form-item">
			<label class="layui-form-label">订单时间：</label>
			<div class="layui-input-inline">
				<input id="test1"  type="text" name="entryTime1" size="20" maxlength="6"
					class="layui-input" />
			</div>
			<div class="layui-form-item">
			<label class="layui-form-label">收货地址：</label>
			<div class="layui-input-inline">
				<input type="text" name="typeCode" size="20" maxlength="6"
					class="layui-input" />
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
					<input type="button" class="layui-btn" lay-submit lay-filter="add"
						value="确定" /> <input type="button" class="layui-btn"
						onclick="closeThis()" value="取消" />
				</div>
			</div>
		</form>
	</fieldset>	
<script>				
	form.render();//渲染
		
		    form.on('submit(add)', function(data){
			  		    
			  console.log(data) //被执行事件的元素DOM对象，一般为button对象
			  $.ajax({
					type:"post",
					url:con.app+"/order/add.do",
					dataType:"json",  
			    	data:data.field, //data发送到服务器
				   
					success: function (data) {
						if(data==0){
							layer.msg("注册成功");
							closeThis(2000);
						}else if(data==1){
							layer.msg("账号已存在");
						}else{
							layer.msg("注册失败");
						}
					}			
				});   	 
			});
</script>
<script>
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