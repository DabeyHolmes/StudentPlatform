<%@ page import="java.sql.*" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="control.Person" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.annotation.MultipartConfig" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/24
  Time: 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<%

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/person?useUnicode=true&characterEncoding=utf-8";//URL指向访问的数据库名
    String user = "root";//Mysql配置时的用户名
    String password = "dzb19980322";//密码
    String filename=(String)request.getAttribute("filename");
    System.out.println(filename);
    request.setCharacterEncoding("utf-8");
  
    Gson gson = new Gson();
    String person = (String)session.getAttribute("Person");
    Person p = gson.fromJson(person, Person.class);
    try {
        Class.forName(driver);//加载驱动程序
        Connection conn = DriverManager.getConnection(url,user,password);//链接数据库
        Statement ststment = conn.createStatement();//用来执行sql语言
        String sql = "UPDATE person_info SET img = ? WHERE id = "+p.getId();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        InputStream str = new FileInputStream(filename);
        pstmt.setBinaryStream(1,str);
        pstmt.executeUpdate();
        conn.close();
        str.close();
    }catch(ClassNotFoundException e){
        System.out.println("No Drive!");
        e.printStackTrace();
    }catch (SQLException e){
        e.printStackTrace();
    }catch(Exception e){
        e.printStackTrace();
    }
%>
<jsp:forward page="page2.jsp"/>