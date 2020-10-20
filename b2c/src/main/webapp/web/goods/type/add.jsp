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
		<legend>用户维护--添加信息</legend>
		<form class="layui-form layui-form-pane" 
			>
		
			<div class="layui-form-item" pane>
				<label class="layui-form-label">所属分类：</label>
				<div class="layui-input-inline">
					<select name="parentcode">

					</select>
				</div>
			</div>
			
			
			
			<div class="layui-form-item" pane>
				<label class="layui-form-label">编号：</label>
				<div class="layui-input-inline">

					<input type="text" name="code" required lay-verify="required"
						placeholder="请输入账号" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item" pane>
				<label class="layui-form-label">名称：</label>
				<div class="layui-input-inline">

					<input type="text" name="name" required lay-verify="required"
						placeholder="请输入姓名" autocomplete="off" class="layui-input">
				</div>
			</div>
	<div class="layui-form-item" pane>
				<label class="layui-form-label">描述：</label>
				<div class="layui-input-inline">

					<input type="text" name="descr" required lay-verify="required"
						placeholder="请输入姓名" autocomplete="off" class="layui-input">
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
					url:con.app+"/goodsType/add.do",
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
$.ajax({
    url:con.app+'/goodsType/select.do',
    data : {action:'all'},
    dataType : 'json',
    type : 'post',
    success : function(data) {
      var html='';
      $.each(data,function(i,d){
    	  html+=laytpl($('#opt').html()).render(d);    	      	  
      })
      $("select[name='parentcode']").html(html);
      form.render();    
    }
})
</script>
<script type="text/html" id='opt'>

<option value='{{d.code}}'> {{d.name}} </option>
</script>


</body>
</html>