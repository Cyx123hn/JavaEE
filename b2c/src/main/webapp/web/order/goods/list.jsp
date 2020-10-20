<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品分类</title>
<%@   include file="/web/header.jsp"%>
</head>
<body>

	<form class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">用户编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="orderCode" size="20" maxlength="6"
					class="layui-input" />
			</div>
			<label class="layui-form-label">商品编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="goodsCode" size="20" maxlength="6"
					class="layui-input" />
			</div>

		</div>
		

		<div class="layui-form-item">
			<span> <input class="layui-btn" type="reset" value="重置" /> <input
				class="layui-btn" type="button" value="查询" lay-submit
				lay-filter="search" /> <input class="layui-btn" type="button"
				onclick="openUserAdd()" value="添加" />

			</span>
		</div>

		<input type="hidden" name="pageIndex" value="1" /> <input
			type="hidden" name="pageLimit" value="10" />
	</form>


	<table class="layui-table">
		<tr>
			<td>id</td>
			<td>订单编号</td>
			<td>商品名称</td>
			<td>商品</td>
			<td>数量</td>

			<td>小计</td>

			<td>操作</td>
		</tr>

		<tbody id="tbody_id">
		</tbody>
	</table>
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	<script type="text/javascript">
		form.on('submit(search)',
						function(data) {
							// console.log(data) //被执行事件的元素DOM对象，一般为button对象
							$.ajax({
										type : "post",
										url : con.app
												+ "/orderGoods/selectModel.do",
										dataType : "json",
										data : data.field, //data发送到服务器

										success : function(data) {
											//console.log(data.count);
											var curr = $(
													"input[name='pageIndex']")
													.val();
											var limit = $(
													"input[name='pageLimit']")
													.val();

											setPageInfo(
													'pageInfoUser',
													data.count,
													curr,
													limit,
													function(obj, first) {
														$(
																"input[name='pageIndex']")
																.val(obj.curr);
														$(
																"input[name='pageLimit']")
																.val(obj.limit);
														if (!first) {
															refresh();
														}//首次不执行
													})

											var html = "";
											$.each(
															data.list,
															function(i, dom) {
																var id=dom.id;
																var orderCode = dom.orderCode ? dom.userCode
																		: '';
																var goodsCode = dom.goodsCode ? dom.goodsCode
																		: '';
																var num = dom.num ? dom.num
																		: '';

																// console.log(usercode);

																html += "<tr><td>"
																		+ id
																		+ "</td><td>"
																		+ orderCode
																		+ "</td><td>"
																		+ goodsName
																		+ "</td><td>"
																		+ dom.url
																		+ "</td><td>"
																		+ dom.num
																		+ "</td><td>"
																		+ dom.price

																		+ "</td><td>"
																		+ "<input type='button' class='layui-btn' onclick='openUserUpd(\""
																		+ id
																		+ "\")' value='修改' />&nbsp;"
																		+ '<a href="javascript:delUser(\''
																		+ id
																		+ '\')"'
																		+ ' class="layui-btn layui-btn-xs layui-btn-danger">'
																		+ ' <i class="layui-icon layui-icon-delete"></i></a>'

																		+ "</td></tr>"
															});
											$("#tbody_id").html(html);
										}
									});
						});

		refresh();
		function refresh() {
			$("input[value='查询']").click();
		}
		function openUserAdd() {

			openLayer('/web/order/goods/add.jsp', refresh);
		}

		function openUserUpd(id) {
			openLayer('/orderGoods/upuser.do?id='+id, refresh);
			
			
		}

		function delUser(id) {

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



</body>
</html>