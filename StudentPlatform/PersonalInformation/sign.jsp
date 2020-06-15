<%@ page import="control.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/19
  Time: 2:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Sign</title>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="assets/css/app.css">
    <script src="assets/js/jquery.min.js"></script>
</head>
<body data-type="login" class="theme-white" style="background: url('/StudentPlatform/PersonalInformation/images/fuck1.jpg') no-repeat center center fixed;background-size: 100% 100%;">
<%
    request.setCharacterEncoding("utf-8");
    String pe = "";
    String ie = "";
    String PE = (String)request.getAttribute("pe");
    String IE = (String)request.getAttribute("ie");
    if(PE != null){
        if(PE.equals("true")){
            pe = "该邮箱已被注册";
            System.out.println(pe);
        }
    }
    if(IE != null){
        if(IE.equals("true")){
            ie = "该用户名已被注册";
            System.out.println(ie);
        }
    }
%>
<script>
    function checklen() {
        if(input1.value.length>20){
            alert("密码长度过长！")
            input1.value = "";
        }
    }
    function check2pwd() {
        if(input1.value != input2.value) {
            alert("两次输入密码不一致！")
            input1.value = "";
            input2.value = "";
        }
    }

    function checkform(){
        var email = post.value;
        console.log("email:"+email);
        console.log(email.value);
        var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
        isok= reg.test(email);
        console.log(isok);
        if (!isok) {
            alert("邮箱格式错误");
            post.value = "";
        }
    }

    function checknum() {
        var num = id1.value;
        var reg = /^[\d]+$/;
        var length = num.length;
        ok = reg.test(num);
        if(!ok){
            alert("账号格式错误");
            id1.value = "";
        }else if(length >10){
            alert("账号长度错误");
            id1.value = "";
        }
    }

</script>
<div class="am-g tpl-g">
    <div class="tpl-login">
        <div class="tpl-login-content">
            <div class="tpl-login-title">注册用户</div>
            <span class="tpl-login-content-info"> 创建一个新的用户 </span><br>
            <span class="tpl-error-content"><%=pe%><%=ie%></span>
            <form class="am-form tpl-form-line-form" action="checksign.jsp" method="post">
                <div class="am-form-group">
                    <input type="text" class="tpl-form-input" id="post" name="post" placeholder="邮箱" onblur="checkform()" required="required">
                </div>
                <div class="am-form-group">
                    <input type="text" class="tpl-form-input" id="id1" name="id" placeholder="账号(不超过十位的数字)" onblur="checknum()" required="required">
                </div>
                <div class="am-form-group">
                    <input type="password" class="tpl-form-input" id="input1" name="pass" placeholder="请输入密码" onblur="checklen()" required="required">
                </div>
                <div class="am-form-group">
                    <input type="password" class="tpl-form-input" id="input2" placeholder="再次输入密码"  onblur="check2pwd()" required="required">
                </div>
                <div class="am-form-group">
                    <button type="submit" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</body>
</html>
