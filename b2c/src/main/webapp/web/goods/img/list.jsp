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
			<label class="layui-form-label">编号：</label>
			<div class="layui-input-inline">
				<input type="text" name="goodsCode" size="20" maxlength="6"
					class="layui-input" />
			</div>
			<label class="layui-form-label">路径：</label>
			<div class="layui-input-inline">
				<input type="text" name="url" size="20" maxlength="6"
					class="layui-input" />
			</div>

		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">类型：</label>
			<div class="layui-input-inline">

				<input type="text" name="type" autocomplete="off"
					class="layui-input">
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
			<td>编号</td>
			<td>商品</td>
			<td>图片</td>
			<td>类型</td>

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
												+ "/goodsImg/selectModel.do",
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
																var goodsCode = dom.goodsCode? dom.goodsCode
																		: '';
																var name = dom.name ? dom.name
																		: '';
																var pass = dom.pass ? dom.pass
																		: '';

																console.log(dom);
							
																html += "<tr><td>"
																		+ (i+1)
																		+ "</td><td>"
																		+ goodsCode
																		+ "</td><td>"
																		
																		+ dom.goodsName
																		+ "</td><td>"
																		+ dom.url
																		+ "</td><td>"
																		+ dom.type
																
																		+ "</td><td>"
																		+ "<input type='button' class='layui-btn' onclick='openUserUpd(\""
																		+ goodsCode
																		+ "\")' value='修改' />&nbsp;"
																		+ '<a href="javascript:delUser(\''
																		+ goodsCode
																		+ '\')"'
																		+ ' class="layui-btn layui-btn-xs layui-btn-danger">'
																		+ ' <i class="layui-icon layui-icon-delete"></i></a>'
																		+"<input type='button' class='layui-btn' onclick='openUserImg(\""+goodsCode+"\")' value='头像' />&nbsp;"
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
// 		function openUserAdd() {

// 			openLayer('/web/goods/img/add.jsp', refresh);
// 		}

// 		function openUserUpd(code) {
          
// 			openLayer('/web/goods/img/userupd.jsp?goodsCode='+code, refresh)
// 		}
// 		function openUserImg(code){
// 			 //alert(code)
// 			openLayer('/web/goods/img/pic.jsp?goodsCode='+code,refresh)
// 		}
// 		function delUser(code) {

// 			openConfirm(function(index) {

// 				$.ajax({
// 					type : "post",
// 					url : con.app + "/goodsImg/delete.do",
// 					dataType : "json",
// 					data : {
// 						goodsCode : code
// 					},

// 					success : function(data) {

// 						if (data == 1) {
// 							layer.msg('删除成功');
// 							$("input[name='pageIndex']").val(1);
// 							refresh();
// 						} else {
// 							layer.msg('删除失败');
// 						}
// 					}
// 				});

// 			})
// 		}
	</script>



</body>
</html>