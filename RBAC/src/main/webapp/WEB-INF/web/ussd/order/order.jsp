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
    <h2 class="layui-colla-title">销售订单信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
	  <form  method="post"   enctype="multipart/form-data">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名称</label>
				<div class="layui-input-inline">
					<input type="text" name="userName"  placeholder="请输入用户名称" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">客户名称</label>
				<div class="layui-input-inline">
					<input type="text" name="custName"  placeholder="请输入客户名称" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">商品名称</label>
				<div class="layui-input-inline">
					<input type="text" name="prodName"  placeholder="请输入商品名称" autocomplete="off" class="layui-input">
				</div>
				</div>
				<div class="layui-form-item">
				<label class="layui-form-label">状态名称</label>
				<div class="layui-input-inline">
					<input type="text" name="statusName" placeholder="请输入状态名称" autocomplete="off" class="layui-input">
					</div>
				 <span> 
				<input type="button" class="layui-btn" onclick="refresh()" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openAdd()" />
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
    ,url: con.app+'/order/getList.do' //数据接口
    ,request:{
        pageName:'pageIndex'  //参数默认名字为page
        ,limitName:'pageLimit' //参数默认名字为limit
        }
    ,where :{prodName:$("input[name='prodName']").val(),statusName:$("input[name='statusName']").val()
        ,userName:$("input[name='userName']").val(),custName:$("input[name='custName']").val()}
    ,page: true //开启分页
    ,cols: [[ //表头
       {title:'全选',type:'checkbox',fixed:'left'}
      ,{title:"序号",type:"numbers",fixed:'left'}
      ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
      ,{field: 'userName', title: '用户', width:120}
      ,{field: 'custName', title: '客户', width:120, sort: true}
      ,{field: 'prodName', title: '商品', width:120} 
      ,{field: 'count', title: '数量', width:120, sort: true}
      ,{field: 'time', title: '时间', width:280} 
      ,{field: 'statusName', title: '状态', width:120} 
      ,{title: '操作2',width:280,templet:'#barDemo'}
    ]]
  });
  
});
}
function openAdd(){
	openLayer("/order/add.do",refresh);
}
function openUpd(id){
	openLayer("/order/add.do?id="+id,refresh);
}
function del(id){
	openConfirm(function(index){
		ajax('/order/del.do', {id:id}, 'text', function(data){
			console.log(data)
	        if (data == 1) { 
	            layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        } else if (data == 2){
	            layer.msg('删除失败--绩效表中存在该用户，不能删除');
	        } else if (data == 3){
                layer.msg('删除失败--当前账号正在使用不允许删除');
            }
	    })
	})
}
</script>
<script id="barDemo" type="text/html">
	<input type='button' value='修改' class='layui-btn' 
           onclick='openUpd("{{ d.id }}")'/>&nbsp;
 <input type='button' class='layui-btn layui-btn-danger' value='删除' 
           onclick='del("{{ d.id }}")'/>
</script>
</body>
</html>