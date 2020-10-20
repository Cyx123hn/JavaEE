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
		<form class="layui-form layui-form-pane" >
			
			<div class="layui-form-item" >
				<label class="layui-form-label">一级分类：</label>
				<div class="layui-input-inline">
					<select name="parentcode" lay-filter="parentcode">
					</select>
				</div>
				
				<label class="layui-form-label">二级分类：</label>
				<div class="layui-input-inline">
					<select name="typeCode">
					</select>
				</div>
				
			</div>
		
			
			
			<div class="layui-form-item" >
				<label class="layui-form-label">编号：</label>
				<div class="layui-input-inline">

					<input type="text" name="code" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			

			
				<label class="layui-form-label">名称：</label>
				<div class="layui-input-inline">

					<input type="text" name="name" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item" >
				<label class="layui-form-label">单价：</label>
				<div class="layui-input-inline">

					<input type="text" name="price" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
		

	
				<label class="layui-form-label">描述：</label>
				<div class="layui-input-inline">

					<input type="text" name="descr" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
			</div>
     <div class="layui-form-item" >
				<label class="layui-form-label">库存：</label>
				<div class="layui-input-inline">

					<input type="text" name="inventory" required lay-verify="required"
						placeholder="请输入" autocomplete="off" class="layui-input">
				</div>
		
				<label class="layui-form-label">二级分类：</label>
				<div class="layui-input-inline">
					<select name="state">
					<option value="上架">上架</option>
					<option value="下架">下架</option>
					</select>
				</div>
			</div>
			
			
 
			<div class="layui-form-item" >
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
					url:con.app+"/goods/add.do",
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
getSelect('parentcode',"type1");
function getSelect(selectid,parentcode){
	if(parentcode==''){
		$("select[name='typeCode']").empty();
		form.render('select')
	}
		
	$.ajax({
	    url:con.app+'/goodsType/selectAll.do',
	    data : {parentcode:parentcode},
	    dataType : 'json',
	    type : 'post',
	    success : function(data) {
	      var html="<option value=''>请选择</option>";
	      $.each(data,function(i,d){
	    	 
	    	  html+=laytpl($('#opt').html()).render(d);    	      	  
	      })
	      $("select[name='"+selectid+"']").html(html);
	      form.render('select'); //刷新select下拉框
	    }
	})
	
}



form.on('select(parentcode)',function(data){
	
	getSelect('typeCode',data.value)
})
     
</script>
<script type="text/html" id='opt'>

<option value='{{d.code}}'> {{d.name}} </option>
</script>



</body>
</html>