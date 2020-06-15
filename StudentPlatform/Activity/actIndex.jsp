<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="javax.servlet.ServletInputStream"%> 
<%@ page import = "java .util.Collection" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>活动</title>
<!--// Stylesheets //-->
<link href="/StudentPlatform/Activity/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/StudentPlatform/Activity/css/red.css" title="styles1" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/blue.css" title="styles2" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/gray.css" title="styles3" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/orange.css" title="styles4" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/green.css" title="styles5" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/orange-red.css" title="styles6" media="screen" />
<link href="/StudentPlatform/Activity/css/fancybox.css" rel="stylesheet" type="text/css" />
<!--// Javascripts //-->
<script type="text/javascript" src="/StudentPlatform/Activity/js/jquery.min.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/styleswitch.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/animatedcollapse.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/scrolltopcontrol.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/tabs.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/jquery.fancybox-1.3.1.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/lightbox.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/functions.js"></script>








<script type="text/javascript" src="/StudentPlatform/Activity/js/jquery.nivo.slider.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/jquery.infinite-carousel.js"></script>



</head>
<body>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
 
String type=request.getParameter("type");
if(type==null){
	if((String)session.getAttribute("type")!=null)
	session.setAttribute("type", session.getAttribute("type"));
	else
		session.setAttribute("type", "兴趣");
	
}
	
else
	session.setAttribute("type", type);
type=(String)session.getAttribute("type");


String acType = request.getParameter("acType");
if( acType == null ){
	if((String)session.getAttribute("acType")!=null)
		session.setAttribute("acType", session.getAttribute("acType"));
		else
			session.setAttribute("acType", "方式");
}
else
	session.setAttribute("acType", acType);
acType=(String)session.getAttribute("acType");


String col = request.getParameter("col");
if( col == null ){
	if((String)session.getAttribute("col")!=null)
		session.setAttribute("col",session.getAttribute("col"));
		else
			session.setAttribute("col", "院系");
}
else
	session.setAttribute("col", col);
col=(String)session.getAttribute("col");





//搜索
String strSearch = request.getParameter("txtSearch");
boolean is_Search = false;


Class.forName("com.mysql.jdbc.Driver"); 

Connection connect = DriverManager.getConnection(
        "jdbc:mysql://localhost/act0", "root", "dzb19980322");

String myQuery ="select * from activies"; 
Statement stmt = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
ResultSet rs;
int total = 0 ; //活动数

if(strSearch==null||strSearch.equals("")){
	  is_Search = false;
	  rs=stmt.executeQuery("select count(*) as total from activities where type like '%" + type + "%' and acType like '%" + acType + "%' and col like '%" + col + "%' ");
	  while(rs.next())
	   total=rs.getInt("total");
      rs=stmt.executeQuery("select * from activities where type like '%" + type + "%' and acType like '%" + acType + "%' and col like '%" + col + "%' ");
      System.out.println("select * from activities where type like '%" + type + "%' and acType like '%" + acType + "%' and col like '%" + col + "%' ");
}

else{
	   is_Search = true;
	   rs=stmt.executeQuery("select count(*) as total from activities where acName like '%" + strSearch + "%' and type like '%" + type + "%' and acType like '%" + acType + "%' and col like '%" + col + "%' ");
	   while(rs.next())
 	   total=rs.getInt("total");
	   rs=stmt.executeQuery("select * from activities where acName like '%" + strSearch + "%' and type like '%" + type + "%' and acType like '%" + acType + "%' and col like '%" + col + "%' ");
	   System.out.println("select * from activities where acName like '%" + strSearch + "%' and type like '%" + type + "%' and acType like '%" + acType + "%' and col like '%" + col + "%' ");
}
rs.afterLast();



%>


<%

String stuIDIndex =(String)session.getAttribute("personId"); 
String stuQuery  = "select * from student";
Statement stustmt = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
ResultSet stuRs;
int stuTotal;

	 
	  stuRs=stustmt.executeQuery("select count(stuID) as stuTotal from student");
	  while(stuRs.next())
	   stuTotal=stuRs.getInt("stuTotal");
    stuRs=stustmt.executeQuery("select * from student natural join activities where stuID = " + "'"+ stuIDIndex + "'" );



stuRs.afterLast();


%>



