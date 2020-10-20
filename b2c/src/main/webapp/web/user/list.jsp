<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工主页</title>
<%@   include file="/web/header.jsp"%>
</head>
<body>

	<form class="layui-form" >
		<div class="layui-form-item">
			<label class="layui-form-label">姓名：</label>
			<div class="layui-input-inline">
				<input type="text" name="name" size="20" maxlength="6"
					class="layui-input" />
			</div>
			<div class="layui-form-item">
			<label class="layui-form-label">账号：</label>
			<div class="layui-input-inline">
				<input type="text" name="code" size="20" maxlength="6"
					class="layui-input" />
			</div>
				<span>			
				<input class="layui-btn" type="reset" value="重置" /> 
				<input
					class="layui-btn" type="button" value="查询" lay-submit
					lay-filter="search" /> 
				<input
					class="layui-btn" type="button" onclick="openUserAdd()" value="添加" />
				
			</span>
		</div>
		<input type="hidden" name="action" value="list" />
		<input type="hidden" name="pageIndex" value="1" />
		<input type="hidden" name="pageLimit" value="10" />
	</form>


	<table class="layui-table">
		<tr>
			<td>id</td>
			<td>账号</td>
			<td>密码</td>
			<td>姓名</td>
			
			<td>管理员</td>
			
			<td>操作</td>
		</tr>

		<tbody id="tbody_id">
		</tbody>
	</table>
	<div id="pageInfoUser" style="text-align: right;padding-right: 30px"></div>
<script type="text/javascript"> 
 form.on('submit(search)', function(data){			
			 // console.log(data) //被执行事件的元素DOM对象，一般为button对象
			  $.ajax({
					type:"post",
					url:con.app+"/user/selectModel.do",
					dataType:"json",  
			    	data:data.field, //data发送到服务器
				   
					success: function (data) {
						//console.log(data.count);
						var curr = $("input[name='pageIndex']").val();
					    var limit = $("input[name='pageLimit']").val();
					 
// 					    laypage.render({
// 					  elem : 'pageInfoUser',
// 					  count : data.count,// 数据总数
// 					  curr : curr,// 当前页
// 					  limit : limit,// 每页显示的条数
// 					  layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
// 					  jump : function(obj, first){
// 						  $("input[name='pageIndex']").val(obj.curr);
// 					        $("input[name='pageLimit']").val(obj.limit);
// 					        if(!first){refresh();}//首次不执行
						  
// 					  }
// 					  });
					    
					    
					    setPageInfo('pageInfoUser',data.count,curr,limit
					    		,function(obj, first){
					        $("input[name='pageIndex']").val(obj.curr);
					        $("input[name='pageLimit']").val(obj.limit);
 					        if(!first){refresh();}//首次不执行
					    })
						
						
						var html="";
						 $.each(data.list,function(i, dom) {
							   var code = dom.code?dom.code:'';
						        var name = dom.name?dom.name:'';						        
						        var pass = dom.pass?dom.pass:'';
						        
							// console.log(usercode);
								
	 							html +="<tr><td>"+(i+1)+"</td><td>"+code+"</td><td>"+
	 							   dom.pass+"</td><td>"+dom.name+"</td><td>"+dom.admin
	 							   
	 							+   "</td><td>"	 							 	 								
	 							+"<input type='button' class='layui-btn' onclick='openUserUpd(\""+code+"\")' value='修改' />&nbsp;"
	 							+'<a href="javascript:delUser(\''+code+'\')"'
	 						      +' class="layui-btn layui-btn-xs layui-btn-danger">'
	 						       +' <i class="layui-icon layui-icon-delete"></i></a>'

	 							+"<input type='button' class='layui-btn' onclick='openUserPas(\""+code+"\")' value='重置密码' />&nbsp;"
// 	 							+"<input type='button' class='layui-btn' onclick='openUserImg(\""+code+"\")' value='头像' />&nbsp;"		 							   	 								 						     
	 							  + "</td></tr>"							       						      						      						        
						    });
						 $("#tbody_id").html(html);
					}
			  });					
 });



 refresh();
 function refresh(){
     $("input[value='查询']").click();
 } 
 function openUserAdd(){
	
	 openLayer('/web/user/add.jsp',refresh);
 }

 function openUserUpd(code){
	 
		openLayer('/web/user/userupd.jsp?code='+code,refresh)
	}
 
 function openUserPas(code){
	 
		openLayer('/web/user/userpass.jsp?code='+code,refresh)
	}

//  function openUserImg(code){
	 
// 		openLayer('/web/t1/user/pic.jsp?code='+code,refresh)
// 	}
function delUser(code){
	
		openConfirm(function(index){
			
			
			$.ajax({
				type:"post",
				url: con.app+"/user/delete.do",
				dataType:"json",  
		    	data:{code:code},
			   
				success: function (data) {
					
					if (data == 1) {
			            layer.msg('删除成功');
			            $("input[name='pageIndex']").val(1);
			            refresh();
			        }else if(data==2){
			        	layer.msg('无法删除');			        	
			        }
					
			     else {
		                layer.msg('删除失败');
		            }
				}			
			});   	 
			
			
		})
	}
 


</script>



</body>
</html>