<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="javax.servlet.*"%>

<%@ page 	import="javax.servlet.ServletInputStream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>竞赛展示</title>
	<link href='https://fonts.googleapis.com/css?family=Droid+Serif' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>
	<link href="http://cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/StudentPlatform/Competition/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="/StudentPlatform/Competition/css/default.css">
	<link href="/StudentPlatform/Competition/assets/demo.css" rel="stylesheet">
	<link href="/StudentPlatform/Competition/assets/header.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  
  <style type="text/css">
  .bt{
	  color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
	display: inline-block;
    padding: 6px 10px;
    margin-bottom: 0;
    font-size: 22px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    width:100px;
  }
  .txt{
  vertical-align: middle;
    font-size: 22px;
	border:none #FFF;
	outline:none;
	word-break:break-all;
	
   
  }
  </style>
  
</head>
<body>
  <%
  request.setCharacterEncoding("utf-8");
  String com_type=request.getParameter("com_type");
  if(com_type==null){
	  if(session.getAttribute("com_type")!=null)
         session.setAttribute("com_type", session.getAttribute("com_type"));
	  else
		  session.setAttribute("com_type","类型");
  }
  else
	  session.setAttribute("com_type", com_type);
  com_type=(String)session.getAttribute("com_type");

  int totalNumber=1;//表示要加载竞赛的数量-1
  String search_name=request.getParameter("search_name");
  
  String number=request.getParameter("number");
  int end=-1;//判断是否已加载全部竞赛信息
  int count=0;
  int total=0;//表示数据库中竞赛项目总的数目
  int k=0;//判断是否进行了搜索
  String str;
  if(number!=null){
	  totalNumber=Integer.parseInt(number);
	  System.out.println( totalNumber);
  }
  System.out.println(search_name);
  Class.forName("com.mysql.jdbc.Driver"); 
  Connection connect = DriverManager.getConnection(
          "jdbc:mysql://localhost/a", "root", "dzb19980322");
//连接URL为   jdbc:mysql//服务器地址/数据库名
//后面的2个参数分别是登陆用户名和密码
      System.out.println("Success connect Mysql server!");

      Statement stmt = connect.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
      ResultSet rs;
      if(search_name==null||search_name.equals("")){
    	  k=0;
    	  rs=stmt.executeQuery("select count(*) as total from competition where com_type like '%"+com_type+"%'");
    	  while(rs.next())
    	   total=rs.getInt("total");
      rs=stmt.executeQuery("select * from competition where com_type like '%"+com_type+"%'");
      }
     
      else{
    	  k=1;
    	  rs=stmt.executeQuery("select count(*) as total from competition where com_name like '%"+search_name+"%' and com_type like '%"+com_type+"%'");
    	  while(rs.next())
       	   total=rs.getInt("total");
    	 rs=stmt.executeQuery("select * from competition where com_name like '%"+search_name+"%' and com_type like '%"+com_type+"%'");
    	 System.out.println("select * from competition where com_name like '%"+search_name+"%' and com_type like '%"+com_type+"%'");
      }
      rs.afterLast();
      
     
  %>
  

	<div
        class="parallax-image-wrapper"
        data-anchor-target="#page-intro"
        data-bottom-top="transform:translateY(200%)"
        data-top-bottom="transform:translateY(0)">

    <div
            class="parallax-image"
            style="background-image:url(/StudentPlatform/Competition/assets/images/coast.jpg)"
            data-anchor-target="#page-intro"
            data-bottom-top="transform: translateY(-80%);"
            data-top-bottom="transform: translateY(80%);"
            >

    </div>
</div>

      
         <%while(rs.previous()){ %>
              <div
        class="parallax-image-wrapper"
        data-anchor-target=".body-text<%=rs.getString("com_id") %> + .gap"
        data-bottom-top="transform:translateY(200%)"
        data-top-bottom="transform:translateY(0)">

    <div
            class="parallax-image"
            style="background-image:url('/StudentPlatform/Competition/<%=rs.getString("filename") %>')"
            data-anchor-target=".body-text<%=rs.getString("com_id") %>+ .gap"
            data-bottom-top="transform: translateY(-80%);"
            data-top-bottom="transform: translateY(80%);"
            >

    </div>
</div>

               
           <%
           count++;
           if(count>totalNumber)
        	   break;} %>
     


