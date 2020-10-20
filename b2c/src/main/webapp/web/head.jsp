<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>head</title>
<link rel="stylesheet" type="text/css" href="/b2c/web/common/css/style.css">
<%@   include file="/web/header.jsp"%>
</head>
<body>
	<!-- <div class="site-nav-bg"> -->
	<!--     <div class="site-nav w1200"> -->
	<!--       <p class="sn-back-home"> -->
	<!--         <i class="layui-icon layui-icon-home"></i> -->
	<!--         <a href="/b2c/web/index.jsp">首页</a> -->
	<!--       </p> -->



	<!--       <div class="sn-quick-menu">  	 		  -->
	<%-- 	<c:if test="${empty user}" var="var01" scope="page"> --%>
	<!-- 	<div class="login"><a href="/b2c/web/login.jsp">登录</a></div> -->
	<!--         <div class="login"><a href="/b2c/web/reg.jsp">注册</a></div>        -->

	<%-- 	</c:if> --%>
	<%-- 	<c:if test="${!empty user}" var="var01" scope="page"> --%>

	<%-- 	<div class="login"><a href="#"> ${user.name}</a></div> --%>
	<!--     <div class="login"><a href="javascript:goLogout()">注销</a></div>        -->

	<%-- 	</c:if> --%>

	<!--         <div class="sp-cart"><a href="/b2c/web/jsp/shopcart.jsp">购物车</a><span>2</span></div> -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->
	<!-- start header -->
	<header>
		<div class="top center">
			<div class="left fl">
				<ul>
					<li><a href="/b2c/web/index.jsp" >小米商城</a></li>
					<li>|</li>
					<li><a href="">MIUI</a></li>
					<li>|</li>
					<li><a href="">米聊</a></li>
					<li>|</li>
					<li><a href="">游戏</a></li>
					<li>|</li>
					<li><a href="">多看阅读</a></li>
					<li>|</li>
					<li><a href="">云服务</a></li>
					<li>|</li>
					<li><a href="">金融</a></li>
					<li>|</li>
					<li><a href="">小米商城移动版</a></li>
					<li>|</li>
					<li><a href="">问题反馈</a></li>
					<li>|</li>
					<li><a href="">Select Region</a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="right fr">
				<div class="gouwuche fr">
					<a href="/b2c/web/car/car.jsp">购物车</a>
				</div>
				<div class="fr">
					

					<ul>
					<c:if test="${empty user}" var="var01" scope="page">
						<li><a
							href="/b2c/web/login.jsp"
							>登录</a>
						
							</li>
						<li>|</li>
						<li><a
							href="/b2c/web/reg.jsp"
							>注册</a></li>
						<li>|</li>
						<li><a href="">消息通知</a></li>
					</c:if>
					<c:if test="${!empty user}" var="var01" scope="page">

						<li>
							<a href="#"> ${user.name}</a>
					</li>
					<li>|</li>
						<li>
							<a href="/b2c/web/car/order.jsp">我的订单</a>
						</li>
					<li>|</li>
						<li>
							<a href="javascript:goLogout()">注销</a>
						</li>

					</c:if>					
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</header>
	<!--end header -->
	

</body>
</html>