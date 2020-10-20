<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>图片维护</title>
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>高级应用：制作一个多文件列表</legend>
	</fieldset>

	<div class="layui-upload">
		<button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
		<button type="button" class="layui-btn" id="testListAction">开始上传</button>
		<div class="layui-upload-list">
			<table class="layui-table">
				<thead>
					<tr>
						<th>文件名</th>
						<th>大小</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="demoList"></tbody>
			</table>
		</div>

	</div>

	<fieldset class="layui-elem-field layui-field-title"
		style="margin: 10px; padding: 15px;">
		<legend>图片列表</legend>
		<button type="button" class="layui-btn" id="test1">
			<i class="layui-icon">&#xe67c;</i>上传图片
		</button>
		<div class="layui-upload-list">
			<table class="layui-table">
				<thead>
					<tr>
						<th width="5%">文件名</th>
						<th width="10%">图片</th>
						<th width="10%">操作</th>
					</tr>
				</thead>
				<tbody id="demoList2"></tbody>
			</table>
		</div>
	</fieldset>

	<script type="text/javascript" src="<%=path%>/common.js"></script>

	<script type="text/javascript">
var code='<%=request.getParameter("goodsCode")%>';
//多文件列表示例
var demoListView = $('#demoList')
,uploadListIns = upload.render({
  elem: '#testList'
  ,url: con.app+'/goodsImgUpload/pic.do'
  ,data:{code:code}
  ,accept: 'imgages'
  ,multiple: true
  ,auto: false
  ,bindAction: '#testListAction'
  ,choose: function(obj){   
    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
    //读取本地文件
    obj.preview(function(index, file, result){
      var tr = $(['<tr id="upload-'+ index +'">'
        ,'<td>'+ file.name +'</td>'
        ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
        ,'<td>等待上传</td>'
        ,'<td>'
          ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
          ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
        ,'</td>'
      ,'</tr>'].join(''));
      
      //单个重传
      tr.find('.demo-reload').on('click', function(){
        obj.upload(index, file);
      });
      
      //删除
      tr.find('.demo-delete').on('click', function(){
        delete files[index]; //删除对应的文件
        tr.remove();
        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
      });
      
      demoListView.append(tr);
    });
  }
  ,done: function(res, index, upload){
    if(res.code == 0){ //上传成功
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
      tds.eq(3).html(''); //清空操作
      init();
      return delete this.files[index]; //删除文件队列已经上传成功的文件
    }
    this.error(index, upload);
  }
  ,error: function(index, upload){
    var tr = demoListView.find('tr#upload-'+ index)
    ,tds = tr.children();
    tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
    tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
  }
});


</script>

	<script type="text/javascript">
	    var code='<%=request.getParameter("goodsCode")%>';
	    function delPic(id){
	    	alert(id);
		    openConfirm(function(index){
		        ajax('/goodsImg/delPic.do', {id:id}
		        , 'text', function(data){
		            if (data == 1) {
		                layer.msg('删除成功');
		                init();//$("#demoList2").html('')
		            } else {
		                layer.msg('删除成功，该编号已被使用');
		            }
		        })
		    })
		}
		init();
		function init(){
			
			ajax('/goodsImg/getPic.do', { goodsCode:code}
			 , 'json', function(data){
				 var html=""
				 $.each(data,function(i, dom) {
					
					 var url = dom.url?dom.url:'';
					  var id=dom.id;
						 html +="<tr><td>"+url+"</td><td>"
				            +'<img src="/img/'+ url +'" alt="'+ url +'" class="layui-upload-img">'
				            +"</td><td><input type='button' class='layui-btn' onclick='delPic(\""+id+"\")' value='删除' />"
				            
				            +"<input type='button' class='layui-btn' onclick='setMain(\""+id+"\")' value='设为主图' />"
				            +"</td></tr>";
					   
				 });
					
		$("#demoList2").html(html);
				
				 				 
            });
	}
	
		
</script>
<script type="text/javascript">
function setMain(id){
    openConfirm(function(index){
        ajax('/prodpic/setMain.do', {id:id}
        , 'text', function(data){
            if (data == 1) {
                layer.msg('设置成功');
                init();//$("#demoList2").html('')
            } else {
                layer.msg('设置失败');
            }
        })
    })
}

</script>


</body>
</html>