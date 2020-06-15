<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8"/>
        <title>Krajee JQuery Plugins - &copy; Kartik</title>
        <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/StudentPlatform/Tieba/css/default.css">
        <link href="/StudentPlatform/Tieba/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
        <script src="/StudentPlatform/Tieba/scripts/fileinput.js" type="text/javascript"></script>
</head>
<body>


            <div class="htmleaf-container">
                <header class="htmleaf-header">
                    <h1>评论</h1>
                    
                    </div>
                </header>
                <div class="container kv-main">
                    <div class="page-header">
                    <h2>请发表评论</h2>
                    </div>
                    <form method="post" action="/Servlet2">
                        <hr>
                        <label><h3>评论内容</h3></label>
                        <br>
                        <textarea name="infor" cols="100" rows="15"></textarea> 
                         <hr>
                        <button type="submit" class="btn btn-primary">Submit</button>                        
                        <input type=text style=" visibility:hidden" name="TiebaId" value="<%=request.getParameter("id") %>"/>
					<input type=text style=" visibility:hidden" name="personname" value="<%=request.getParameter("name") %>"/>                       
                    </form>
                    
</body>
</html>