<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="/b2c/web/common/css/style.css">

</head>
<%@ include file="/web/head.jsp"%>
<body>
	<!-- start banner_x -->
	<div class="banner_x center">
				
		<div class="nav fl">
		
			<ul>
			<li><a href="../index.jsp" >
			<img src="../common/img/lunbo/timg.jpg  " style="width: 70px;height:50px"/>
			</a>
			</li>
				<li><a
					href="../liebiao.jsp?name=小米"
					>小米手机</a></li>
				<li><a href="">红米</a></li>
				<li><a href="">平板·笔记本</a></li>
				<li><a href="">电视</a></li>
				<li><a href="">盒子·影音</a></li>
				<li><a href="">路由器</a></li>
				<li><a href="">智能硬件</a></li>
				<li><a href="">服务</a></li>
				<li><a href="">社区</a></li>
			</ul>
		</div>
		<div class="search fr">
			<form action="/b2c/web/liebiao.jsp?" method="get">
				<div class="text fl">
					<input type="text" class="shuru"  name="name" placeholder="小米6&nbsp;小米MIX现货">
				</div> 
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索">
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>


		<input type="hidden"  id="pi" name="pageIndex" value="1" /> <input
			type="hidden"   id="pl" name="pageLimit" value="10" />
<!-- <div style="float: right;"> -->
<table class="layui-table">
		<tr>
			<td>序号</td>
			<td>订单编号</td>
			<td>用户编号</td>
			
			<td>时间</td>
           <td>收货地址</td>
			<td>状态</td>
           <td>商品详情</td>
		</tr>

		<tbody id="tbody_id">
		</tbody>
	</table>
<!-- 	</div> -->
	
<!-- 	<div  > -->
<!-- <ul> -->

<!-- <li>地址管理</li> -->
<!-- <li>个人信息管理</li> -->
<!-- </ul> -->

<!--  </div> -->
	
	
	<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>


<script type="text/javascript" src="../common/js/car.js"></script>
<script type="text/javascript">

 var userCode='${user.code}';
// alert(userCode)
refresh();
function refresh(){
	 var pageIndex=$("#pi").val();
	 var pageLimit=$("#pl").val();
$.ajax({
	type : "post",
	url : con.app
			+ "/order/selectModel.do",
	dataType : "json",
	data : {pageIndex:pageIndex,pageLimit:pageLimit,userCode : userCode}, //data发送到服务器

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
					$("input[name='pageIndex']").val(obj.curr);
					$("input[name='pageLimit']").val(obj.limit);
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
							

							console.log(dom);

							html += "<tr><td>"
									+ (i+1)
									+ "</td><td>"
									+ code
									+ "</td><td>"
									+ dom.userName
									+ "</td><td>"
									 
									+ new Date(dom.entryTime).toLocaleDateString()
									+ "</td><td>"
									+dom.typeCode
									+ "</td><td>"
									+ dom.state
									+"</td><td>"
									+ "<input type='button' class='layui-btn' onclick='openGoods(\""
									+ code
									+ "\")' value='商品详情' />&nbsp;"

									+ "</td></tr>"
									

									
						});
		$("#tbody_id").html(html);
	}
});
}
function openGoods(code){
	// alert(code)
	openLayer('/orderGoods/upGoods2.do?orderCode='+code,refresh)

}
</script>

</body>
<%@   include file="/web/footer.jsp"%>
</html>