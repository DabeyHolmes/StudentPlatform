<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/21
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String post = request.getParameter("post");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/person?useUnicode=true&characterEncoding=utf-8";//URL指向访问的数据库名
    String user = "root";//Mysql配置时的用户名
    String password = "dzb19980322";//密码
    System.out.println("succeed in");
    try {
        Class.forName(driver);//加载驱动程序
        Connection conn = DriverManager.getConnection(url,user,password);//链接数据库
        Statement ststment = conn.createStatement();//用来执行sql语言
        boolean flag1 = false;
        boolean flag2 = false;
        String sql = "SELECT * FROM person_info WHERE id = '"+id+"'";
        ResultSet rs = ststment.executeQuery(sql);
        System.out.println("sql:"+sql);
        if(rs.next()){
            flag1 = true;
        }
        rs.close();
        String sql1 = "SELECT * FROM person_info WHERE post = '"+post+"'";
        ResultSet rs1 = ststment.executeQuery(sql1);
        System.out.println("sql1:"+sql1);
        if(rs1.next()){
            flag2 = true;
        }
        rs1.close();
        if (flag2) {
            if(flag1){
                request.setAttribute("pe","true");
                request.setAttribute("ie","true");
                System.out.println(11);
                %><jsp:forward page="sign.jsp"/><%
            }else{
                request.setAttribute("pe","true");
                request.setAttribute("ie","false");
                System.out.println(12);
                %><jsp:forward page="sign.jsp"/><%
            }
        } else {
            if (flag1) {
                request.setAttribute("pe","false");
                request.setAttribute("ie","true");
                System.out.println(21);
                %><jsp:forward page="sign.jsp"/><%
            } else {
                Person person = new Person(id,pass,post);
                session.setAttribute("Person",person.toString());
                session.setAttribute("person_id",id);
                session.setAttribute("person_name",person.getName());
                System.out.println(22);
                String sql2 = "INSERT INTO person_info VALUES ('"+person.getId()+"','"+person.getName()+"', '"+person.getPass()+
                        "', '"+person.getAge()+"', '"+person.getSex()+"', '"+person.getPost()+"', '"+person.getPhone()+
                        "', '"+person.getSign()+"', null)";
                ststment.executeUpdate(sql2);
                System.out.println("sql2:"+sql2);
                %><jsp:forward page="page2.jsp"/><%
            }
        }
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