<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<!-- saved from url=(0070)http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/xiangqing.html -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>立即购买-小米商城</title>
<link rel="stylesheet" type="text/css" href="./common/css/style3.css">
<%-- <%@   include file="/web/header.jsp"%> --%>
</head>
<%@ include file="/web/head.jsp"%>
<body>


	<!-- start banner_x -->
	<div class="banner_x center">

		<div class="nav fl">

			<ul>
				<li><a href="./index.jsp"> <img
						src="./common/img/lunbo/timg.jpg  "
						style="width: 70px; height: 50px" />
				</a></li>
				<li><a href="./liebiao.jsp?name=小米">小米手机</a></li>
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
			<form action="/b2c/web/liebiao.jsp" method="get">
				<div class="text fl">
					<input type="text" class="shuru" name="name"
						placeholder="小米6&nbsp;小米MIX现货">
				</div>
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索">
				</div>
				<div class="clear"></div>
			</form>
			<div class="clear"></div>
		</div>
	</div>


	<!-- xiangqing -->
	<form
		action="http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/post"
		method="">
		<div class="xiangqing">
			<div class="neirong w">
				<div class="xiaomi6 fl" id="name1"></div>
				<nav class="fr">
					<li><a
						href="http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/xiangqing.html">概述</a></li>
					<li>|</li>
					<li><a
						href="http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/xiangqing.html">变焦双摄</a></li>
					<li>|</li>
					<li><a
						href="http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/xiangqing.html">设计</a></li>
					<li>|</li>
					<li><a
						href="http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/xiangqing.html">参数</a></li>
					<li>|</li>
					<li><a
						href="http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/xiangqing.html">F码通道</a></li>
					<li>|</li>
					<li><a
						href="http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/xiangqing.html">用户评价</a></li>
					<div class="clear"></div>
				</nav>
				<div class="clear"></div>
			</div>
		</div>

		<div class="jieshao mt20 w">
			<div class="left fl">
				<img id="img" style="width: 560px; height: 560px;">
			</div>
			<div class="right fr">
				<div class="h3 ml20 mt20" id="name2"></div>
				<div class="jianjie mr40 ml20 mt10" id="descr"></div>
				<div class="jiage ml20 mt10" id="price1"></div>
				<div class="ft20 ml20 mt20">选择版本</div>
				<div class="xzbb ml20 mt10">
					<div class="banben fl">
						<a> <span>全网通版 6GB+64GB </span> <span id="price2">2499元</span>
						</a>
					</div>

					<div class="clear"></div>
				</div>
				<div class="ft20 ml20 mt20">选择颜色</div>
				<div class="xzbb ml20 mt10">
					<div class="banben">
						<a> <span class="yuandian"></span> <span class="yanse">亮黑色</span>
						</a>
					</div>

				</div>
				<div class="xqxq mt20 ml20">
					<div class="top1 mt10">
						<div class="left1 fl" id="descr2"></div>
						<div class="right1 fr" id="price3">2499.00元</div>
						<div class="clear"></div>
					</div>
					<div class="bot mt20 ft20 ftbc" id="price4">总计：2499元</div>
				</div>
				<div class="xiadan ml20 mt20">
					<input class="jrgwc" type="button" name="jrgwc" value="立即选购">
					<input class="jrgwc" type="button" onclick="add()" name="jrgwc"
						value="加入购物车">

				</div>
			</div>
			<div class="clear"></div>
		</div>
	</form>
	<%@   include file="/web/footer.jsp"%>
	<script type="text/javascript">
var code='<%=request.getParameter("code")%>';
		//alert(code);
var price='';
		$.ajax({
			type : "post",
			url : con.app + "/goods/selectModel.do",
			dataType : "json",
			data : {
				code : code,name:''
			}, //data发送到服务器

			success : function(data) {
			
				var html = "";
				$.each(data.list, function(i, dom) {
                     price=dom.price;
					$('#img').attr({
						src : '/img/'+dom.url
						
					});

					$("#name1").html(dom.name);
					$("#name2").html(dom.name);
					$("#price1").html(dom.price+"元");
					$("#price2").html(dom.price+"元");
					$("#price3").html(dom.price+"元");
					$("#price4").html("总计："+dom.price+"元");
					$("#descr").html(dom.descr);
					$("#descr2").html(dom.name+dom.descr);
				});
             
			}
		});
	</script>
	<script type="text/javascript">
var goodsCode='<%=request.getParameter("code")%>';
		var userCode = '${user.code}';

		function add() {
			if (userCode == '') {

				layer.msg("请登录");
				location.href = con.app + "/web/login.jsp"
			}
			$.ajax({
				type : "post",
				url : con.app + "/orderCar/add.do",
				dataType : "json",
				data : {
					goodsCode : goodsCode,
					userCode : userCode,
					subtotal : price,
					num : '1',
					price : price
				}, //data发送到服务器

				success : function(data) {
					if (data == 1) {
						location.href = con.app + "/web/car/car.jsp"

					}

				}
			});
		}
	</script>






</body>
</html>