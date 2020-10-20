<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/jsp/header.jsp"%>
<title>用户维护</title>
</head>
<body>
    <fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
        <legend>用户维护--修改密码</legend>
    
    <form class="layui-form" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="code" readonly lay-verify="required" placeholder="请输入账号" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">旧密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" placeholder="请输入旧密码" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password1" lay-verify="required" placeholder="请输入新密码" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password2" lay-verify="required" placeholder="请再次输入新密码" autocomplete="off"
                    class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <div class="layui-input-inline">
                <input type="button" class="layui-btn" lay-submit lay-filter="pasUser" value="确定" />
                <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
            </div>
        </div>
        <input type="hidden" name="action" value="pasUser" />
    </form>
    </fieldset>
    <script type="text/javascript">
    $("input[name='code']").val('<%=request.getParameter("code1")%>');
//     $("input[name='usercode']").prop("readonly","readonly");
    formSubmit('/user/updpass.do', 'submit(pasUser)', 'text', function(data) {
    	if (data == 1) {
            layer.msg('修改成功');
            closeThis(500);
        } else if(data == 2) {
            layer.msg('旧密码错误');
        }
    	else {
    		layer.msg('两次密码不一致');
		}
    });
    </script>
</body>
</html>