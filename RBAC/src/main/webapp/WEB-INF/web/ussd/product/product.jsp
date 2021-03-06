<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/web/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.layui-table-cell{
     height:50px;
     line-height: 50px;
     
 }
   .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
   top: 50%;
   transform: translateY(-50%)
   }
</style>
<body>

<div class="layui-collapse">
  <div class="layui-colla-item">
    <h2 class="layui-colla-title">商品信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
	  <form  method="post"   enctype="multipart/form-data">
			<div class="layui-form-item">
				<label class="layui-form-label">商品编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code"  placeholder="请输入商品编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入商品名称" autocomplete="off" class="layui-input">
					</div>
				<span> 
				<input type="button" class="layui-btn" onclick="refresh()" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openAdd()" />
				<input type="button" class="layui-btn" value="二维图表" onclick="openChart()" />
				</span>
			</div>
		</form>
	</fieldset>
	</div></div></div>
<table id="demo" class='layui-table-cell' lay-filter="test"></table>
<script>
refresh();
function refresh(){
layui.use('table', function(){
  var table = layui.table;
  //第一个实例
  table.render({
    elem: '#demo'
    ,height: 'full-230'
    ,url: con.app+'/product/getList.do' //数据接口
    ,request:{
        pageName:'pageIndex'  //参数默认名字为page
        ,limitName:'pageLimit' //参数默认名字为limit
        }
    ,where :{code:$("input[name='code']").val(),name:$("input[name='name']").val()}
    ,page: true //开启分页
    ,cols: [[ //表头
       {title:'全选',type:'checkbox',fixed:'left'}
      ,{title:"序号",type:"numbers",fixed:'left'}
      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
      ,{field: 'code', title: '账号', width:80}
      ,{field: 'name', title: '姓名', width:180, sort: true}
      ,{field: 'sum', title: '数量', width:80, sort: true}
      ,{field: 'cost', title: '单价', width:80, sort: true}
      ,{field: 'content', title: '描述', width:280, sort: true}
      ,{title: '操作',width:280,templet:'#barDemo'}
    ]]
  });
  
});
}
function openAdd(){
	openLayer("/product/add.do",refresh);
}
function openUpd(code){
	openLayer("/product/add.do?code="+code,refresh);
}
function openChart(){
	openLayer("/product/toChart.do",refresh);
}
function del(code){
	openConfirm(function(index){
		ajax('/product/del.do', {code:code}, 'text', function(data){
			console.log(data)
	        if (data == 1) { 
	            layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        } else if (data == 2){
	            layer.msg('删除失败--用户表角色正在使用，不能删除');
	        } else if (data == 3){
                layer.msg('删除失败--权限表中角色正在使用');
            }
	    })
	})
}
</script>
<script id="barDemo" type="text/html">
	<input type='button' value='修改' class='layui-btn' 
           onclick='openUpd("{{ d.code }}")'/>&nbsp;
 <input type='button' class='layui-btn layui-btn-danger' value='删除' 
           onclick='del("{{ d.code }}")'/>
</script>
</body>
</html>