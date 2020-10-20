<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<!-- saved from url=(0068)http://www.17sucai.com/preview/576936/2017-08-27/xiaomi/liebiao.html -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>小米手机列表</title>
<link rel="stylesheet" type="text/css" href="./common/css/style2.css">


<%-- <%@   include file="/web/header.jsp"%> --%>
</head>
<%@ include file="/web/head.jsp"%>
<body>
	
	<!-- start banner_x -->
	<div class="banner_x center">
				
		<div class="nav fl">
		
			<ul>
			<li><a href="./index.jsp" >
			<img src="./common/img/lunbo/timg.jpg  " style="width: 70px;height:50px"/>
			</a>
			</li>
				<li><a
					href="./liebiao.jsp?name=小米"
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
			<form action="/b2c/web/liebiao.jsp" method="get">
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
	
	
	<div class="danpin center">
			
			<div class="biaoti center">小米手机</div>
			<div class="main center" id='main'>
				
		
				
				
			</div>
		</div>
		<div class="clear"></div>
	<input type="hidden"  id="pi" name="pageIndex" value="1" /> <input
			type="hidden"   id="pl" name="pageLimit" value="10" />
				<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
	<script type="text/javascript">
var name='<%=request.getParameter("name")==null?"":request.getParameter("name")%>';
var parentcode='<%=request.getParameter("parentcode")==null?"":request.getParameter("parentcode")%>';
var typeCode='<%=request.getParameter("typeCode")==null?"":request.getParameter("typeCode")%>';
	//	alert(name);

 refresh();
 function refresh(){
 	 var pageIndex=$("#pi").val();
 	 var pageLimit=$("#pl").val();
		$.ajax({
			type : "post",
			url : con.app + "/goods/selectModel.do",
			dataType : "json",
			data : {
				name : name,pageIndex:pageIndex,pageLimit:pageLimit
				,parentcode:parentcode,typeCode:typeCode
			}, //data发送到服务器
           
			success : function(data) {
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
				$.each(data.list, function(i, dom) {
					var url = dom.url ? dom.url : '';
					var code = dom.code ? dom.code : '';
					var price = dom.price ? dom.price : '';
					var descr = dom.descr;
					var name = dom.name
					var d = {
						url : url,
						code : code,
						descr : descr,
						price : price,
						name : name
					};
					var laytpl = layui.laytpl;
					var ht = $("#addit").html()
					var st = laytpl(ht).render(d)
				    html+= st;
					
				});
				$("#main").html(html);
			}
		});
 }
	</script>
	<script type="text/html" id="addit">

<div class="mingxing fl mb20" style="border:2px solid #fff;width:230px;cursor:pointer;" onmouseout="this.style.border='2px solid #fff'" onmousemove="this.style.border='2px solid red'">
					<div class="sub_mingxing"><a href="./xiangqing.jsp?code={{d.code}}" ><img src="/img/{{d.url}}" alt=""></a></div>
					<div class="pinpai"><a href="./xiangqing.jsp?code={{d.code}}" >{{d.name}}</a></div>
					<div class="youhui">{{d.descr}}</div>
					<div class="jiage">{{d.price}}元</div>
				</div>



	</script>

</body>
<%@   include file="/web/footer.jsp"%>
</html>