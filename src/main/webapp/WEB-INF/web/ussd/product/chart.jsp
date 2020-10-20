<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ include file="/web/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="main" style="width: 600px;height:400px;"></div>
 <div id="main1" style="width: 600px;height:400px;"></div>
	<script type="text/javascript">
	console.log('${list}');
		var myChart = echarts.init(document.getElementById('main'));
		var myChart1 = echarts.init(document.getElementById('main1'));
		var option = {
				title: {
	                text: '商品数量折线图'
	            },
			    xAxis: {
			        type: 'category',
			        data: ${name}
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [{
			        data: ${value},
			        type: 'line'
			    }]
			};
		myChart.setOption(option);
		var option1 = {
				title: {
					x: 'center',
	                text: '内圈商品价格，外圈商品数量'
	            },
		    tooltip: {
		        trigger: 'item',
		        formatter: "{a} <br/>{b}: {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        x: 'left',
		        data:${name}
		    },
		    series: [
		        {
		            name:'访问来源',
		            type:'pie',
		            selectedMode: 'single',
		            radius: [0, '30%'],

		            label: {
		                normal: {
		                    position: 'inner'
		                }
		            },
		            labelLine: {
		                normal: {
		                    show: false
		                }
		            },
		            data:${list1}
		        },
		        {
		            name:'访问来源',
		            type:'pie',
		            radius: ['40%', '55%'],
		            label: {
		                normal: {
		                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
		                    backgroundColor: '#eee',
		                    borderColor: '#aaa',
		                    borderWidth: 1,
		                    borderRadius: 4,
		                    // shadowBlur:3,
		                    // shadowOffsetX: 2,
		                    // shadowOffsetY: 2,
		                    // shadowColor: '#999',
		                    // padding: [0, 7],
		                    rich: {
		                        a: {
		                            color: '#999',
		                            lineHeight: 22,
		                            align: 'center'
		                        },
		                        // abg: {
		                        //     backgroundColor: '#333',
		                        //     width: '100%',
		                        //     align: 'right',
		                        //     height: 22,
		                        //     borderRadius: [4, 4, 0, 0]
		                        // },
		                        hr: {
		                            borderColor: '#aaa',
		                            width: '100%',
		                            borderWidth: 0.5,
		                            height: 0
		                        },
		                        b: {
		                            fontSize: 16,
		                            lineHeight: 33
		                        },
		                        per: {
		                            color: '#eee',
		                            backgroundColor: '#334455',
		                            padding: [2, 4],
		                            borderRadius: 2
		                        }
		                    }
		                }
		            },
		            data:${list}
		        }
		    ]
		};
		myChart1.setOption(option1);
	</script>
</body>
</html>