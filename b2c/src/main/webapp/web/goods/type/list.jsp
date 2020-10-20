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
			<label class="layui-form-label">名称：</label>
			<div class="layui-input-inline">
				<input type="text" name="name" size="20" maxlength="6"
					class="layui-input" />
			</div>
			
			<label class="layui-form-label">描述：</label>
			<div class="layui-input-inline">
				<input type="text" name="descr" size="20" maxlength="6"
					class="layui-input" />
			</div>

		</div>
    <div class="layui-form-item" >
				<label class="layui-form-label">一级分类：</label>
				<div class="layui-input-inline">
					<select name="parentcode" lay-filter="parentcode">
					</select>
				</div>
				
				<label class="layui-form-label">二级分类：</label>
				<div class="layui-input-inline">
					<select name="code">
					</select>
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
			<td>编号</td>
			<td>名称</td>
			<td>上级编号</td>

			<td>描述</td>

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
												+ "/goodsType/selectModel.do",
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
																var code = dom.code ? dom.code
																		: '';
																var name = dom.name ? dom.name
																		: '';
																var pass = dom.pass ? dom.pass
																		: '';

																// console.log(usercode);

																html += "<tr><td>"
																		+ (i+1)
																		+ "</td><td>"
																		+ code
																		+ "</td><td>"
																		+ dom.name
																		+ "</td><td>"
																		+ dom.parentcode
																		+ "</td><td>"
																		+ dom.descr

																		+ "</td><td>"
																		+ "<input type='button' class='layui-btn' onclick='openUserUpd(\""
																		+ code
																		+ "\")' value='修改' />&nbsp;"
																		+ '<a href="javascript:delUser(\''
																		+ code
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

			openLayer('/web/goods/type/add.jsp', refresh);
		}

		function openUserUpd(code) {
			openLayer('/goodsType/upuser.do?code='+code, refresh);
			
			
		}

		function delUser(code) {

			openConfirm(function(index) {

				$.ajax({
					type : "post",
					url : con.app + "/goodsType/delete.do",
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

<script>
getSelect('parentcode',"type1");
function getSelect(selectid,parentcode){
	if(parentcode==''){
		$("select[name='code']").empty();
		form.render('select')
	}
		
	$.ajax({
	    url:con.app+'/goodsType/selectAll.do',
	    data : {parentcode:parentcode},
	    dataType : 'json',
	    type : 'post',
	    success : function(data) {
	      var html="<option value=''>请选择</option>";
	      $.each(data,function(i,d){
	    	 
	    	  html+=laytpl($('#opt').html()).render(d);    	      	  
	      })
	      $("select[name='"+selectid+"']").html(html);
	      form.render('select'); //刷新select下拉框
	    }
	})
	
}



form.on('select(parentcode)',function(data){
	
	getSelect('code',data.value)
})
     
</script>
<script type="text/html" id='opt'>

<option value='{{d.code}}'> {{d.name}} </option>
</script>


</body>
</html>