<!-- Wrapper Start -->
<div id="outer_wrapper">



	<!-- Top Bar Start -->
    <div id="top-bar" class="backcolr"><!--/*改颜色的网页头*/-->
    	<div class="inner">
        	<!-- Styleswitcher Start -->
            <div class="styles">
               
            </div>
            <!-- Styleswitcher End -->
            <!-- Top Site Map Button Start -->
            <a href="javascript:animatedcollapse.toggle('jason')" class="togglebtn">Site Map</a>
            <!-- Top Site Map Button End -->
            <!-- Top Bar Text Start -->
           
            <!-- Top Bar Text End -->
        </div>
        <div class="clear"></div>
       
    </div>
    <!-- Top Bar End -->
    
    
    
    
    
    <!-- Header Start -->
    <div id="header"><!-- 导航栏-->
    	<div class="rays">
        	<div class="inner">
            	<!-- Logo Start -->
            	<div class="logo">
                	<a href="index.html"><img src="/StudentPlatform/Activity/images/logo.png" alt="" /></a>
                </div>
                <!-- Logo End -->
                <div class="right">
                    <!-- Navigation Start -->
                    <div class="navigation">
                    	<div id="smoothmenu1" class="ddsmoothmenu">
                            <ul>
                                <li  class="current-menu-item"><a href="/StudentPlatform/Activity/actIndex.jsp">活动</a></li>
                                <li><a href="/StudentPlatform/Activity/create.jsp">发布活动</a></li>
                                <li><a href="/StudentPlatform/PersonalInformation/page2.jsp">个人中心</a>
                                   
                                </li>
                                
                            </ul>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!-- Navigation End -->
                    <!-- Search Start -->
                	<div class="search">
                    	<a href="#" class="btn">&nbsp;</a>
                        <div class="searchinputs backcolr">
                            <ul>
                                <li class="left">
                                	<input name="txtSearch" value="Enter Keyword"
                                    onfocus="if(this.value=='Enter Keyword') {this.value='';}"
                                    onblur="if(this.value=='') {this.value='Enter Keyword';}"   type="text" />
                                </li>
                                <li class="right"><button class="colr">Search</button></li>
                            </ul>
                        </div>
                    </div>
                    <!-- Search End -->
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
    
    
    
  
    
    <!-- Banner Start -->
    <div id="banner">
    	<div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
            
                <a href="#"><img src="/StudentPlatform/Activity/images/banner1.jpg" title="#banner1" alt="" /></a>
                <a href="#"><img src="/StudentPlatform/Activity/images/banner2.jpg" title="#banner2" alt="" /></a>
                <a href="#"><img src="/StudentPlatform/Activity/images/banner3.jpg" title="#banner3" alt="" /></a>
            </div>
            <!-- Banner Caption Start -->
            <div id="banner1" class="nivo-html-caption">
                <div class="ban-capt-desc">
                    <div class="ban-capt-mid">
                        <div class="ban-capt-in">
                            <h1 class="white">打扫图书馆志愿活动</h1>
                            <p>
                            	打扫图书馆
                            	浑南
                            	4小时志愿时长
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Banner Caption End -->
            <!-- Banner Caption Start -->
            <div id="banner2" class="nivo-html-caption">
                <div class="ban-capt-desc">
                    <div class="ban-capt-mid">
                        <div class="ban-capt-in">
                            <h1 class="white">一起读书！！！</h1>
                            <p>
                            	书香校园
                            	读书分享~
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Banner Caption End -->
            <!-- Banner Caption Start -->
            <div id="banner3" class="nivo-html-caption">
                <div class="ban-capt-desc">
                    <div class="ban-capt-mid">
                        <div class="ban-capt-in">
                            <h1 class="white">玩泥巴</h1>
                            <p>
                            	高兴~
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Banner Caption End -->
        </div>
    </div>
    <!-- Banner End -->
    
    
    
    
    
    <!-- Content Section Start -->
    <div id="contentsec">
    
    
    
    
    
    	<div class="inner">
        
        	<!-- Two Third Box Start -->
            <div class="twothird box left">
            
        
        
        
        	<form >
                <div class="active-column-box">
                    
                    <div class="list clearfix">
                        <div class="tit fl">方式：</div>
                        <div class="clearfix fl list-box" action-target="way">
                            <a href="/StudentPlatform/Activity/actIndex.jsp?acType=方式" class="item js_screen_item active" action-data="0">不限</a>
                            <a href="/StudentPlatform/Activity/actIndex.jsp?acType=线上" class="item js_screen_item " action-data="1" >线上</a>
                            <a href="/StudentPlatform/Activity/actIndex.jsp?acType=线下" class="item js_screen_item " action-data="2">线下</a>
                        </div>
                        <input type="hidden" name="way" class="js_screen_way" value="0">
                    </div>
                    
                    
                    <div class="list clearfix">
                        <div class="tit fl">兴趣：</div>
                        <div class="clearfix fl list-box" action-target="class" style="width:auto;">
                            <a href="/StudentPlatform/Activity/actIndex.jsp?type=兴趣" class="item js_screen_item active" action-data="0">全部</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?type=志愿招募" class="item js_screen_item " action-data="1">志愿招募</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?type=讲座交流" class="item js_screen_item " action-data="2">讲座交流</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?type=社团实践" class="item js_screen_item " action-data="3">社团实践</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?type=电影读书" class="item js_screen_item " action-data="4">电影读书</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?type=艺术表演" class="item js_screen_item " action-data="5">艺术表演</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?type=培训实习" class="item js_screen_item " action-data="6">培训实习</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?type=社会综合" class="item js_screen_item " action-data="7">社会综合</a>
                                                </div>
                        <input type="hidden" name="class" class="js_screen_class" value="0">
                    </div>
                    
                     <div class="list clearfix">
                        <div class="tit fl">院系：</div>
                        <div class="clearfix fl list-box" action-target="class" style="width:auto;">
                            <a href="/StudentPlatform/Activity/actIndex.jsp?col=院系" class="item js_screen_item active" action-data="0">全部</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?col=软件学院" class="item js_screen_item " action-data="1">软件学院</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?col=冶金学院" class="item js_screen_item " action-data="2">冶金学院</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?col=文法学院" class="item js_screen_item " action-data="3">文法学院</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?col=中荷学院" class="item js_screen_item " action-data="4">中荷学院</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?col=外语学院" class="item js_screen_item " action-data="5">外语学院</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?col=艺术学院" class="item js_screen_item " action-data="6">艺术学院</a>
                                                    <a href="/StudentPlatform/Activity/actIndex.jsp?col=其他" class="item js_screen_item " action-data="7">其他</a>
                                                </div>
                        <input type="hidden" name="class" class="js_screen_class" value="0">
                    </div>
                    
                                           
                           
                                            
                    <input type="submit" id="activeScreenSub" style="display:none">
                    <input type="hidden" name="start_time" value="">
                    <input type="hidden" name="end_time" value="">
                </div>
                
                <div class="active-column-box active-sort-column-box">
                    <div class="list clearfix js_rank_list">
                        <div class="tit fl">排序：</div>
                        <div class="clearfix fl list-box" action-target="sort">
                            <a href="javascript:;" class="item js_screen_item active" action-data="0">默认</a>
                            <a href="javascript:;" class="item js_screen_item " action-data="1">最多浏览</a>
                            <a href="javascript:;" class="item js_screen_item " action-data="2">最新发布</a>
                        </div>
                        <input type="hidden" name="sort" class="js_screen_sort" value="0">
                       
                    </div>
                </div>
            </form>
            
            
            
            	<h2 class="widget-head-border colr">Blog Listing</h2>
                <div class="blog">
                
                
                <%while ( rs.previous()){ %>
                    <!-- Blog Post Start -->
                    <div class="post">
                        <div class="p-date">
                            <span><%=rs.getString("signStart").substring(8, 10) %></span>
                            <span><%=rs.getString("signStart").substring(5, 7) %></span>
                        </div>
                        <div class="post-sec">
                            <h3 class="post-head"><a href="blogpost.html"><%=rs.getString("acName") %></a></h3>
                            <div class="thumb">
                                <a href="#"><img src="/Activity/<%=rs.getString("acPic") %>" style="width:531px;"
                                alt="" /></a>
                                <div class="thumb-hover">
                                	<div class="thumb-actions">
                                        <a href="blogpost.html" class="link">&nbsp;</a>
                                        <a href="/StudentPlatform/Activity/images/large1.jpg" class="tip4 zoom">&nbsp;</a>
                                    </div>
                                </div>
                            </div>
                            <div class="post-desc">
                                <p>
                                    <%=rs.getString("acIntro") %>
                                </p>
                                <div class="post-opts">
                                    
                                    <p class="post-time">关注人数 ： <%=rs.getString("acGuan") %></p> 
                                    <p class="tags">报名人数:  <%=rs.getString("acCan") %> </p>
                                    <form method="post" action="/StudentPlatform/Activity/actSet.jsp">
                                    <input type = "text" value = "<%=rs.getString("acID") %>" style="visibility:hidden" 
                                    name="getID" >
                                    </input>
                                    <input type = "submit" value = "查看详情"  >
                                    </input>
                                    </form>
                                    
                                    
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                    
                    <%} %>
                    <!-- Blog Post End -->
                    
                    <!-- Pagination Start -->
                    <div class="pagination">
                    	 <ul>
                         	<li><a href="#">Previous</a></li>
                            <li><a href="#" class="active">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li class="next"><a href="#">Next</a></li>
                         </ul>
                    </div>
                    <!-- Pagination End -->
                </div>
            </div>
            <!-- Two Third Box End -->
            
            
            
            
            <!-- One Third Box Start -->
            <div class="onethird right">
            
            <!-- One Third Box Start -->
                <div class="onethird box left">
                	<h3 class="widget-head-border colr">Search</h3>
                	<!-- Blog Categories Widget Start -->
            		<div class="widget widget_search">
                    	
                    	<form method="post" action="/StudentPlatform/Activity/actIndex.jsp">
                    	<ul>
                        	<li class="left">
                            	<input placeholder="search" name="txtSearch" 
                                class="bar" />
                            </li>
                            <li class="right"><button class="colr" type="submit" >Search</button></li>
                        </ul>
                    	</form>
                    	
                    </div>
                    <!-- Blog Categories Widget Start -->
            	</div>
                <!-- One Third Box End -->
                
            
            
            	<!-- One Third Box Start -->
                <div class="onethird box left">
                	<!-- Tabs Widget Start -->
            		<div class="widget tabs-widget">
                        <!-- Tab Code Start -->
                        <div class="tab-section">
                        	<div class="tab_menu_container">
                            	<ul id="tabs-code">  
                                	<li style="width:34%;"><a class="current" rel="tab1">我关注的活动</a></li>
                                    <li style="width:33%;"><a class="" rel="tab2">我报名的活动</a></li>
                                    <li style="width:33%;"><a class="" rel="tab3">我发布的活动</a></li>
                                </ul> <!-- END -->
                                <div class="clear"></div>
                            </div>
                            <div class="tab_container">
                            	<div class="tab_container_in">
                            	 
                                            
                                            
                                	<div id="tab1" class="tab_sidebar_list">
                                        <ul class="post-thumbs">
                                        <% while(stuRs.previous() ){ %>
                                        <% if(  stuRs.getString("joinType").equals("guanzhu")  ){ %>
                                            
                                            <li>
                                                <div class="thumb">
                                                    <a href="#"><img  style = "width : 52px" src="/Activity/<%= stuRs.getString("acPic") %>" alt="" /></a>
                                                </div>
                                                <div class="desc">
                                                    <a href="#" class="title"><%= stuRs.getString("acName") %></a>
                                                    <p><%= stuRs.getString("acIntro") %></p>
                                                </div>
                                            </li>
                                            
                                            
                                           <%}} %>
                                        </ul>
                                    </div>
                                    
                                    <div id="tab2" class="tab_sidebar_list">
                                        <ul class="post-thumbs">
                                        <% stuRs.afterLast(); %>
                                        <% while(stuRs.previous() ){ %>
                                       <%if( stuRs.getString("joinType").equals("canjia") ){%>
                                            
                                            <li>
                                                <div class="thumb">
                                                    <a href="#"><img  style = "width : 52px" src="/Activity/<%= stuRs.getString("acPic") %>" alt="" /></a>
                                                </div>
                                                <div class="desc">
                                                    <a href="#" class="title"><%= stuRs.getString("acName") %></a>
                                                    <p><%= stuRs.getString("acIntro") %></p>
                                                </div>
                                            </li>
                                            
                                            
                                           <%} }%>
                                        </ul>
                                    </div>
                                    
                                    <div id="tab3" class="tab_sidebar_list">
                                        <ul class="post-thumbs">
                                        <%
                                            stuRs.close();
                                            String id = (String)session.getAttribute("personId");
                                            String sql1 = "select * from activities where id = '"+id+"'";
                                            Statement stustmt1 = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                                            ResultSet stuRs1 = stustmt1.executeQuery(sql1);
                                            stuRs1.afterLast();
                                        %>
                                        <% while(stuRs1.previous() ){ %>
                                            
                                            <li>
                                                <div class="thumb">
                                                    <a href="#"><img  style = "width : 52px" src="/Activity/<%= stuRs1.getString("acPic") %>" alt="" /></a>
                                                </div>
                                                <div class="desc">
                                                    <a href="#" class="title"><%= stuRs1.getString("acName") %></a>
                                                    <p><%= stuRs1.getString("acIntro") %></p>
                                                </div>
                                            </li>
                                            
                                           <%} %>
                                           
                                        </ul>
                                    </div>
                                   
                                    <div class="clear"></div>                                    
                                </div>
                            </div>
                        </div>
                        <!-- Tab Code End -->
                    </div>
                    <!-- Tabs Widget End -->
            	</div>
                <!-- One Third Box End -->
                
                
                
                
               
                
                
                
            </div>
            <!-- One Third Box End -->
        </div>
    </div>
    <!-- Content Section End -->
     <!-- Footer Start -->
    <div id="footer">
        <div class="footer-rays">
            <div class="inner">
            	
                <div class="followus">
                	<!-- Go to Top Start -->
                    <div class="gotop">
                        <a href="#top">&nbsp;</a>
                        <span>Back to Top</span>
                    </div>
                    <!-- Go to Top End -->
                    
                    
                </div>
                <!-- Follow Us - Go to Top End -->
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <!-- Footer End -->
</div>
<!-- Wrapper End -->
<div style="display:none"><script src='http//v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript'></script></div>
</body>
</html>