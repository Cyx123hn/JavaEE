<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>会员登录</title>
<link rel="stylesheet" type="text/css" href="./common/css/login.css">
<%@   include file="/web/header.jsp"%>
</head>
<body>
	<!-- login -->
	<div class="top center">
		<div class="logo center">
			<a href="/b2c/web/index.jsp" ><img
				src="./common/img/login/mistore_logo.png" alt=""></a>
		</div>
	</div>

	<form class=" form center  layui-form" action="" method="post">
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">
						您还不是我们的会员？<a href="/b2c/web/login.jsp">立即登录</a>
					</div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">
						账&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;<input class="shurukuang"   required lay-verify="required"  type="text" name="code"
							placeholder="请输入你的账号：">
					</div>
					<div class="username">
						用户名:&nbsp;<input class="shurukuang"  required lay-verify="required"  type="text" name="name"
							placeholder="请输入你的用户名">
					</div>
					<div class="username">
						密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang"
							type="password" name="pass" placeholder="请输入你的密码">
					</div>
					<div class="username">
						<div class="left fl">
							验证码:&nbsp;<input class="yanzhengma" type="text" name="text1"
								placeholder="请输入验证码">
						</div>
						<div class="right fl">
							<img alt="null" src="/b2c/AuthCodeServlet"
								onclick="this.src='/b2c/AuthCodeServlet?'+Math.random();" />
						</div>
						<div class="clear"></div>
					</div>
					<div class="login_submit">

					<input class="submit" lay-submit lay-filter="reg" type="button"
						value="注册">
				</div>
				</div>
				

			</div>
		</div>
	</form>
	<footer>
		<div class="copyright">简体 | 繁体 | English | 常见问题</div>
		<div class="copyright">
			小米公司版权所有-京ICP备10046444-<img src="./common/img/login/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号
		</div>

	</footer>

	<script type="text/javascript">
		formSubmit('/user/add.do', 'submit(reg)', 'json', function(data) {
			if (data == 0) {
				layer.msg('注册成功');
				$("input[type='reset']").click();
				location.href= con.app+"/web/login.jsp"
			}else if (data == 2) {
				layer.msg('验证码错误');
			}  else if (data == 1) {
				layer.msg('账号已存在');
			} else {
				layer.msg('注册失败');
			}
		});
	</script>
</body>
</html>