<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/11
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<html>
  <head>
      <title>个人中心</title>
      <meta http-equiv="Cache-Control" content="no-siteapp" />
      <link rel="icon" type="image/png" href="assets/i/favicon.png">
      <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
      <meta name="apple-mobile-web-app-title" content="Amaze UI" />
      <link rel="stylesheet" href="assets/css/amazeui.min.css" />
      <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
      <link rel="stylesheet" href="assets/css/app.css">
      <script src="assets/js/jquery.min.js"></script>
  </head>
  <body style="background: url('/StudentPlatform/PersonalInformation/images/fuck.jpg') no-repeat center center fixed;background-size: 100% 100%;">
  <%
      if(request.getAttribute("login")!=null){
          if(request.getAttribute("login").equals("no")){
  %><p>用户名或密码错误，请重新登录</p><%
          }
  }

  %>
  <div class="am-g tpl-g">
      <div class="tpl-login">

          <div class="tpl-login-content">
              <h1>东大园地信息平台</h1>
              <div class="tpl-login-title">用户登录</div>
              <span class="tpl-login-content-info"> Welcome</span><br>
              <span class="tpl-error-content"></span>
              <form class="am-form tpl-form-line-form" action="check.jsp" method="post">
                  <div class="am-form-group">
                  
                      <input type="text" class="tpl-form-input" id="id" name="id" placeholder="账号" required="required">
                  </div>
                  <div class="am-form-group">
                  
                      <input type="password" class="tpl-form-input" id="pass" name="pass" placeholder="请输入密码" onblur="checklen()" required="required">
                  </div>
                  <div class="am-form-group">
                      <button type="submit" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">提交</button>
                  </div>
                  <div class="am-form-group">
                      <a style="cursor: pointer" onclick="window.location.href='sign.jsp'">没有账号，注册</a>
                  </div>
              </form>
          </div>
      </div>
  </div>
  <script src="assets/js/amazeui.min.js"></script>
  <script src="assets/js/app.js"></script>
  </body>
</html>
