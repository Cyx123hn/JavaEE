<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单信息</title>
<%@   include file="/web/header.jsp"%>
</head>
<body>

	<form class="layui-form">
		<div class="layui-form-item">
		<label class="layui-form-label">编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="code" size="20" maxlength="6"
					class="layui-input" />
			</div>
			<label class="layui-form-label">用户编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="userName" size="20" maxlength="6"
					class="layui-input" />
			</div>
<!-- 			<label class="layui-form-label">订单时间：</label> -->
<!-- 			<div class="layui-input-inline"> -->
<!-- 				<input id="test1"  type="text" name="entryTime" size="20" maxlength="6" -->
<!-- 					class="layui-input" /> -->
<!-- 			</div> -->
			
			
<!-- 			<label class="layui-form-label">状态：</label> -->
<!-- 			<div class="layui-input-inline"> -->
<!-- 				<select name="state"> -->
<!-- 				<option>未发货</option> -->
<!-- 				<option>已发货</option> -->
<!-- 				<option>未付款</option> -->
<!-- 				</select> -->
<!-- 			</div> -->

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
			<td>序号</td>
			<td>订单编号</td>
			<td>用户编号</td>
			
			<td width="20%">时间</td>
           <td>收货地址</td>
			<td>状态</td>

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
												+ "/order/selectModel.do",
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
																var userCode = dom.userCode ? dom.userCode
																		: '';
																var code = dom.code ? dom.code
																		: '';
																

// 																console.log(dom);

																html += "<tr><td>"
																		+ (i+1)
																		+ "</td><td>"
																		+ code
																		+ "</td><td>"
																		+ dom.userName
																		+ "</td><td>"
																		+ dom.entryTime
																		+ "</td><td>"
																		+dom.typeCode
																		+ "</td><td>"
																		+ dom.state

																		+ "</td><td>"
																		+ "<input type='button' class='layui-btn' onclick='openUserUpd(\""
																		+ code
																		+ "\")' value='修改' />&nbsp;"
																		+ '<a href="javascript:delUser(\''
																		+ code
																		+ '\')"'
																		+ ' class="layui-btn layui-btn-xs layui-btn-danger">'
																		+ ' <i class="layui-icon layui-icon-delete"></i></a>'
																		+ "<input type='button' class='layui-btn' onclick='openGoods(\""
																		+ code
																		+ "\")' value='商品管理' />&nbsp;"

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

			openLayer('/web/order/order/add.jsp', refresh);
		}

		function openUserUpd(code) {
			openLayer('/order/upuser.do?code='+code, refresh);
			
			
		}
		function openGoods(code){
			// alert(code)
			openLayer('/orderGoods/upGoods.do?orderCode='+code,refresh)
		
		}
		function delUser(code) {

			openConfirm(function(index) {

				$.ajax({
					type : "post",
					url : con.app + "/order/delete.do",
					dataType : "json",
					data : {
						code : code
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