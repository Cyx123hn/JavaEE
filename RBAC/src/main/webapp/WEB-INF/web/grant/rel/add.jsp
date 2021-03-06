<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/jsp/header.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>权限维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>权限维护--编辑信息</legend>
    <form class="layui-form" lay-filter="formA" method="post">
    
			 <div class="layui-form-item" >
				<label class="layui-form-label">角色名称：</label>
				<div class="layui-input-inline">
					<select name="roleCode">
					<c:forEach items="${list2}" var="list3" >
                      <option  value="${list3.code}">${list3.name}</option>
					</c:forEach>
					</select>
				</div>
			</div>
			 <div class="layui-form-item" >
				<label class="layui-form-label">菜单名称：</label>
				<div class="layui-input-inline">
					<select name="menuCode">
					<c:forEach items="${list}" var="list1" >
                      <option  value="${list1.code}">${list1.name}</option>
					</c:forEach>
					</select>
				</div>
			</div>
        <input type="hidden" name="id" value="${model.id }">
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
<script type="text/javascript">
$("select[name='roleCode']").val("${model.roleCode}");
$("select[name='menuCode']").val("${model.menuCode}");
form.render();
formSubmit('/rel/addOrUpd.do', 'submit(upd)', 'text', function(data) {//修改
	if (data == 1) { 
        layer.msg('修改成功');
        closeThis(500);
    } else if(data==2){
        layer.msg('修改失败,编号已存在');
    }
    else if(data==3){
        layer.msg('添加失败，编号已存在');
    }
    else if(data==4){
        layer.msg('添加失败');
    } else if(data==5){
        layer.msg('添加成功');
        closeThis(500);
    }
});
</script>  

</body>
</html>