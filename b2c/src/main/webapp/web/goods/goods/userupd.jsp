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
		<legend>商品维护--修改信息</legend>
		<form class="layui-form layui-form-pane" lay-filter="upduser"
			method="post">					
			<div class="layui-form-item" >
				<label class="layui-form-label">一级分类：</label>
				<div class="layui-input-inline">
					<select name="parentcode" lay-filter="parentcode">
<!-- 					<option value='mi7'>mi7</option> -->
<!-- 					<option value='shouji'>mi8</option> -->
<!-- 					<option value='mi9'>mi9</option> -->
					</select>
				</div>				
				<label class="layui-form-label">二级分类：</label>
				<div class="layui-input-inline">
					<select name="typeCode">
<!-- 					<option value='mi7'>mi7</option> -->
<!-- 					<option value='mi8'>mi8</option> -->
<!-- 					<option value='mi9'>mi9</option> -->
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
		
				<label class="layui-form-label">状态：</label>
				<div class="layui-input-inline">
					<select name="state">
					<option value="上架">上架</option>
					<option value="下架">下架</option>
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
<script>
getSelect('parentcode',"Type1");
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
	      $("select[name='typeCode']").val(typeCode);
	      form.render('select'); //刷新select下拉框
	    }
	})
	
}



form.on('select(parentcode)',function(data){
// 	alert(data.value)
	getSelect('typeCode',data.value)
})
     
</script>
<script type="text/html" id='opt'>

<option value='{{d.code}}'> {{d.name}} </option>
</script>
<script type="text/javascript">

init();

function init(){
	
    var code = '<%=request.getParameter("code")%>';
   
	$.ajax({
        url:con.app+'/goods/selectByCode.do',
        data : {code:code},
        dataType : 'json',
        type : 'post',
        success : function(data) {
        	console.log(data.code);
        	console.log(data.name);
//         	alert(data.typeCode)
//         	alert(data.parentcode)
        	getSelect('typeCode',data.parentcode )   //先加载二级下拉框，ajax请求较慢，回显赋值比请求快，因此 在typeCode
        	                                         //位置重新回显  $("select[name='typeCode']").val(typeCode);
	        	form.val("upduser", 
	        	{name: data.name,code: data.code,
	        		price:data.price, descr:data.descr ,
	        		inventory:data.inventory,state:data.state,
	        		parentcode:data.parentcode,
	        		typeCode:data.typeCode
	        	})
        	form.render('select');
            form.render();//重新渲染
        	typeCode=data.typeCode;
//          $("input[name='usercode']").val(data.code);
//          $("input[name='username']").val(data.name);
//          $("input[name='usercode']").prop("readonly","readonly");
         
        }
    })
}
var typeCode;
//提交修改
formSubmit('/goods/update.do', 'submit(updUser)', 'json', function(data) {
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