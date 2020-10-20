<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="../res/static/css/main.css">
<link rel="stylesheet" type="text/css" href="../res/layui/css/layui.css">
<script type="text/javascript" src="../res/layui/layui.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<link rel="stylesheet" type="text/css" href="../common/css/style2.css">




</head>
<%@   include file="/web/head.jsp"%>
<body>

	<!-- start banner_x -->
	<div class="banner_x center">

		<div class="nav fl">

			<ul>
				<li><a href="../index.jsp"> <img
						src="../common/img/lunbo/timg.jpg  "
						style="width: 70px; height: 50px" />
				</a></li>
				<li><a href="../liebiao.jsp?name=小米">小米手机</a></li>
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





	<div class="content content-nav-base shopcart-content">
		<div class="cart w1200">
			<div class="cart-table-th">
				<div class="th th-chk">
					<div class="select-all">
						<div class="cart-checkbox"></div>
						<label></label>
					</div>
				</div>
				<div class="th th-item">
					<div class="th-inner">商品</div>
				</div>
				<div class="th th-price">
					<div class="th-inner">单价</div>
				</div>
				<div class="th th-amount">
					<div class="th-inner">数量</div>
				</div>
				<div class="th th-sum">
					<div class="th-inner">小计</div>
				</div>
				<div class="th th-op">
				
				</div>
			</div>
			<div class="OrderList">
				<div class="order-content" id="list-cont"></div>
			</div>

			<div class="FloatBarHolder layui-clear">
				<div class="th th-chk">
					<div class="select-all">
						<div class="cart-checkbox">
							收货地址：<input class="layui-input" id="typeCode" name="typeCode"
								type="text" value="">

						</div>

					</div>
				</div>
				<div class="th batch-deletion"></div>
				<div class="th Settlement">
					<button class="layui-btn" onclick="add()">提交订单</button>
				</div>
				<div class="th total"></div>
			</div>
		</div>
	</div>
	<script type="text/html" id="addit">
       <ul class="item-content layui-clear">
            <li class="th th-chk">
              <div class="select-all">
                <div class="cart-checkbox">
                
                </div>
              </div>
            </li>
            <li class="th th-item">
              <div class="item-cont">
                <a href="javascript:;"><img src="/img/{{d.url}}" alt=""></a>
                <div class="text">
                  <div class="title">{{d.name}}</div>
                  <p><span>{{d.name}}</span>  <span></span>cm</p>
                </div>
              </div>
            </li>
            <li class="th th-price">
              <span class="th-su">{{d.price}}</span>
            </li>
            <li class="th th-amount">
              <div class="box-btn layui-clear">
               
                <input class="Quantity-input" type="" name="{{d.id}}" value="{{d.num}}" disabled="disabled">
               
              </div>
            </li>
            <li class="th th-sum">
              <span class="sum">{{d.subtotal}}</span>
            </li>
            <li class="th th-op">
             
            </li>
          </ul>
	</script>

	<script type="text/javascript">
layui.config({
    base: '../res/static/js/util/' //你存放新模块的目录，注意，不是layui的模块目录
  }).use(['mm','jquery','element','car'],function(){
    var mm = layui.mm,$ = layui.$,element = layui.element,car = layui.car;

var tt='<%=request.getParameter("ids")%>'

init();
function init(){
	console.log(tt)
	
	var tt2=tt.split(',');

	for(var i=0;i<tt2.length;i++){
		
		$.ajax({
			type : "post",
			url : con.app + "/orderCar/selectModel.do",
			dataType : "json",
			data : {
			id:tt2[i]
			}, //data发送到服务器

			success : function(data) {

				var html = "";
				$.each(data.list, function(i, dom) {
					var id = dom.id ? dom.id : '';
					var url = dom.url ? dom.url : '';
					var num = dom.num;
					var price = dom.price ? dom.price : '';
					var code = dom.code;
					var name = dom.name;
					var subtotal = dom.subtotal;
					var d = {
						url : url,
						code : code,
					    num:  num,
						price : price,
						name : name,
						id:id,
						subtotal:subtotal
					};
					var laytpl = layui.laytpl;
					var ht = $("#addit").html()
					var st = laytpl(ht).render(d)
					$("#list-cont").append(st);
					
					
				});
				car.init();
			}
		});
		
		
	}
	
}

  });
</script>

	<script type="text/javascript">

function add(){
	insert();
}
</script>
	<script type="text/javascript">
var tt='<%=request.getParameter("ids")%>'
		console.log(tt)
		var tt2 = tt.split(',');
		var userCode = '${user.code}';
		// var userCode='b001'

		console.log(typeCode)
		function insert() {
			var typeCode = $("#typeCode").val();
			//alert(typeCode + "1")
			$.ajax({
				type : "post",
				url : con.app + "/order/add.do",
				dataType : "json",
				data : {
					userCode : userCode,
					typeCode : typeCode,
					state : '未发货',
					vids : tt
				}, //data发送到服务器

				success : function(data) {
					if (data == 0) {
						layer.msg("添加成功");
						location.href = con.app + "/web/car/order.jsp";
					} else if (data == 1) {
						layer.msg("账号已存在");
					} else {
						layer.msg("注册失败");
					}
				}
			});

		}
	</script>
	
</body>
</html>