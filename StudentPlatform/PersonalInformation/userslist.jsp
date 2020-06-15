<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/18
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%@ page import="java.sql.*" %>
<%@include file="person.jsp" %>
<html>
<head>
    <title>个人信息</title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath }/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <script src="assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css"/>
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="assets/js/jquery.min.js"></script>
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

    auto();

    function cli() {

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
            <div class="am-fl tpl-header-switch-button am-icon-list" onclick="cli()">
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
            <li class="sidebar-nav-link"> <a href="tables.html"> <em class="am-icon-table sidebar-nav-link-logo"></em> 资料分享</a> </li>
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
                    <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 个人中心
                        <small>welcome</small>
                    </div>
                    <p class="page-header-description">欢迎登陆个人中心</p>
                </div>
            </div>

        </div>
        <div class="row-content am-cf">
            <div class="row">

                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">用户列表</div>
                            <div class="widget-function am-fr">
                                <a href="javascript:;" class="am-icon-cog"></a>
                            </div>
                        </div>
                        <div class="widget-body  widget-body-lg am-fr">

                            <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black "
                                   id="example-r">
                                <thead>
                                <tr>
                                    <th> 账号</th>
                                    <th> 姓名</th>
                                    <th>性别</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    String driver = "com.mysql.jdbc.Driver";
                                    String url = "jdbc:mysql://localhost:3306/person?useUnicode=true&characterEncoding=utf-8";//URL指向访问的数据库名
                                    String user = "root";//Mysql配置时的用户名
                                    String password = "dzb19980322";//密码
                                    try {
                                        Class.forName(driver);//加载驱动程序
                                        Connection conn = DriverManager.getConnection(url, user, password);//链接数据库
                                        Statement ststment = conn.createStatement();//用来执行sql语言
                                        String sql = "SELECT * FROM person_info";
                                        ResultSet rs = ststment.executeQuery(sql);
                                        int i = 0;
                                        while (rs.next()) {
                                            String ss = "gradeX";
                                            if(i%2!=0){
                                                ss = "gradeC";
                                            }
                                            String p_id = rs.getString("id");
                                            String p_name = rs.getString("name");
                                            String p_sex = rs.getString("sex");
                                %>
                                <tr class="<%=ss%>">
                                    <td><%=p_id%></td>
                                    <td><%=p_name%></td>
                                    <td><%=p_sex%></td>
                                    <td>
                                        <div class="tpl-table-black-operation">
                                            <a href="guanzhu.jsp?id_1=<%=id%>&id_2=<%=p_id %>" class="tpl-table-black-operation-del">
                                                <i class="am-icon-star"></i> 关注
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                        }
                                        rs.close();
                                        conn.close();
                                    } catch (ClassNotFoundException e) {
                                        System.out.println("No Drive!");
                                        e.printStackTrace();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>


                                <!-- more data -->
                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>

                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">关注列表</div>
                            <div class="widget-function am-fr">
                                <a href="javascript:;" class="am-icon-cog"></a>
                            </div>
                        </div>
                        <div class="widget-body  widget-body-lg am-fr">

                            <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                <thead>
                                <tr>
                                    <th> 账号</th>
                                    <th> 姓名</th>
                                    <th>性别</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    try {
                                        Class.forName(driver);//加载驱动程序
                                        Connection conn = DriverManager.getConnection(url, user, password);//链接数据库
                                        Statement ststment1 = conn.createStatement();//用来执行sql语言

                                        String sql1 = "SELECT * FROM likelist WHERE id_1 = '"+id+"'";
                                        ResultSet rs1 = ststment1.executeQuery(sql1);
                                        int i = 0;
                                        while (rs1.next()) {
                                            Statement ststment2 = conn.createStatement();
                                            String guanzhu = rs1.getString("id_2");
                                            String sql2 = "SELECT * FROM person_info WHERE id = '"+guanzhu+"'";
                                            System.out.println("sql2:"+sql2);
                                            ResultSet rs2 = ststment2.executeQuery(sql2);
                                            while (rs2.next()){
                                                String ss = "gradeX";
                                                if(i%2!=0){
                                                    ss = "gradeC";
                                                }
                                                String p_id1 = rs2.getString("id");
                                                String p_name1 = rs2.getString("name");
                                                String p_sex1 = rs2.getString("sex");

                                %>
                                <tr class="<%=ss%>">
                                    <td><%=p_id1%></td>
                                    <td><%=p_name1%></td>
                                    <td><%=p_sex1%></td>
                                    <td>
                                        <div class="tpl-table-black-operation">
                                            <a href="quxiao.jsp?id_1=<%=id%>&id_2=<%=p_id1 %>" class="tpl-table-black-operation-del">
                                                <i class="am-icon-star-o"></i> 取消关注
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                        }rs2.close();}
                                        rs1.close();
                                        conn.close();
                                    } catch (ClassNotFoundException e) {
                                        System.out.println("No Drive!");
                                        e.printStackTrace();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>


                                <!-- more data -->
                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/amazeui.datatables.min.js"></script>
<script src="assets/js/dataTables.responsive.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
