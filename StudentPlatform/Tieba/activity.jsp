<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="javax.servlet.ServletInputStream" %>
<%@ page import="java.text.SimpleDateFormat" %>

<pages maintainScrollPositionOnPostBack="true"></pages>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>论坛</title>
    <link type="text/css" href="/StudentPlatform/Tieba/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" href="/StudentPlatform/Tieba/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link type="text/css" href="/StudentPlatform/Tieba/css/theme.css" rel="stylesheet">
    <link type="text/css" href="/StudentPlatform/Tieba/images/icons/css/font-awesome.css" rel="stylesheet">
    <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
          rel='stylesheet'>
    <link type="text/css" href="/StudentPlatform/Tieba/css/1112223.css" rel='stylesheet'>
</head>
<body>

<%
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
    String text = request.getParameter("text");
    String name = (String) session.getAttribute("name");
    String personId = (String) session.getAttribute("personId");
    String img_name = request.getParameter("img_name");
    String thelike = request.getParameter("thelike");

    Random r = new Random();
    SimpleDateFormat f = new SimpleDateFormat("yy_MM_dd_HH_mm_ss");
    Date d = new Date();
    String T_id = f.format(d) + r.nextInt();

    Class.forName("com.mysql.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost/tieba",
            "root", "dzb19980322");
    System.out.println("!!!!!!");
    System.out.println("Success connect Mysql server!");
    String id = (String) request.getParameter("id");
    System.out.println(id);

    Statement stmt = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

    if (!(T_id == null) && !T_id.equals("") && !(personId == null) && !personId.equals("") &&
            !(name == null) && !name.equals("") && !(img_name == null) &&
            !img_name.equals("") && !(thelike == null) && !thelike.equals("")) {
        stmt.executeUpdate("insert into mymessage values("
                + "'" + T_id + "'" + "," + "'" + personId + "'" + "," + "'" + name + "'" + "," + "'" + img_name + "'" + "," + "'" + text + "'" + "," + thelike + ")");
    } else if (!(id == null) && !id.equals("")) {
        System.out.println("update mymessage set thelike=thelike+1 where T_id=" + "'" + id + "'");
        stmt.executeUpdate("update mymessage set thelike=thelike+1 where T_id=" + "'" + id + "'");

    }
    ResultSet rs;
    String yy;//yy就是查找的名字。
    int total = 0;
    yy = request.getParameter("nihaoshuai");
    if (yy == null || yy.equals("")) {
        rs = stmt.executeQuery("select count(*) as total from mymessage");
        while (rs.next())
            total = rs.getInt("total");
        rs = stmt.executeQuery("select * from mymessage");
    } else {
        rs = stmt.executeQuery("select count(*) as total from mymessage where name like '%" + yy + "%'");
        while (rs.next())
            total = rs.getInt("total");
        rs = stmt.executeQuery("select * from mymessage where name like '%" + yy + "%'");
        System.out.println("select * from mymessage where name like '%" + yy + "%'");
    }
    rs.afterLast();
%>

<script>
    var i = 1;

    function c() {
        $("#msg").html("<div class='media stream'><a href='#' class='media-avatar medium pull-left'><img src='images/user.png'></a><div class='media-body'><div class='stream-headline'><h5 class='stream-author'>刘振远<small>08 7月, 2017</small></h5><div class='stream-text'>请问web不交实验了，会不会挂科？</div></div><!--/.stream-headline--><div class='stream-options'><a href='#' class='btn btn-small'><i class='icon-thumbs-up shaded'></i>Like</a><a href='#' class='btn btn-small'><i class='icon-reply shaded'></i>Reply</a><a href='#' class='btn btn-small'><i class='icon-retweet shaded'></i>Repost</a></div></div></div>" + $("#msg").html());
    }

    function listen1() {
        var F = new FileReader();
        I = document.getElementById('im').files[0];
        F.readAsDataURL(I);
        F.onload = function (e) {
            $("#textop").html($("#textop").html() + "<img src='' id='img" + i + "' width='200'></img><br style = 'clear:both;'/>");
            console.log("result:" + i + this.result);
            document.getElementById('img' + i).src = this.result;
            i = i + 1;
        }
    }
