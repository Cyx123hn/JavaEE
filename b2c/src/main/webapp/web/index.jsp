<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>小米商城</title>
<!-- <link rel="stylesheet" type="text/css" href="./common/css/style.css"> -->
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
	<!-- end banner_x -->

	<!-- start banner_y -->
	<div class="banner_y center">
		<div class="layui-carousel" id="test1" style="float: right;">
			<div carousel-item>
				<div>
					<img src="./common/img/lunbo/001.jpg" style="width: 992px;height: 460px"/>
				</div>
				<div>
				<img src="./common/img/lunbo/002.jpg" style="width: 992px;height: 460px"/>
				</div>
				<div>
				<img src="./common/img/lunbo/003.jpg" style="width: 992px;height: 460px"/>
				</div>
				

			</div>
		</div>
		<div class="nav">
			<ul id="type2">

			</ul>
		</div>
	</div>


	<div class="sub_banner center">
		<div class="sidebar fl">
			<div class="fl">
				<a href=""><img src="./common/img/files/hjh_01.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./common/img/files/hjh_02.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./common/img/files/hjh_03.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./common/img/files/hjh_04.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./common/img/files/hjh_05.gif"></a>
			</div>
			<div class="fl">
				<a href=""><img src="./common/img/files/hjh_06.gif"></a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="datu fl">
			<a href=""><img src="./common/img/files/hongmi4x.png" alt=""></a>
		</div>
		<div class="datu fl">
			<a href=""><img src="./common/img/files/xiaomi5.jpg" alt=""></a>
		</div>
		<div class="datu fr">
			<a href=""><img src="./common/img/files/pinghengche.jpg" alt=""></a>
		</div>
		<div class="clear"></div>


	</div>
	<!-- end banner -->

	<!-- start danpin -->
	<div class="danpin center">

		<div class="biaoti center">小米明星单品</div>
		<div class="main center">
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href=""><img src="./common/img/files/pinpai1.png" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="">小米MIX</a>
				</div>
				<div class="youhui">5月9日-21日享花呗12期分期免息</div>
				<div class="jiage">3499元起</div>
			</div>
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href=""><img src="./common/img/files/pinpai2.png" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="">小米5s</a>
				</div>
				<div class="youhui">5月9日-10日，下单立减200元</div>
				<div class="jiage">1999元</div>
			</div>
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href=""><img src="./common/img/files/pinpai3.png" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="">小米手机5 64GB</a>
				</div>
				<div class="youhui">5月9日-10日，下单立减100元</div>
				<div class="jiage">1799元</div>
			</div>
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href=""><img src="./common/img/files/pinpai4.png" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="">小米电视3s 55英寸</a>
				</div>
				<div class="youhui">5月9日，下单立减200元</div>
				<div class="jiage">3999元</div>
			</div>
			<div class="mingxing fl">
				<div class="sub_mingxing">
					<a href=""><img src="./common/img/files/pinpai5.png" alt=""></a>
				</div>
				<div class="pinpai">
					<a href="">小米笔记本</a>
				</div>
				<div class="youhui">更轻更薄，像杂志一样随身携带</div>
				<div class="jiage">3599元起</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="peijian w">
		<div class="biaoti center">配件</div>
		<div class="main center">
			<div class="content">
				<div class="remen fl">
					<a href=""><img src="./common/img/files/peijian1.jpg"></a>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span>新品</span>
					</div>
					<div class="tu">
						<a href=""><img src="./common/img/files/peijian2.jpg"></a>
					</div>
					<div class="miaoshu">
						<a href="">小米6 硅胶保护套</a>
					</div>
					<div class="jiage">49元</div>
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href=""> <span>发货速度很快！很配小米6！</span> <span>来至于mi狼牙的评价</span>
						</a>
					</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href=""><img src="./common/img/files/peijian3.jpg"></a>
					</div>
					<div class="miaoshu">
						<a href="">小米手机4c 小米4c 智能</a>
					</div>
					<div class="jiage">29元</div>
					<div class="pingjia">372人评价</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: red">享6折</span>
					</div>
					<div class="tu">
						<a href=""><img src="./common/img/files/peijian4.jpg"></a>
					</div>
					<div class="miaoshu">
						<a href="">红米NOTE 4X 红米note4X</a>
					</div>
					<div class="jiage">19元</div>
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href=""> <span>发货速度很快！很配小米6！</span> <span>来至于mi狼牙的评价</span>
						</a>
					</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href=""><img src="./common/img/files/peijian5.jpg"></a>
					</div>
					<div class="miaoshu">
						<a href="">小米支架式自拍杆</a>
					</div>
					<div class="jiage">89元</div>
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href=""> <span>发货速度很快！很配小米6！</span> <span>来至于mi狼牙的评价</span>
						</a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="content">
				<div class="remen fl">
					<a href=""><img src="./common/img/files/peijian6.png"></a>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href=""><img src="./common/img/files/peijian7.jpg"></a>
					</div>
					<div class="miaoshu">
						<a href="">小米指环支架</a>
					</div>
					<div class="jiage">19元</div>
					<div class="pingjia">372人评价</div>
					<div class="piao">
						<a href=""> <span>发货速度很快！很配小米6！</span> <span>来至于mi狼牙的评价</span>
						</a>
					</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href=""><img src="./common/img/files/peijian8.jpg"></a>
					</div>
					<div class="miaoshu">
						<a href="">米家随身风扇</a>
					</div>
					<div class="jiage">19.9元</div>
					<div class="pingjia">372人评价</div>
				</div>
				<div class="remen fl">
					<div class="xinpin">
						<span style="background: #fff"></span>
					</div>
					<div class="tu">
						<a href=""><img src="./common/img/files/peijian9.jpg"></a>
					</div>
					<div class="miaoshu">
						<a href="">红米4X&nbsp;高透软胶保护套</a>
					</div>
					<div class="jiage">59元</div>
					<div class="pingjia">775人评价</div>
				</div>
				<div class="remenlast fr">
					<div class="hongmi">
						<a href=""><img src="./common/img/files/hongmin4.png" alt=""></a>
					</div>
					<div class="liulangengduo">
						<a href=""><img src="./common/img/files/liulangengduo.png"
							alt=""></a>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>


	<%@   include file="/web/footer.jsp"%>
	<script type="text/javascript">
		layui.use('carousel', function() {
			var carousel = layui.carousel;
			//建造实例
			carousel.render({
				elem : '#test1',
				width : '992px' //设置容器宽度
				,
				height : '460px',
				arrow : 'always' //始终显示箭头
				,
				anim : 'fade '//切换动画方式
				//, autoplay: false
				,
				interval : 2000,

			});
		});
	</script>

	<script>
		getSelect('parentcode', "type1");
		function getSelect(selectid, parentcode) {
			$
					.ajax({
						url : con.app + '/goodsType/selectAll.do',
						data : {
							parentcode : parentcode
						},
						dataType : 'json',
						type : 'post',
						success : function(data) {

							var html = "";
							var html2 = '';
							$
									.each(
											data,
											function(index, dom) {
												var code = dom.code;
												var t1 = "<li><a href='/b2c/web/liebiao.jsp?name=&parentcode="+dom.code+"'>"
														+ dom.name + "</a>";
												var t2 = "<div class='pop' id='div_"+code+"'></div>";
												html += t1 + "</li>";
												html2 += t1 + t2 + "</li>";

											})
							$("#type2").html(html2);
							$("#type").html(html);
							$
									.each(
											data,
											function(index, dom) {
												var code = dom.code;
												$
														.ajax({
															url : con.app
																	+ '/goodsType/selectAll.do',
															data : {
																parentcode : code
															},
															dataType : 'json',
															type : 'post',
															success : function(
																	data) {
																var h = '';
																$
																		.each(
																				data,
																				function(
																						index,
																						dom) {
																					// 										h+=fenleishow2(i/6,dom)	;
																				
																					console.log(dom.code);
																					console.log(dom.name);
																					if (index == 0) {
																						h += '<div class="left fl">';
																					}
																					if (index == 5) {
																						h += '</div><div class="ctn fl">';
																					}
																					if (index == 10) {
																						h += '</div><div class="right fl">';
																					}
// 																					h+='<div class="img fl"><img src="./common/img/files/xm6_80.png" alt=""></div>';
																					h += '<div><div class="xuangou_left fl"><a href="/b2c/web/liebiao.jsp?name=&typeCode='+dom.code+'"><span class="fl">'
																							+ dom.name
																							+ '</span><div class="clear"></div></a></div><div class="clear"></div></div>'

																				});
																$(
																		"#div_"
																				+ code)
																		.html(h);

															}
														})

											});

						}
					})

		}
	</script>



</body>
</html>