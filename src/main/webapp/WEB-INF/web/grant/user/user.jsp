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
    <h2 class="layui-colla-title">用户信息-查询条件</h2>
    <div class="layui-colla-content layui-show">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 0px; padding: 5px">
	  <form  method="post"   enctype="multipart/form-data">
			<div class="layui-form-item">
				<label class="layui-form-label">用户编号</label>
				<div class="layui-input-inline">
					<input type="text" name="code"  placeholder="请输入用户编号" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label">用户名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" placeholder="请输入用户名称" autocomplete="off" class="layui-input">
					</div>
				<span> 
				<input type="button" class="layui-btn" onclick="refresh()" value="查询" /> 
				<input type="reset" class="layui-btn" value="重置" /> 
				<input type="button" class="layui-btn" value="添加" onclick="openAdd()" />
				<input type="button" class="layui-btn" value="导出数据" onclick="exportExcel()" />
				<input type="button" class="layui-btn"  id="test111" value="上传文件"  />
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
    ,url: con.app+'/user/getList.do' //数据接口
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
      ,{field: 'userPass', title: '密码', width:180} 
      ,{field: 'roleName', title: '角色', width:180} 
      ,{field: 'parentName', title: '上级领导', width:120} 
      ,{title: '操作2',width:380,templet:'#barDemo'}
    ]]
  });
  
});
}
function exportExcel(){
	location.href="/RBAC1/user/exportExcel.do";
}
function openAdd(){
	openLayer("/user/add.do",refresh);
}
function openUpd(code){
	openLayer("/user/add.do?code1="+code,refresh);
}
function openPass(code){
    openLayer('/user/toUpdPass.do?code1='+code,refresh)//将code传入地址，根据code进行修改
}
function del(code){
	openConfirm(function(index){
		ajax('/user/del.do', {code:code}, 'text', function(data){
			console.log(data)
	        if (data == 1) { 
	            layer.msg('删除成功');
	            $("input[name='pageIndex']").val(1);
	            refresh();
	        } else if (data == 2){
	            layer.msg('删除失败--该用户有下属，不能删除');
	        } else if (data == 3){
                layer.msg('删除失败--当前账号正在使用不允许删除');
            }
	    })
	})
}

	upload.render({
		elem: '#test111',
		url:"/RBAC1/user/uploadExcel.do",
		acceept:'file',
		exts:"xlsx|xls",
		done:function(res){
			layer.msg("上传成功");
			refresh();
			}
		,error:function(){
			console.log(11111);
			refresh();
			}
		});

</script>
<script id="barDemo" type="text/html">
	<input type='button' value='修改' class='layui-btn' 
           onclick='openUpd("{{ d.code }}")'/>&nbsp;
 <input type='button' class='layui-btn layui-btn-danger' value='删除' 
           onclick='del("{{ d.code }}")'/>
<input type='button' class='layui-btn' value='重置密码' 
           onclick='openPass("{{ d.code }}")'/>
</script>
</body>
</html>