<div id="skrollr-body">

    <div id="page-intro" class="gap" style="background-image:url(/StudentPlatform/Competition/assets/images/coast.jpg); ">
        <div class="htmleaf-header">
          <h1>Competitions</h1>
          <br>

                <a href="/StudentPlatform/PersonalInformation/page2.jsp" style=" font-size:22px">个人中心</a>
                ·
                <a href="/StudentPlatform/Activity/chuan.jsp?personid=<%=(String)session.getAttribute("personId") %>&name=<%=(String)session.getAttribute("name") %>" style=" font-size:22px">活动日历</a>
                ·
                <a href="/StudentPlatform/Tieba/check.jsp?personid=<%=(String)session.getAttribute("personId") %>&name=<%=(String)session.getAttribute("name") %>" style=" font-size:22px">在线论坛</a>
                ·
                <a href="#" style=" font-size:22px">资料分享</a>
                ·
                <a href="/StudentPlatform/Competition/competitionCreate.jsp" style=" font-size:22px">创建竞赛</a>
                ·
                  <a href="/StudentPlatform/PersonalInformation/info_1_1.jsp" style=" font-size:22px">我的竞赛</a>
                ·
		<h1>竞赛详情与报名 </h1>
		
	</div>
    </div>
    
    
    <footer>

        <div class="footer-left" id="type">

            <h3 style="font-size:20px">竞赛类型</h3>

            <p class="footer-links">
                <%if(com_type.equals("工科")){ %>
                 <a href="/StudentPlatform/Competition/competition.jsp?com_type=工科#type" style="color:#337ab7">工科</a>
                <% }else{%>
                 <a href="/StudentPlatform/Competition/competition.jsp?com_type=工科#type" >工科</a>
                <%} %>
                
                 <%if(com_type.equals("文体")){ %>
                .<a href="/StudentPlatform/Competition/competition.jsp?com_type=文体#type" style="color:#337ab7">文体</a>
                 <% }else{%>
                · <a href="/StudentPlatform/Competition/competition.jsp?com_type=文体#type">文体</a>
                <%} %>
                
                 <%if(com_type.equals("理科")){ %>
                .<a href="/StudentPlatform/Competition/competition.jsp?com_type=理科#type" style="color:#337ab7">理科</a>
                 <% }else{%>
                · <a href="/StudentPlatform/Competition/competition.jsp?com_type=理科#type">理科</a>
                <%} %>
                
                 <%if(com_type.equals("商科")){ %>
                .<a href="/StudentPlatform/Competition/competition.jsp?com_type=商科#type" style="color:#337ab7">商科</a>
                 <% }else{%>
                · <a href="/StudentPlatform/Competition/competition.jsp?com_type=商科#type">商科</a>
                <%} %>
                
                 <%if(com_type.equals("综合")){ %>
                .<a href="/StudentPlatform/Competition/competition.jsp?com_type=综合#type" style="color:#337ab7">综合</a>
                 <% }else{%>
                · <a href="/StudentPlatform/Competition/competition.jsp?com_type=综合#type">综合</a>
                <%} %>
                
                 <%if(com_type.equals("类型")){ %>
                .<a href="/StudentPlatform/Competition/competition.jsp?com_type=类型#type" style="color:#337ab7">全部</a>.
                 <% }else{%>
                · <a href="/StudentPlatform/Competition/competition.jsp?com_type=类型#type">全部</a>.
                <%} %>
                
                
            </p>

            

        </div>

        <div class="footer-right"  data-bottom-top="max-width: 200px;" data-bottom-bottom="max-width: 600px;">

            <form method="post" action="/StudentPlatform/Competition/competition.jsp" name="search">
                <input  placeholder="输入你要找的竞赛名称" style="font-size:16px" name="search_name"/>
                  <a onclick="document.search.submit()"><i class="fa fa-search "></i></a>
            </form>
     
        </div>

    </footer>
    
    
    <%
       count=0;
       if(search_name==null||search_name.equals(""))
        rs=stmt.executeQuery("select * from competition where com_type like '%"+com_type+"%'");
        else{
      	 rs=stmt.executeQuery("select * from competition where com_name like '%"+search_name+"%' and com_type like '%"+com_type+"%'");
      	
        }
    rs.afterLast();
      while(rs.previous()){%>
      
        <div class="body-text<%=rs.getString("com_id") %>" id="<%=rs.getString("com_id") %>" style="padding: 140px 0;
    background-color: #fff;
    color: #25373C;
    font-size: 18px;
    text-align: center;">

         <h2 style=" font-size: 42px;
    font-weight: normal;
    margin-bottom: 40px;"><%=rs.getString("com_name") %><span style=" font-size:28px">--由<%=rs.getString("com_org") %>举办</span></h2>
    
                             <h3 style=" font-size: 26px;
    font-weight: normal;
    margin-bottom: 40px;">QQ群:<%=rs.getString("chat") %></h3>
                              
           <p data-300-center-top="transform: scale(0.8); opacity: 0" data-300-center-center="transform: scale(1); opacity: 1"
          style=" width: 28%;
    display: inline-block;
    text-align: left;
    padding: 24px;
    color: #45636B;">

             <span style=" font-size:20px">联系人QQ:<%=rs.getString("contact") %></span>
             
        </p>
        
          <p data-200-center-top="transform: scale(0.8); opacity: 0" data-200-center-center="transform: scale(1); opacity: 1"
         style=" width: 28%;
    display: inline-block;
    text-align: left;
    padding: 24px;
    color: #45636B;">
             <span style=" font-size:20px">报名时间:<%=rs.getString("sign_up_start") %>至<%=rs.getString("sign_up_end") %></span>
             </P>
             
           <p data-100-center-top="transform: scale(0.8); opacity: 0" data-100-center-center="transform: scale(1); opacity: 1"
             style=" width: 28%;
    display: inline-block;
    text-align: left;
    padding: 24px;
    color: #45636B;">
            <span style=" font-size:20px">活动时间:<%=rs.getString("act_start") %>至<%=rs.getString("act_end") %></span>
             </P>
             
           <hr>
           
            <textarea name="infor" readOnly cols="160"  rows="6"  class="txt">
           <%=rs.getString("infor") %>
            </textarea>
     
     <form action="/EnterSignUp" method="post">
      <input type=text style=" visibility:hidden" name="com_id" value="<%=rs.getString("com_id") %>"/>
        <input type=text style=" visibility:hidden" name="com_name" value="<%=rs.getString("com_name") %>"/>
          <input type=text style=" visibility:hidden" name="filename" value="<%=rs.getString("filename") %>"/>
          <input type=text style=" visibility:hidden" name="questionFile" value="<%=rs.getString("questionFile") %>"/>
                          <br>
                          <input type="submit" class="bt" value="报名"/>
     </form>


    
    </div>

    <div class="gap" style="background-image:url('/StudentPlatform/Competition/<%=rs.getString("filename") %>')"></div>
    
        <%
           count++;
        System.out.println("total:"+total+"count:"+count);
           if(count==total)
        	   end=1;
           else if(count>totalNumber){
        	   end=0;
        	   break;
           }
           } %>
   
    <div   class="body-text2" style="padding: 140px 0;
    background-color: #fff;
    color: #25373C;
    font-size: 18px;
    text-align: center;">
    <%String addMore="#";
    if(rs.previous()){
    	addMore="#"+rs.getString("com_id");
    }
    %>
    
                  <% if(number!=null){%>
                  <%if(k==1){ %>
                  <a href="/StudentPlatform/Competition/competition.jsp?number=<%=Integer.parseInt(number)+3%>&search_name=<%=search_name+""%><%=addMore%>">
                  <%}else{ %>
                   <a href="/StudentPlatform/Competition/competition.jsp?number=<%=Integer.parseInt(number)+3%><%=addMore%>">
                  <%} %>
                  
                       <%if(end==0){%>
                             加载更多
                             <%}else {%>
                             已达页面底部
                             <%} %>
                  </a>
                  
                  <%}else{ %>
                  <%if(k==1){ %>
                     <a href="/StudentPlatform/Competition/competition.jsp?number=2&search_name=<%=search_name+""%><%=addMore%>">
                     <%}else{ %>
                       <a href="/StudentPlatform/Competition/competition.jsp?number=4<%=addMore%>">
                       <%} %>
                      <%if(end==0){%>
                             加载更多
                             <%}else {%>
                             已达页面底部
                             <%} %>
                  </a>
                     <%} %>
                    
    </div>

 

	<script src="/StudentPlatform/Competition/assets/skrollr.min.js"></script>
	<script>
	    skrollr.init();
	</script>
</body>
</html>