</script>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i>
            </a>

            <a class="brand" href="index.html">
                学生论坛
            </a>
            <div class="nav-collapse collapse navbar-inverse-collapse">
                <ul class="nav nav-icons">
                    <li class="active"><a href="#">
                        <i class="icon-envelope"></i>
                    </a></li>
                    <li><a href="#">
                        <i class="icon-eye-open"></i>
                    </a></li>
                    <li><a href="#">
                        <i class="icon-bar-chart"></i>
                    </a></li>
                </ul>


                <form method="post" name="search" class="navbar-search pull-left input-append"
                      action="/StudentPlatform/Tieba/activity.jsp">
                    <input placeholder="请输入要查找的发帖人" type="text" class="span3" name="nihaoshuai">
                    <button class="btn" type="submit">
                        <i class="icon-search"></i>
                    </button>
                </form>


                <ul class="nav pull-right">
                    <li class="nav-user dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="/StudentPlatform/PersonalInformation/show.jsp" class="nav-avatar"/>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="../表单/管理员个人信息.html">你的信息</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.nav-collapse -->
        </div>
    </div><!-- /navbar-inner -->
</div><!-- /navbar -->


<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="span3">
                <div class="sidebar">

                    <ul class="widget widget-menu unstyled">
                        <li class="active">
                            <a href="/StudentPlatform/PersonalInformation/page2.jsp">
                                <i class="menu-icon icon-dashboard"></i>
                                个人主页
                            </a>
                        </li>
                        <li>
                            <a href="/StudentPlatform/Tieba/activity.jsp">
                                <i class="menu-icon icon-bullhorn"></i>
                                论坛
                            </a>
                        </li>
                        <li>
                            <a href="/StudentPlatform/Activity/chuan.jsp?personid=<%=personId %>&name=<%=name%>">
                                <i class="menu-icon icon-inbox"></i>
                                活动

                            </a>
                        </li>

                        <li>
                            <a href="/StudentPlatform/Competition/check.jsp?personid=<%=personId %>&name=<%=name%>">
                                <i class="menu-icon icon-tasks"></i>
                                竞赛

                            </a>
                        </li>
                    </ul><!--/.widget-nav-->


                    <ul class="widget widget-menu unstyled">
                        <li>
                            <a class="collapsed" data-toggle="collapse" href="#togglePages">
                                <i class="menu-icon icon-cog"></i>
                                <i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right"></i>
                                More Pages
                            </a>
                            <ul id="togglePages" class="collapse unstyled">
                                <li>
                                    <a href="other-user-listing.html">
                                        <i class="icon-inbox"></i>
                                        刘琳图书
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <a href="/StudentPlatform/PersonalInformation/index.jsp">
                                <i class="menu-icon icon-signout"></i>
                                返回到登陆界面
                            </a>
                        </li>
                    </ul>
                </div><!--/.sidebar-->
            </div><!--/.span3-->


            <div class="span9">
                <div class="content">
                    <div class="module">
                        <div class="module-head">
                            <h3>问题回复</h3>
                        </div>
                        <div class="module-body">


                            <form enctype="multipart/form-data" method="post" action="/Servlet1" name="theload">
                                <div class="stream-composer media">
                                    <a href="#" class="media-avatar medium pull-left">
                                        <img src="/StudentPlatform/PersonalInformation/show.jsp">
                                    </a>
                                    <div class="media-body">
                                        <div id="textop" style="border:solid;"></div>
                                        <div class="row-fluid"><textarea contenteditable="true" id="textop"
                                                                         class="span12" name="text1"
                                                                         style="height: 70px; width:auto resize: none;"></textarea>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <a onclick="document.theload.submit()" class="btn btn-primary pull-right">
                                            <!-- onclick = "c()" -->
                                            问题回复
                                        </a>
                                        <a href="#" class="btn btn-small file" rel="tooltip" data-placement="top">
                                            <i class="icon-camera shaded"><input id="im" type="file" name="input1"
                                                                                 accept="image/*" onChange="listen1()"/></i>
                                        </a>
                                        <a href="#" class="btn btn-small" rel="tooltip" data-placement="top"
                                           data-original-title="Upload a video">
                                            <i class="icon-facetime-video shaded"></i>
                                        </a>
                                        <a href="#" class="btn btn-small" rel="tooltip" data-placement="top"
                                           data-original-title="Pin your location">
                                            <i class="icon-map-marker shaded"></i>
                                        </a>
                                    </div>
                                </div>

                                <input type=text style=" visibility:hidden" name="personId" value="<%=personId%>"/>
                                <input type=text style=" visibility:hidden" name="name" value="<%=name %>"/>
                            </form>
                        </div>


                        <div class="stream-list">
                            <div class="media stream new-update">
                                <a href="#">
                                    <i class="icon-refresh shaded"></i>
                                    <%=total %> updates
                                </a>
                            </div><!--/.media .stream--><!--/.media .stream-->
                            <%
                                while (rs.previous()) {
                            %>
                            <!--/.media .stream-->

                            <div id="msg">
                                <div class="media stream" id=rs.getString("T_id")>


                                    <a id="<%=rs.getString("T_id") %>" href="#" class="media-avatar medium pull-left">
                                        <img src="/StudentPlatform/PersonalInformation/showimg.jsp?person_id=<%=rs.getString("id")%>">
                                    </a>
                                    <div class="media-body">
                                        <div class="stream-headline">
                                            <h5 class="stream-author">
                                                <%=rs.getString("name") %>
                                                <%
                                                    String datetime;
                                                    String[] str;
                                                    str = rs.getString("T_id").split("_");
                                                    datetime = str[2] + " " + str[1] + "月, " + "20" + str[0];
                                                %>
                                                <small><%=datetime %>
                                                </small>
                                            </h5>
                                            <div class="stream-text">
                                                <%=rs.getString("text") %>
                                            </div>
                                            <div class="stream-attachment photo">
                                                <div class="responsive-photo">
                                                    <img src="/StudentPlatform/Tieba/asserts/images/<%=rs.getString("filename") %>"/>
                                                </div>
                                            </div>
                                        </div><!--/.stream-headline-->

                                        <div class="stream-options">

                                            <a  class="btn btn-small"
                                               href="/StudentPlatform/Tieba/activity.jsp?id=<%=rs.getString("T_id")%>#<%=rs.getString("T_id")%>">
                                                <i class="icon-thumbs-up shaded"></i>
                                                Like<%=rs.getInt("thelike") %>
                                            </a>
                                            <a name="chenkeshuai"
                                               href="/StudentPlatform/Tieba/Tijiao.jsp?id=<%=rs.getString("T_id") %>&name=<%=rs.getString("name")%>"
                                               class="btn btn-small" onclick="c()">
                                                <i class="icon-reply shaded"></i>
                                                Reply
                                            </a>
                                            <a class="btn btn-small" href="/StudentPlatform/Tieba/activity.jsp?
												text=<%=rs.getString("text")%>&img_name=<%=rs.getString("filename")%>&name=11111 转发自<%=rs.getString("name")%>&personId=11111&thelike=0">
                                                <i class="icon-retweet shaded"></i>
                                                Repost
                                            </a>
                                        </div>

                                        <%
                                            request.setCharacterEncoding("UTF-8");
                                            Statement stmt1 = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                                            ResultSet rr;
                                            rr = stmt1.executeQuery("select * from Tiezi where T_id=" + "'" + rs.getString("T_id") + "'");
                                            rr.afterLast();
                                        %>
                                        <%while (rr.previous()) {%>
                                        <h5 class="stream-author">
                                            <%=rr.getString("name") %>
                                            <%
                                                String datetime1;
                                                String[] str1;
                                                str1 = rr.getString("date").split("_");
                                                datetime1 = str1[2] + " " + str1[1] + "月, " + "20" + str[0];
                                            %>
                                            <small><%=datetime %>
                                            </small>
                                        </h5>

                                        <div class="stream-text">
                                            <div class="row-fluid"><%=rr.getString("Text") %>
                                            </div>
                                        </div>

                                        <%}rr.close();%>
                                    </div>

                                </div>

                            </div><!--/.media .stream-->
                            <% }rs.close();%>

                            <div class="media stream">
                                <a href="#" class="media-avatar medium pull-left">
                                    <img src="/StudentPlatform/Tieba/images/user.png">
                                </a>
                                <div class="media-body">
                                    <div class="stream-headline">
                                        <h5 class="stream-author">
                                            杨智东
                                            <small>08 7月, 2017</small>
                                        </h5>
                                        <div class="stream-text">
                                            快过年啦！！！


                                        </div>
                                        <div class="stream-attachment photo">
                                            <div class="responsive-photo">
                                                <img src="/StudentPlatform/Tieba/images/d.jpg"/>
                                            </div>
                                        </div>
                                    </div><!--/.stream-headline-->

                                    <div class="stream-options">
                                        <a href="#" class="btn btn-small">
                                            <i class="icon-thumbs-up shaded"></i>
                                            Like
                                        </a>
                                        <a href="#" class="btn btn-small">
                                            <i class="icon-reply shaded"></i>
                                            Reply
                                        </a>
                                        <a href="#" class="btn btn-small">
                                            <i class="icon-retweet shaded"></i>
                                            Repost
                                        </a>
                                    </div>
                                </div>
                            </div><!--/.media .stream--><!--/.media .stream-->

                            <div class="media stream load-more">
                                <a href="#">
                                    <i class="icon-refresh shaded"></i>
                                    show more...
                                </a>
                            </div>
                        </div>
                    </div><!--/.stream-list-->
                </div><!--/.module-body-->
            </div><!--/.module-->

        </div><!--/.content-->
    </div><!--/.span9-->
</div>
</div><!--/.container-->
</div><!--/.wrapper-->


<script src="/StudentPlatform/Tieba/scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/StudentPlatform/Tieba/scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
<script src="/StudentPlatform/Tieba/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>