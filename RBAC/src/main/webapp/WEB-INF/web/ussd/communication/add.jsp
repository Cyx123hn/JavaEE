<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/jsp/header.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>沟通记录维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>沟通记录维护--编辑信息</legend>
    <form class="layui-form" lay-filter="formA" method="post">
    
			 <div class="layui-form-item" >
				<label class="layui-form-label">客户姓名：</label>
				<div class="layui-input-inline">
					<select name="custCode">
					<c:forEach items="${list}" var="list3" >
                      <option  value="${list3.code}">${list3.name}</option>
					</c:forEach>
					</select>
				</div>
			</div>
			 <div class="layui-form-item" >
				<label class="layui-form-label">用户姓名：</label>
				<div class="layui-input-inline">
					<select name="userCode">
					<c:forEach items="${list2}" var="list1" >
                      <option  value="${list1.code}">${list1.name}</option>
					</c:forEach>
					</select>
				</div>
			</div>
          <div class="layui-form-item" >
				<label class="layui-form-label">类型：</label>
				<div class="layui-input-inline">
					<select name="type">
                      <option  value="售前">售前</option>
                      <option  value="换货">换货</option>
                      <option  value="退货">退货</option>
					</select>
				</div>
			</div>
         <div class="layui-form-item">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-inline">
                <input type="text" name="content" placeholder="请输入内容" autocomplete="off"
                    class="layui-input" value="${model.content }">
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">时间</label>
            <div class="layui-input-inline">
                <input type="text" id="test1" name="time"  class="layui-input" value="${model.time }">
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
$("select[name='custCode']").val("${model.custCode}");
$("select[name='userCode']").val("${model.userCode}");
$("select[name='type']").val("${model.type}");
//执行一个laydate实例
laydate.render({
  elem: '#test1' //指定元素
 ,type: 'datetime'
});
form.render();
formSubmit('/communication/addOrUpd.do', 'submit(upd)', 'text', function(data) {//修改
	if (data == 1) { 
        layer.msg('修改成功');
        closeThis(500);
    } else if(data==2){
        layer.msg('添加成功');
        closeThis(500);
    }
    else {
        layer.msg('添加失败');
    }
});
</script>  

</body>
</html>