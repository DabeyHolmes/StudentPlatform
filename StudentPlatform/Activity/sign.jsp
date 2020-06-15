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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>报名</title>

<!--// Stylesheets //-->
<link href="/StudentPlatform/Activity/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/StudentPlatform/Activity/css/red.css" title="styles1" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/blue.css" title="styles2" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/gray.css" title="styles3" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/orange.css" title="styles4" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/green.css" title="styles5" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/orange-red.css" title="styles6" media="screen" />

<link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/StudentPlatform/Activity/css/default.css">
        <link href="/StudentPlatform/Activity/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        
       
        
        <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="/StudentPlatform/Activity/js/fileinput.js" type="text/javascript"></script>
        <!--简体中文-->
        <script src="/StudentPlatform/Activity/js/locales/zh.js" type="text/javascript"></script>
        <!--繁体中文-->
        <script src="/StudentPlatform/Activity/js/locales/zh-TW.js" type="text/javascript"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>



<!--// Javascripts //-->
<script type="text/javascript" src="/StudentPlatform/Activity/js/jquery.min.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/styleswitch.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/animatedcollapse.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/ddsmoothmenu.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/scrolltopcontrol.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/tabs.js"></script>
<script type="text/javascript" src="/StudentPlatform/Activity/js/functions.js"></script>

</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String acID  = request.getParameter("acID");

%>

<%
Class.forName("com.mysql.jdbc.Driver"); 

Connection connect = DriverManager.getConnection(
        "jdbc:mysql://localhost/act0", "root", "dzb19980322");
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

Statement newStmt = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

newStmt.executeUpdate("update activities set acCan =acCan+1 where acID = "  +"'"+ acID +"'" );


%>

<!-- Wrapper Start -->
<div id="outer_wrapper">
	<!-- Top Bar Start -->
    <div id="top-bar" class="backcolr">
    	<div class="inner">
        	<!-- Styleswitcher Start -->
            <div class="styles">
                
            </div>
            <!-- Styleswitcher End -->
            <!-- Top Site Map Button Start -->
            <a href="javascript:animatedcollapse.toggle('jason')" class="togglebtn">Site Map</a>
            <!-- Top Site Map Button End -->
            <!-- Top Bar Text Start -->
           
        </div>
        <div class="clear"></div>
        
    </div>
    <!-- Top Bar End -->
    
    
    <!-- Header Start -->
    <div id="header">
    	<div class="rays">
        	<div class="inner">
            	<!-- Logo Start -->
            	<div class="logo">
                	<a href="index.html"><img src="images/logo.png" alt="" /></a>
                </div>
                <!-- Logo End -->
                <div class="right">
                    <!-- Navigation Start -->
                    <div class="navigation">
                    	<div id="smoothmenu1" class="ddsmoothmenu">
                            <ul>
                                <li  class="current-menu-item"><a href="/StudentPlatform/Activity/actIndex.jsp">活动</a></li>
                                <li><a href="/StudentPlatform/Activity/create.jsp">发布活动</a></li>
                                <li><a href="/StudentPlatform/Activity/PersonalInformation.jsp">个人中心</a>
                                   
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
   
    
    
    
    
    
    <!-- Content Section Start -->
    <div id="contentsec">
    	<div class="inner">
        	<div class="twothird left">
                <!-- Two Third Box Start -->
                <div class="twothird box left">
                     <div class="htmleaf-container">
                
                    
                     
                    <form enctype="multipart/form-data" method="post"
				action="/signServ">
                        
                        
                        <label style="margin-left:10px">姓名</label><br/>
                        <input  type="text" name="stuName"   size=50% style="margin-left:10px" value="<%=(String)session.getAttribute("name") %>"/>
                         <hr>
                         
                        <label  style="margin-left:10px">学号</label><br>
                        <input  style="margin-left:10px" type="text" name="stuID" size=50% value="<%=(String)session.getAttribute("personId") %>"/>
                          <hr>
                         
                        <label style="margin-left:10px">联系方式：</label><br>
                        
                        <label style="margin-left:10px">电话</label><input  style="margin-left:10px" type="text" name="stuTele" />
                        
                         <label style="margin-left:50px">qq</label>
                        <input  style="margin-left:10px" type="text" name="stuQQ" />
                        <hr>
                        
                       
                         
                       
                        
                      
                        
                        
                        
                        
                        <label style="margin-left:10px" >院系</label><br>
                       <select  style="margin-left:10px" name="stuCol" >
                          <option value="软件学院">软件学院</option>
                          <option value="冶金学院">冶金学院</option>
                          <option value="艺术学院">艺术学院</option>
                          <option value="文法学院">文法学院</option>
                          <option value="中荷学院">中荷学院</option>
                          <option value="理学院">理学院</option>
                          <option value="外语学院">外语学院</option>
                          <option value="其他">其他</option>
                        </select>
                        <hr>
                        
                        
                        <label style="margin-left:50px">班级</label>
                        <input  style="margin-left:10px" type="text" name="stuClass" />
                        <hr>
                        <input type = "text" value = "<%=acID %>" style="visibility:hidden" 
                                    name="getID" >
                                    </input>
                        
                       
                         <button style="margin-left:10px" type="submit" class="btn btn-primary" >提交</button>
                         
                       
                        <button  style="margin-left:10px" type="reset" class="btn btn-default">重置</button>
                        <!--<button style="margin-left:10px" type="submit" class="btn btn-primary">预览</button>-->
                        
                    </form>
                    </div>
                    </div>
                </div>
                <!-- Two Third Box End -->
                
                
                
                
                
                
                
             
           <!-- One Third Box Start -->
            <div class="onethird right">
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
                                                    <a href="#"><img  style = "width : 52px" src="<%= stuRs.getString("acPic") %>" alt="" /></a>
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
                                                    <a href="#"><img  style = "width : 52px" src="<%= stuRs.getString("acPic") %>" alt="" /></a>
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
                                        <% stuRs.afterLast(); %>
                                        <% while(stuRs.previous() ){ %>
                                       <% if( stuRs.getString("joinType").equals("fabu") ){ %>
                                            
                                            <li>
                                                <div class="thumb">
                                                    <a href="#"><img  style = "width : 52px" src="<%= stuRs.getString("acPic") %>" alt="" /></a>
                                                </div>
                                                <div class="desc">
                                                    <a href="#" class="title"><%= stuRs.getString("acName") %></a>
                                                    <p><%= stuRs.getString("acIntro") %></p>
                                                </div>
                                            </li>
                                            
                                           <%}} %> 
                                           
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
<div style="display:none"><script src='http//v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='utf-8'></script></div>
</body>
</html>