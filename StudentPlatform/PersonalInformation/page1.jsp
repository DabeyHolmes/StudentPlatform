<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/18
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="person.jsp"%>
<html>
<head>
    <script src="/StudentPlatform/PersonalInformation/assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="/StudentPlatform/PersonalInformation/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="/StudentPlatform/PersonalInformation/assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="/StudentPlatform/PersonalInformation/assets/css/app.css">
    <script src="/StudentPlatform/PersonalInformation/assets/js/jquery.min.js"></script>
    <title>更改信息</title>
</head>
<body data-type="index" class="theme-white">
<script language="JavaScript">
    function auto() {


        if ($(window).width() < 1024) {
            $('.left-sidebar').addClass('active');
        } else {
            $('.left-sidebar').removeClass('active');
        }
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
    function checkname() {
        if(name1.value.length>20){
            alert("昵称长度过长");
            name1.value = "";
        }
    }
    function checkage() {
        var reg = /^[\d]+$/;
        var num = age.value;
        var length = num.length;
        ok = reg.test(num);
        if(!ok){
            alert("年龄格式错误");
            age.value = "";
        }else if(length >10){
            alert("年龄长度错误");
            age.value = "";
        }
    }
    function checkphone() {
        var reg = /^[\d]+$/;
        var num =phone.value;
        var length = num.length;
        ok = reg.test(num);
        if(!ok){
            alert("电话格式错误");
            phone.value = "";
        }else if(length >20){
            alert("电话长度错误");
            phone.value = "";
        }
    }
    function checksign() {
        if(sign.value.length>200){
            alert("内容长度过长");
            sign.value = "";
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
            <!-- 侧边切换 -->
            <div class="am-fl tpl-header-switch-button am-icon-list" onclick="cli()">
                    <span>

                </span>
            </div>
            <div class="am-fr tpl-header-navbar">
                <ul>
                    <!-- 欢迎语 -->
                    <li class="am-text-sm tpl-header-navbar-welcome">
                        <a href="/StudentPlatform/PersonalInformation/page2.jsp">欢迎你, <span><%=id%></span> </a>
                    </li>
                    <li class="am-text-sm">
                        <a href="/StudentPlatform/PersonalInformation/index.jsp">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </header>
    <div class="left-sidebar">
        <!-- 用户信息 -->
        <div class="tpl-sidebar-user-panel">
            <div class="tpl-user-panel-slide-toggleable">
                <div class="tpl-user-panel-profile-picture">
                    <img src="show.jsp">
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
    <div class="tpl-content-wrapper">

        <div class="container-fluid am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                    <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 个人中心 <small>welcome</small></div>
                    <p class="page-header-description">欢迎来到个人中心。</p>
                </div>
            </div>

        </div>

        <div class="row-content am-cf">
            <div class="row  am-cf">
                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6 am-u-sm-centered am-u-md-centered am-u-lg-centered">
                    <form class="am-form" action="change.jsp" method="post">
                        <div class="am-form-group">
                            <label>账号</label>
                            <input type="text" name="id" id="id" value="<%=id%>" readonly="readonly" style="outline: medium;border: none;"></div>
                        <div class="am-form-group">
                            <label>昵称:</label>
                            <input type="text" name="name" id="name1" value="<%=name%>" onblur="checkname()"></div>
                        <div class="am-form-group">
                            <label>性别:</label>
                            <!--<input type="text" name="sex" id="sex" value="<%=sex%>" onblur="checksex()"></div>-->
                        <select name="sex">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                        <div class="am-form-group">
                            <label>年龄:</label>
                            <input type="text" name="age" id="age" value="<%=age%>" onblur="checkage()"></div>
                        <div class="am-form-group">
                            <label>邮箱:</label>
                            <input type="text" name="post" id="post" value="<%=post%>" readonly="readonly" style="outline: medium;border: none;"></div>
                        <div class="am-form-group">
                            <label>电话:</label>
                            <input type="text" name="phone" id="phone" value="<%=phone%>" onblur="checkphone()"></div>
                        <div class="am-form-group">
                            <label>个人简介:</label>
                            <textarea type="text" name="sign" id="sign" value="<%=sign%>" onblur="checksign()" rows="3" style="width: 60%"></textarea>
                        </div>
                        <input type="submit" value="确认更改" class="am-btn am-round am-btn-secondary">
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
