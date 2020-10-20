<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>商品维护</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>商品管理</legend>
		
	</fieldset>
<form class="layui-form">

	<br>
	<table class="layui-table">
		<tr>
		    <td>序号</td>
			<td>商品名称</td>
			<td>商品</td>
			<td>数量</td>
			<td>价格</td>
			

	
		</tr>

		<tbody id="tbody_id">				
			<c:forEach items="${list}" var="W" varStatus="WW">
                    
             <tr>
             <td>${W.id}</td>
		    <td>${W.goodsName}</td>
		    <td><img src="/img/${W.url} " alt=" ${W.url}" class="layui-upload-img"></td>
			<td>${W.num}</td>
			<td>${W.price}</td>
			

		</tr> 
                                 
               </c:forEach>
		
		
		
		</tbody>
	</table>
</form>

<script type="text/javascript">
form.render();
function delGoods(id) {

	openConfirm(function(index) {

		$.ajax({
			type : "post",
			url : con.app + "/orderGoods/delete.do",
			dataType : "json",
			data : {
				id : id
			},

			success : function(data) {

				if (data == 1) {
					layer.msg('删除成功');
					$("input[name='pageIndex']").val(1);
					refresh();
				} else {
					layer.msg('删除失败');
				}
			}
		});

	})
}
</script>
<script type="text/javascript">

function openUserAdd() {
alert(666)
	openLayer('/web/order/goods/add.jsp', "null");
}

</script>
</body>
</html>