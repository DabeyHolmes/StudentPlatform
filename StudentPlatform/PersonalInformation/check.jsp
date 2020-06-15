<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/19
  Time: 2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%@ page import="control.Persons" %>
<%@ page import="java.sql.*" %>
<%
    String id1 = (String)request.getParameter("id");
    String pass1 = (String)request.getParameter("pass");
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/person?useUnicode=true&characterEncoding=utf-8";//URL指向访问的数据库名
    String user = "root";//Mysql配置时的用户名
    String password = "dzb19980322";//密码

    String id;
    String pass;
    String name;
    String sex;
    String post;
    String phone;
    String sign;
    int age;

    try {
        Class.forName(driver);//加载驱动程序
        Connection conn = DriverManager.getConnection(url,user,password);//链接数据库
        Statement ststment = conn.createStatement();//用来执行sql语言
        String sql = "SELECT * FROM person_info WHERE id = "+id1;
        ResultSet rs = ststment.executeQuery(sql);
        if(rs.next()){
            id = rs.getString("id");
            pass = rs.getString("pass");
            name = rs.getString("name");
            post = rs.getString("post");
            phone = rs.getString("phone");
            sign = rs.getString("sign");
            age = rs.getInt("age");
            sex = rs.getString("sex");
            Person person = new Person(name,id,pass,age,sex,post,phone,sign);
            if(person!=null){
                request.setAttribute("login","yes");
                String pp = person.toString();
                session.setAttribute("Person",pp);
                session.setAttribute("person_id",id);
                session.setAttribute("person_name",name);
                System.out.println(person.toString());%>
                <jsp:forward page="page2.jsp"/>
                <%
            }
        }else{
            request.setAttribute("login","no");
            %><jsp:forward page="index.jsp"/><%
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