<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/jsp/header.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>销售订单维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>销售订单维护--编辑信息</legend>
    <form class="layui-form" lay-filter="formA" method="post">
    
			 <div class="layui-form-item" >
				<label class="layui-form-label">用户名称：</label>
				<div class="layui-input-inline">
					<select name="userCode">
					<c:forEach items="${list2}" var="list3" >
                      <option  value="${list3.code}">${list3.name}</option>
					</c:forEach>
					</select>
				</div>
			</div>
			 <div class="layui-form-item" >
				<label class="layui-form-label">客户名称：</label>
				<div class="layui-input-inline">
					<select name="custCode">
					<c:forEach items="${list3}" var="list3" >
                      <option  value="${list3.code}">${list3.name}</option>
					</c:forEach>
					</select>
				</div>
			</div>
			 <div class="layui-form-item" >
				<label class="layui-form-label">商品名称：</label>
				<div class="layui-input-inline">
					<select name="prodCode">
					<c:forEach items="${list4}" var="list3" >
                      <option  value="${list3.code}">${list3.name}</option>
					</c:forEach>
					</select>
				</div>
			</div>
			   <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-inline">
                <input type="text" name="count" placeholder="请输入数量" autocomplete="off"
                    class="layui-input" value="${model.count }">
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">时间</label>
            <div class="layui-input-inline">
                <input type="text" id="test1" name="time"  class="layui-input" value="${model.time }">
            </div>
        </div>
			 <div class="layui-form-item" >
				<label class="layui-form-label">状态名称：</label>
				<div class="layui-input-inline">
					<select name="statusCode">
					<c:forEach items="${list}" var="list1" >
                      <option  value="${list1.statusCode}">${list1.statusName}</option>
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
$("select[name='userCode']").val("${model.userCode}");
$("select[name='statusCode']").val("${model.statusCode}");
$("select[name='custCode']").val("${model.custCode}");
$("select[name='prodCode']").val("${model.prodCode}");
laydate.render({
	  elem: '#test1' //指定元素
	 ,type: 'datetime'
	});
form.render();
formSubmit('/order/addOrUpd.do', 'submit(upd)', 'text', function(data) {//修改
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
    else if(data==6){
        layer.msg('你没有权限修改该状态下的订单');
        closeThis(500);
    }
});
</script>  

</body>
</html>