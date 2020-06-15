<%@ page import="control.Person" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.OutputStream" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/person?useUnicode=true&characterEncoding=utf-8";//URL指向访问的数据库名
    String user = "root";//Mysql配置时的用户名
    String password = "dzb19980322";//密码
    Gson g = new Gson();
    String person = (String)session.getAttribute("Person");
    System.out.println("person:"+person);
    Person p = g.fromJson(person,Person.class);
    System.out.println("show.jsp:"+person);
    try {
        Class.forName(driver);//加载驱动程序
        Connection conn = DriverManager.getConnection(url,user,password);//链接数据库
        Statement ststment = conn.createStatement();//用来执行sql语言
        String sql = "SELECT img FROM person_info WHERE id = "+p.getId();
        ResultSet rs = ststment.executeQuery(sql);
        System.out.println("got the rs");
        
        if(rs.next()){
            Blob b = rs.getBlob("img");
            if(b!=null){
                long size = b.length();
                byte[] bs = b.getBytes(1, (int)size);
                response.setContentType("image/jpeg");
                OutputStream outs = response.getOutputStream();
                outs.write(bs);
                outs.flush();
                outs.close();
            }
        }
        rs.close();
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
