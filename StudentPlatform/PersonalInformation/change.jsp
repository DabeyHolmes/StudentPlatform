<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/19
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    Gson gson = new Gson();
    String person = (String)session.getAttribute("Person");
    Person p = gson.fromJson(person,Person.class);
    p.setName(request.getParameter("name"));
    if(request.getParameter("age")==null||request.getParameter("age").equals(""))
        p.setAge(0);
    else
        p.setAge(Integer.valueOf(request.getParameter("age")));
    p.setSex(request.getParameter("sex"));
    p.setPost(request.getParameter("post"));
    p.setPhone(request.getParameter("phone"));
    p.setSign(request.getParameter("sign"));
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/person?useUnicode=true&characterEncoding=utf-8";//URL指向访问的数据库名
    String user = "root";//Mysql配置时的用户名
    String password = "dzb19980322";//密码
    try {
        Class.forName(driver);//加载驱动程序
        Connection conn = DriverManager.getConnection(url,user,password);//链接数据库
        Statement ststment = conn.createStatement();//用来执行sql语言
        String sql = "UPDATE person_info SET name = '"+p.getName()+"',age = '"+p.getAge()+"',sex = '"+p.getSex()+
                "',post = '"+p.getPost()+"',phone = '"+p.getPhone()+"',sign = '"+p.getSign()+"' WHERE id = "+p.getId();
        ststment.executeUpdate(sql);
        conn.close();
    }catch(ClassNotFoundException e){
        System.out.println("No Drive!");
        e.printStackTrace();
    }catch (SQLException e){
        e.printStackTrace();
    }catch(Exception e){
        e.printStackTrace();
    }
    session.setAttribute("Person",p.toString());
%>
<jsp:forward page="page2.jsp"/>