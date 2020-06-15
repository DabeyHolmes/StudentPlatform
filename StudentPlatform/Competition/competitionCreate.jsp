<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>创建竞赛</title>
        
         <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="/StudentPlatform/Competition/css/default1.css">
        <link href="/StudentPlatform/Competition/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
         <script src="/StudentPlatform/Competition/js/fileinput.js" type="text/javascript"></script>
        <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
            
</head>
<body>

  
              <%String success=(String)request.getAttribute("success");%>
              <div class="htmleaf-container">
                <header class="htmleaf-header">
                    <h1>创建竞赛</h1>
                </header>
                <div class="container kv-main">
                    <div class="page-header">
                    <h2>请完整填写相关信息</h2>
                    </div>
                    <form enctype="multipart/form-data" method="post" action="/TestServlet">

                        <label><h3>竞赛名称</h3></label>
                        <input  type="text" name="com_name" />
                         
                        <label style="margin-left:200px"><h3>举办组织</h3></label>
                        <input  type="text" name="com_org"/>
                         <hr>
                        <label><h3>竞赛qq群</h3></label>
                        <input  type="text" name="chat" />
                        
                         <label style="margin-left:200px"><h3>联系人qq</h3></label>
                        <input  type="text" name="contact" />
                        <hr>
                        <label><h3>竞赛海报</h3></label>
                        <br>
                       <input name="file" class="file" type="file"  multiple data-min-file-count="1">
                          <br>
                         <hr>
                        <label><h3>竞赛题库</h3></label>
                        <br>
                        <input name="questionFile" class="file" type="file" multiple data-min-file-count="1">
                          <br>
                         <hr>
                        <label><h3>报名时间</h3></label>
                        <label style="margin-left:480px"><h3>活动类型</h3></label>
                        <br>
                        
                        <input  type="date" name="sign_up_start" />
                        <span>至</span>
                         
                        <input  type="date" name="sign_up_end" />
                        
                       
<select class="js-example-basic-single js-states form-control" id="id_label_single2" name="com_type" 
 style="width: 100px; display:inline;margin-left:224px" >
                          <option value="工科">工科</option>
                          <option value="文体">文体</option>
                          <option value="理科">理科</option>
                          <option value="商科">商科</option>
                          <option value="综合">综合</option>
                        </select>                      
                       
                        <hr>
                         <label><h3>活动时间</h3></label>
                        <br>
                        <input  type="date" name="act_start" />
                        <span>至</span>
                         
                        <input  type="date" name="act_end" />
                        <hr>
                         
                        <label><h3>活动信息</h3></label>
                        <br>
                        <textarea name="infor" cols="100" rows="15"></textarea>
                        <hr>
                       <%if(success!=null)  {%>
                       <h4 style="color:#F33" id="success"><%=success %></h4>
                       <%} %>
                        <button type="submit" class="btn btn-primary" >Submit</button>
                        <button type="reset" class="btn btn-default">Reset</button>
                        
                    </form>
                 </div>
                 </div>
</body>
</html>