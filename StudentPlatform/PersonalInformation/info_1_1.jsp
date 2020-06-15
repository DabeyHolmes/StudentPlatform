<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/5/1
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/a?useUnicode=true&characterEncoding=utf-8";//URL指向访问的数据库名
    String user = "root";//Mysql配置时的用户名
    String password = "dzb19980322";//密码
    System.out.println("succeed in");
    String id = request.getParameter("id");
    String stu_id = request.getParameter("stu_id");
    try {
        Class.forName(driver);//加载驱动程序
        Connection conn = DriverManager.getConnection(url,user,password);//链接数据库
        Statement ststment = conn.createStatement();//用来执行sql语言
        String sql = "DELETE FROM signup  WHERE com_id = '"+id+"' and stu_id= "+"'"+stu_id+"'";
        ststment.executeUpdate(sql);
        System.out.println("sql:"+sql);
        conn.close();
    }catch(ClassNotFoundException e){
        System.out.println("No Drive!");
        e.printStackTrace();
    }catch (SQLException e){
        e.printStackTrace();
    }catch(Exception e){
        e.printStackTrace();
    }
    
%>
<jsp:forward page="info_1.jsp"/>
