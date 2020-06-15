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
<title>活动预览</title>

<!--// Stylesheets //-->
<link href="/StudentPlatform/Activity/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/StudentPlatform/Activity/css/red.css" title="styles1" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/blue.css" title="styles2" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/gray.css" title="styles3" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/orange.css" title="styles4" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/green.css" title="styles5" media="screen" />
<link rel="alternate stylesheet" type="text/css" href="/StudentPlatform/Activity/css/orange-red.css" title="styles6" media="screen" />
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
response.setCharacterEncoding("utf-8");
String acID = "";
acID = (String)request.getAttribute("acID");
if(acID == null || acID.equals(""))
 acID = request.getParameter("acID");
System.out.println("displsy46:"+acID);
//acID = new String(acID.getBytes("ISO-8859-1"), "utf-8");


System.out.println("displace.jsp");
System.out.println(acID);
Class.forName("com.mysql.jdbc.Driver"); 

Connection connect = DriverManager.getConnection(
        "jdbc:mysql://localhost/act0", "root", "dzb19980322");
 
Statement stmt = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
ResultSet rs;


	  
	  
	  
      rs=stmt.executeQuery("select * from activities where acID = "  +"'"+ acID +"'" );
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
   
    
    
    
    
     <%while ( rs.previous()){ %>
    <!-- Content Section Start -->
    <div id="contentsec">
    	<div class="inner">
        	<div class="twothird left">
        	 
                <!-- Two Third Box Start -->
                <div class="twothird box left">
               
                    <h2 class="widget-head-border colr" ><%= rs.getString("acName") %></h2>
                    <div class="blog">
                        <!-- Blog Post Start -->
                        <div class="post">
                            <div class="p-date">
                                <span><%=rs.getString("signStart").substring(8, 10) %></span>
                                <span><%=rs.getString("signStart").substring(5, 7) %></span>
                            </div>
                            <div class="post-sec">
                                <div class="thumb">
                                   <a href="#"><img src="/Activity/<%=rs.getString("acPic") %>"  style="width:531px;" alt="" /></a>
                                 </div>
                                <div class="post-desc">
                                    <p>
                                      <%= rs.getString("acIntro") %>
                                    </p>
                                    
                                   
                                   
                                    
                                </div>
                            </div>
                            
                        </div>
                        <!-- Blog Post End -->
                    </div>
                </div>
                <!-- Two Third Box End -->
                
                
                
                <!-- Two Third Box Start -->
                <div class="twothird box left">
                	<!-- About Authore Start -->
                	<div class="about-authore">
                    	<a href="#" class="thumb"><img src="/StudentPlatform/Activity/images/post5.gif" alt="" /></a>
                        <h5 class="colr"><%=rs.getString("orgName") %></h5>
                        <p>
                        	<%=rs.getString("orgName") %>
                        </p>
                    </div>
                    <!-- About Authore End -->
                </div>
              </div>
                
                
                
                <!-- Two Third Box End -->
                
            
            
                <!-- One Third Box Start -->
                <div class="onethird box left">
                	<h3 class="widget-head-border colr">活动信息</h3>
                	<!-- Text Widget Start -->
                    <div class="widget textwidget">
                        <div class="textpad left">
                           
                        
                           <label ><p class = "acSignText">活动主办方 ： <%= rs.getString("orgName") %></p></label>
                           <hr />
                           <label><p class = "acSignText">主办方联系电话<%= rs.getString("orgTele") %>
                                                          <br> 主办方QQ <%= rs.getString("orgQQ") %></p></label>
                           <hr />
                           <label><p class = "acSignText">报名时间  : <%= rs.getString("signStart") %> 至 <%= rs.getString("signEnd") %></p></label>
                           <hr />
                           <label><p class = "acSignText">活动时间  : <%= rs.getString("acStart") %> 至 <%= rs.getString("acEnd") %> </p></label>
                           <hr />
                           <label><p class = "acSignText">活动形式  : <%=rs.getString("acType")%>
                           </p></label>
                           <hr />
                           <label><p class = "acSignText">活动地点 : <%=rs.getString("acPlace")%></p></label>
                           <hr />
                           <label><p class = "acSignText">活动费用 : <%=rs.getString("acFee")%></p></label>
                           <hr />
                           <label><p class = "acSignText">活动人数限制 : 最多<%=rs.getString("acPeo")%>人</p></label>
                           <hr />
                           <label><p class = "acSignText">活动类型 : <%=rs.getString("type")%></p></label>
                           <hr />
                           <label><p class = "acSignText">活动面向院系 : <%=rs.getString("col")%></p></label>
                           <hr />
                           
                            
                            
                            <a href="#" class="buttonone" disabled="true">报名参加</a>
                            <a href="#" class="buttonone" enable=false>添加关注</a>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!-- Text Widget End -->
            	</div>
                <!-- One Third Box End -->
            </div>
            <!-- One Third Box End -->
        </div>
    </div>
    <!-- Content Section End -->
    <% } %>
    
    
    
    
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
<div style="display:none"><script src='http//v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>