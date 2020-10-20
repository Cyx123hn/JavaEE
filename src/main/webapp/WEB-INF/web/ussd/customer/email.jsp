<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/jsp/header.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>发送邮件</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>发送邮件</legend>
    <form class="layui-form" lay-filter="formA" method="post" >
		
        <div class="layui-form-item">
            <label class="layui-form-label">主题</label>
            <div class="layui-input-inline">
                <input type="text" id="title" name="title"  lay-verify="required" placeholder="请输入邮件主题" autocomplete="off"
                    class="layui-input" ">
            </div>
        </div>
  		 <div class="layui-form-item">
            <label class="layui-form-label">内容</label>
<!--             <div class="layui-input-inline"> -->
<!--                 <input type="text" name="content"  lay-verify="required" placeholder="请输入邮件内容" autocomplete="off" -->
<!--                     class="layui-input" "> -->
               <textarea id="demo" name="content" style="display: none;"></textarea>
            </div>
<!--         </div> -->
 <div class="layui-form-item">
            <label class="layui-form-label">定时时间</label>
            <div class="layui-input-inline">
                <input type="text" id="test1" name="time" lay-verify="required" class="layui-input" >
            </div>
        </div>
     <input id="mail" type="hidden" name="email" value="${mail }">
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" onclick="sendEmail()"  value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
    </form>
    </fieldset>
    
<script type="text/javascript">
laydate.render({
	  elem: '#test1' //指定元素
	 ,type: 'datetime'
	});
var layedit = layui.layedit;
var index= layedit.build('demo'); 
function sendEmail(){
	var content = layedit.getText(index);
	var email =$("#mail").val();
	var title =$("#title").val();
	var time =$("#test1").val();
ajax('/customer/email.do',{content:content,title:title,email:email,time:time},'text',function(data){
	if (data == 1) { 
 		layer.msg('发送成功');
 			closeThis(500);
		} else {
 		layer.msg('发送失败');
		 closeThis(500);
		}
})
}
</script>  

</body>
</html>