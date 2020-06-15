<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/18
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%@include file="person.jsp"%>
<html>
<head>
    <title>个人信息</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="/StudentPlatform/PersonalInformation/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="/StudentPlatform/PersonalInformation/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="/StudentPlatform/PersonalInformation/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="/StudentPlatform/PersonalInformation/assets/css/app.css">
    <script src="/StudentPlatform/PersonalInformation/assets/js/jquery.min.js"></script>
    <script src="/StudentPlatform/PersonalInformation/js/fileinput.js" type="text/javascript"></script>
    <link href="/StudentPlatform/PersonalInformation/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body data-type="index" class="theme-white">
<script>

    function auto() {

        if ($(window).width() < 1024) {
            $('.left-sidebar').addClass('active');
        } else {
            $('.left-sidebar').removeClass('active');
        }
    }
    function c () {
        var r= new FileReader();
        f=document.getElementById('file').files[0];

        r.readAsDataURL(f);
        r.onload=function (e) {
            document.getElementById('show').src=this.result;
        };
    }
    auto();
    function cli () {

            if ($('.left-sidebar').is('.active')) {
                if ($(window).width() > 1024) {
                    $('.tpl-content-wrapper').removeClass('active');
                }
                $('.left-sidebar').removeClass('active');
            } else {

                $('.left-sidebar').addClass('active');
                if ($(window).width() > 1024) {
                    $('.tpl-content-wrapper').addClass('active');
                }
            }

    }
</script>
<div class="am-g tpl-g">
    <!-- 头部 -->
    <header>
        <!-- logo -->
        <div class="am-fl tpl-header-logo">
            <a href="javascript:;">东大园地</a>
        </div>
        <!-- 右侧内容 -->
        <div class="tpl-header-fluid">
            <div class="am-fl tpl-header-switch-button am-icon-list"  onclick="cli()">
                    <span>
                    </span>
            </div>
            <!-- 搜索 -->
            <!-- 其它功能-->
            <div class="am-fr tpl-header-navbar">
                <ul>
                    <!-- 欢迎语 -->
                    <li class="am-text-sm tpl-header-navbar-welcome">
                        <a href="/StudentPlatform/PersonalInformation/page2.jsp">欢迎你, <span><%=id%></span> </a>
                    </li>

                    <!-- 新邮件 -->
                    <!-- 退出 -->
                    <li class="am-text-sm">
                        <a href="/StudentPlatform/PersonalInformation/index.jsp">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </header>
    <!-- 风格切换 -->
    <!-- 侧边导航栏 -->
    <div class="left-sidebar">
        <!-- 用户信息 -->
        <div class="tpl-sidebar-user-panel">
            <div class="tpl-user-panel-slide-toggleable">
                <div class="tpl-user-panel-profile-picture">
                    <img src="/StudentPlatform/PersonalInformation/show.jsp">
                </div>
                <span class="user-panel-logged-in-text">
             <%=name%>
          </span>

            </div>
        </div>

        <!-- 菜单 -->
        <ul class="sidebar-nav">

            <li class="sidebar-nav-link">
                <a href="index.html" class="active">
                    <i class="am-icon-home sidebar-nav-link-logo"></i> 个人中心
                </a>
            </li>
            <li class="sidebar-nav-link"> <a href="http://localhost:8080/liulin/index.jsp"> <em class="am-icon-table sidebar-nav-link-logo"></em> 资料分享</a> </li>
            <li class="sidebar-nav-link"> <a href="/StudentPlatform/PersonalInformation/userslist.jsp?personid=<%=id %>&name=<%=name%>"> <em class="am-icon-facebook-official sidebar-nav-link-logo"></em> 用户列表</a> </li>
            <li class="sidebar-nav-link"> <a href="/StudentPlatform/Activity/chuan.jsp?personid=<%=id %>&name=<%=name%>"> <em class="am-icon-calendar sidebar-nav-link-logo"></em> 活动日历</a> </li>
            <li class="sidebar-nav-link"> <a href="/StudentPlatform/Competition/check.jsp?personid=<%=id %>&name=<%=name%>"> <em class="am-icon-wpforms sidebar-nav-link-logo"></em> 竞赛报名</a> </li>
            <li class="sidebar-nav-link"> <a href="/StudentPlatform/Tieba/check.jsp?personid=<%=id %>&name=<%=name%>"> <em class="am-icon-weixin sidebar-nav-link-logo"></em>在线聊天</a> </li>
        </ul>

    </div>


    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">

        <div class="container-fluid am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-9  am-u-sm-centered am-u-md-centered am-u-lg-centered">
                    <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 个人中心 <small>welcome</small></div>
                    <p class="page-header-description">欢迎登陆个人中心</p>
                </div>
            </div>

        </div>
        <div class="row-content am-cf">
            <div class="row  am-cf">
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6 am-u-sm-centered am-u-md-centered am-u-lg-centered">
                    <form enctype="multipart/form-data" class="am-form" method="post" action="/Upload" >
                          <i class="am-icon-cloud-upload"></i><input type="file" name="image" accept="image/*" value="选择图片更换头像" id="file" onchange="c()" class="file">
                    </form>
                    <form class="am-form" method="post" action="/StudentPlatform/PersonalInformation/page1.jsp">
                        <label>账号：</label><div class="am-form-group"><input style="background-color: #ffffff" type="text" readonly name="id" value="<%=id%>"
                                                                            style="outline: medium;border: none;"></div>
                        <label>昵称：</label><div class="am-form-group"><input style="background-color: #ffffff" type="text" readonly name="name" value="<%=name%>"
                                                                            style="outline: medium;border: none;"></div>
                        <label>性别：</label><div class="am-form-group"><input style="background-color: #ffffff" type="text" readonly name="sex" value="<%=sex%>" style="outline: medium;border: none;"></div>

                        <label>年龄：</label><div class="am-form-group"><input style="background-color: #ffffff" type="text" readonly name="age" value="<%=age%>" style="outline: medium;border: none;"></div>

                        <label>邮箱：</label><div class="am-form-group"><input style="background-color: #ffffff" type="text" readonly name="post" value="<%=post%>" style="outline: medium;border: none;"></div>

                        <label>电话：</label><div class="am-form-group"><input style="background-color: #ffffff" type="text" readonly name="phone" value="<%=phone%>" style="outline: medium;border: none;"></div>

                        <label>个人简介：</label><div class="am-form-group"><input style="background-color: #ffffff" type="text" readonly name="sign" value="<%=sign%>" style="outline: medium;border: none;"></div>



                        <div class="am-form-group"><input class="am-btn am-round am-btn-secondary" value="更改信息" type="submit"></div>

                    </form>
                    
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="/StudentPlatform/PersonalInformation/assets/js/amazeui.min.js"></script>
<script src="/StudentPlatform/PersonalInformation/assets/js/amazeui.datatables.min.js"></script>
<script src="/StudentPlatform/PersonalInformation/assets/js/dataTables.responsive.min.js"></script>
<script src="/StudentPlatform/PersonalInformation/assets/js/app.js"></script>
</body>
</html>
