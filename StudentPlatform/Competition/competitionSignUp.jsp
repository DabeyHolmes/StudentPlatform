<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>竞赛报名</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Free Bootstrap 4 Theme by ProBootstrap.com">
<meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
    
   
		<link rel="stylesheet" href="/StudentPlatform/Competition/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="/StudentPlatform/Competition/css/animate.css">
    
    
  

    <link rel="stylesheet" href="/StudentPlatform/Competition/css/select2.css">
    

  
    <link rel="stylesheet" href="/StudentPlatform/Competition/css/style.css">

</head>
<body>
<%
response.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
String name=(String)session.getAttribute("name");
String personId=(String)session.getAttribute("personId");
%>
 <nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
      <div class="container">
        <a class="navbar-brand" href="/">Places</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
          <span><i class="ion-navicon"></i></span>
        </button>
        <div class="collapse navbar-collapse" id="probootstrap-menu">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="/StudentPlatform/Competition/competition.jsp" style="font-size:16px;">竞赛展示</a></li>
            <li class="nav-item"><a class="nav-link" 
            href="/StudentPlatform/Activity/chuan.jsp?personid=<%=(String)session.getAttribute("personId") %>&name=<%=(String)session.getAttribute("name") %>"
            style="font-size:16px;">活动日历</a></li>
            <li class="nav-item"><a class="nav-link" href="services.html"style="font-size:16px;">在线论坛</a></li>
            <li class="nav-item"><a class="nav-link" href="/StudentPlatform/PersonalInformation/page2.jsp"style="font-size:16px;">资料分享</a></li>
            <li class="nav-item"><a class="nav-link" 
            href="/StudentPlatform/Tieba/check.jsp?personid=<%=(String)session.getAttribute("personId") %>&name=<%=(String)session.getAttribute("name") %>"
             style="font-size:16px;">在线论坛</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- END nav -->
    
   
    <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url(/StudentPlatform/Competition/${filename});" data-stellar-background-ratio="0.5"  id="section-home">
      <div class="overlay" style="height:1000px" ></div>
       
      <div class="container">
      
        <div class="row align-items-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">${com_name}</h2>
            <p class="lead mb-5 probootstrap-animate">
              

            </p>
              <a href="/DownServlet?questionFileName=${questionFile}" role="button"
               class="btn btn-primary p-3 mr-3 pl-5 pr-5 text-uppercase d-lg-inline d-md-inline d-sm-block d-block mb-3"
               >点击下载题库</a> 
            </p>
          </div> 
          <div class="col-md probootstrap-animate">
          
            <form action="/SignUpInformation" class="probootstrap-form" method="post">
              <div class="form-group">
              
                                <h4 style="color:#F33">${success}</h4>
                <div class="row mb-3">
                  <div class="col-md">
                    <div class="form-group">
                      
                      <label for="id_label_single">学校名称</label>
                      <div class="probootstrap-date-wrap">
<select class="js-example-basic-single js-states form-control" id="id_label_single2" name="school"  style="width: 100%;" >
                          <option value="东北大学">东北大学</option>
                          <option value="吉林大学">吉林大学</option>
                          <option value="北京大学">北京大学</option>
                          <option value="大连理工大学">大连理工大学</option>
                          <option value="哈尔滨工业大学">哈尔滨工业大学</option>
                          <option value="清华大学">清华大学</option>
                          <option value="东南大学">东南大学</option>
                          <option value="武汉大学">武汉大学</option>
                          <option value="郑州大学">郑州大学</option>
                          <option value="西北工业大学">西北工业大学</option>
                          <option value="中国科技大学">中国科技大学</option>
                        </select>                      
                        </div>

                    </div>
                  </div>
                  <div class="col-md">
                    <div class="form-group">
                      <label for="id_label_single2">团队名称</label>
                      <div class="probootstrap_select-wrap">
                       <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                        <input type="text" name="team" class="form-control" placeholder="">
                      </div>
                        
                      </div>
                    </div>
                  </div>
                  <div class="col-md">
                    <div class="form-group">
                      <label for="id_label_single2">个人姓名</label>
                      <div class="probootstrap_select-wrap">
                       <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                       <input type="text" name="personName" class="form-control" value="<%=name %>"  />
                      </div>
                        
                      </div>
                    </div>
                  </div>
                </div>
                <!-- END row -->
                <div class="row mb-5">
                  <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-departure">联系方式（手机）</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                       <input type="text"  name="phoneNumber" class="form-control" placeholder="">
                      </div>
                    </div>
                  </div>
                 
                   <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-arrival">成员1(选填)</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                        <input type="text" name="member1"  class="form-control" placeholder="">
                      </div>
                    </div>
                  </div>
                    <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-arrival">成员2(选填)</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                        <input type="text" name="member2"  class="form-control" placeholder="">
                      </div>
                    </div>
                  </div>
                  </div>
                  
                  <div class="row mb-5">
                
                   <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-arrival">QQ号</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                         <input type="text" name="qq" class="form-control" placeholder="">
                      </div>
                    </div>
                  </div>
                 <div class="col-md">
                    <div class="form-group">
                      <label for="probootstrap-date-arrival">详细地址</label>
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                        <input type="text" name="address" class="form-control" placeholder="">
                      </div>
                    </div>
                  </div>
                  </div>
                  
                  
                
                <!-- END row -->
                <div class="row">
                  <div class="col-md">
                    <input type="submit" value="提交" class="btn btn-primary btn-block">
                        <div class="row mb-5">
                  <div class="col-md">
                    

                      <div class="probootstrap-date-wrap">

                        <span class="icon ion-calendar"></span> 
                          <input type=text style=" visibility:hidden"
                  name="com_id" class="form-control" value="${com_id}" />
                      </div>
                   
                  </div>
                  <div class="col-md">
                 
                      
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
                       <input type=text style=" visibility:hidden"
                  name="com_name" class="form-control" value="${com_name}" />                      
                  </div>
                  
                  </div>
                  <div class="col-md">
                    
                      
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
  <input type=text style=" visibility:hidden"
                  name="filename" class="form-control" value="${filename}" />                      </div>
                    </div>
                    
                     <div class="col-md">
                      
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
  <input type=text style=" visibility:hidden"
                  name="questionFile" class="form-control" value="${questionFile}" />                      </div>
                    </div>
                    
                    <div class="col-md">
                      
                      <div class="probootstrap-date-wrap">
                        <span class="icon ion-calendar"></span> 
  <input type=text style=" visibility:hidden"
                  name="stu_id" class="form-control" value="<%=personId %>" />                      </div>
                    </div>
                  
                </div>
                   
                 
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>

      </div>
    
    </section>
  

    
    <script src="/StudentPlatform/Competition/js/jquery.min.js"></script>
    
 
    <script src="/StudentPlatform/Competition/js/jquery.waypoints.min.js"></script>


    <script src="/StudentPlatform/Competition/js/select2.min.js"></script>

    <script src="/StudentPlatform/Competition/js/main.js"></script>
</body>
</html>