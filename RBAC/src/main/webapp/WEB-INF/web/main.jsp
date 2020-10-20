<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>基于角色访问权限的企业管理系统</title>
    <link rel='Shortcut Icon' type='image/x-icon' href='/RBAC1/web/win10-ui-1.1.2.4/img/windows.ico'>
    <script type="text/javascript" src="/RBAC1/web/win10-ui-1.1.2.4/js/jquery-2.2.4.min.js"></script>
    <link href="/RBAC1/web/win10-ui-1.1.2.4/css/animate.css" rel="stylesheet">
    <script type="text/javascript" src="/RBAC1/web/win10-ui-1.1.2.4/component/layer-v3.0.3/layer/layer.js"></script>
    <link rel="stylesheet" href="/RBAC1/web/win10-ui-1.1.2.4/component/font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="/RBAC1/web/win10-ui-1.1.2.4/css/default.css" rel="stylesheet">
    <script type="text/javascript" src="/RBAC1/web/win10-ui-1.1.2.4/js/win10.js"></script>
    <style>
        * {
            font-family: "Microsoft YaHei", 微软雅黑, "MicrosoftJhengHei", 华文细黑, STHeiti, MingLiu
        }

        /*磁贴自定义样式*/
         .win10-block-content-text {
             line-height: 44px;
             text-align: center;
             font-size: 16px;
         }
    </style>
    <script>
        Win10.onReady(function () {

            //设置壁纸
            Win10.setBgUrl({
                main: '/RBAC1/web/win10-ui-1.1.2.4/img/wallpapers/index.jpg',
                mobile: '/RBAC1/web/win10-ui-1.1.2.4/img/wallpapers/mobile.jpg',
            });

            Win10.setAnimated([
                'animated flip',
                'animated bounceIn',
            ], 0.01);
        });
        function openMenu(){
            Win10.openUrl('/RBAC1/menu/toMenu.do','<img class=\'icon\' src=\'/RBAC1/web/win10-ui-1.1.2.4/img/icon/blogger.png\'/>菜单信息管理');
            }
        function openRole(){
        	Win10.openUrl('/RBAC1/role/toRole.do','<img class=\'icon\' src=\'/RBAC1/web/win10-ui-1.1.2.4/img/icon/blogger.png\'/>角色信息管理')
            }
        console.log('${user.roleCode }');
    </script>
</head>
<body>
<div id="win10">
    <div class="desktop">
        <div id="win10-shortcuts" class="shortcuts-hidden">
<!--            <div class="shortcut win10-open-window" data-url="/RBAC1/user/toUser.do"> -->
<!--                 <i class="fa fa-user icon black-green"></i> -->
<!--                 <div class="title">用户信息管理</div> -->
<!--             </div> -->
           
<!--             <div class="shortcut" onclick="openMenu()"> -->
<!--                 <img class="icon" src="/RBAC1/web/win10-ui-1.1.2.4/img/icon/demo.png"/> -->
<!--                 <div class="title">菜单信息管理</div> -->
<!--             </div> -->
<!--               <div class="shortcut" onclick="openRole()"> -->
<!--                 <img class="icon" src="/RBAC1/web/win10-ui-1.1.2.4/img/icon/blogger.png"/> -->
<!--                 <div class="title">角色信息管理</div> -->
<!--             </div> -->
<!--             <div class="shortcut win10-open-window" data-url="/RBAC1/rel/toRel.do"> -->
<!--                 <i class="icon fa fa-fw fa-bank red" ></i> -->
<!--                 <div class="title">权限信息管理</div> -->
<!--             </div> -->
            <c:forEach items="${menu}" var="l">
            <c:forEach items="${l.child}" var="l2">
           <div class="shortcut win10-open-window" data-url="/RBAC1/${l2.menuUrl }">
                <img class="icon" src="/RBAC1/web/win10-ui-1.1.2.4/img/icon/${l2.img }"/>
                <div class="title">${l2.name}</div>
            </div>
          </c:forEach>
          </c:forEach>
        </div>
        <div id="win10-desktop-scene"></div>
    </div>
    <div id="win10-menu" class="hidden">
        <div class="list win10-menu-hidden animated animated-slideOutLeft">
         <c:forEach items="${menu}" var="l">
        <div class="item"><i class="red icon fa fa-wrench fa-fw"></i><span>${l.name }</span></div>
        <c:forEach items="${l.child}" var="l2">
            <div class="sub-item" onclick="Win10.openUrl('/RBAC1/${l2.menuUrl}}','${l2.name }')">${l2.name }</div>
          </c:forEach>
            </c:forEach>
            <div class="item"
                 onclick="Win10.exit()">
                <i class="black icon fa fa-power-off fa-fw"></i><span class="title">关闭</span>
            </div>
        </div>
        <div class="blocks">
        
            <div class="menu_group">
                <div class="title">Welcome</div>
               <div loc="1,4" size="4,4" class="block">
                    <div class="content blue cover" style="font-size: 30px;line-height: 176px;text-align: center">
                        <i class="fa fa-cloud fa-fw"></i> 天气
                    </div>
                    <div class="content detail" style="background-color: rgb(46,147,217)">
<!--                         <iframe src="//www.seniverse.com/weather/weather.aspx?uid=U43DF172E7&cid=CHBJ000000&l=&p=SMART&a=1&u=C&s=13&m=2&x=1&d=1&fc=&bgc=2E93D9&bc=&ti=0&in=0&li=" frameborder="0" scrolling="no" width="200" height="300" allowTransparency="true"></iframe> -->
                    </div>
                </div>
                <div loc="1,1" size="6,3" class="block">
                    <div class="content red detail" >
<!--                         <iframe style="margin-top: 10px" frameborder="no" border="0" marginwidth="0" marginheight="0" width=264 height=110 src="//music.163.com/outchain/player?type=2&id=110771&auto=0&height=90"></iframe> -->
                    </div>
                    <div class="content red cover">
                        <img width="264" style="position: relative;top: -50px;" src="/RBAC1/web/win10-ui-1.1.2.4/img/presentation/wangyiyun.gif" />
                    </div>
                </div>
                  <div loc="5,4" size="2,2" class="block">
                    <div class="content">
                        <img style="display: inline-block;border-radius: 4px" width="88px" src="http://q2.qlogo.cn/headimg_dl?bs=824831811&dst_uin=824831811&src_uin=824831811&fid=824831811&spec=100&url_enc=0&referer=bu_interface&term_type=PC"/>
                    </div>
                </div>
            </div>
        </div>
        <div id="win10-menu-switcher"></div>
    </div>
    <div id="win10_command_center" class="hidden_right">
        <div class="title">
            <h4 style="float: left">消息中心 </h4>
            <span id="win10_btn_command_center_clean_all">全部清除</span>
        </div>
        <div class="msgs"></div>
    </div>
    <div id="win10_task_bar">
        <div id="win10_btn_group_left" class="btn_group">
            <div id="win10_btn_win" class="btn"><span class="fa fa-windows"></span></div>
            <div class="btn" id="win10-btn-browser"><span class="fa fa-internet-explorer"></span></div>
        </div>
        <div id="win10_btn_group_middle" class="btn_group"></div>
        <div id="win10_btn_group_right" class="btn_group">
            <div class="btn" id="win10_btn_time"></div>
            <div class="btn" id="win10_btn_command"><span id="win10-msg-nof" class="fa fa-comment-o"></span></div>
            <div class="btn" id="win10_btn_show_desktop"></div>
        </div>
    </div>
</div>
</body>
</html>