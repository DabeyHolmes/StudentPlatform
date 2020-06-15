<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/19
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%@ page import="com.google.gson.Gson" %>
<%
    Gson g = new Gson();
    String person = (String)session.getAttribute("Person");
    System.out.println("person:"+person);
    Person p = g.fromJson(person,Person.class);
    String id = p.getId();
    String name = "";
    String sex = "";
    String age = "";
    String post = "";
    String phone = "";
    String sign = "";
    if(p.getName()!=null){
        name = p.getName();
    }
    if(p.getSex()!=null){
        sex = p.getSex();
    }
    if(p.getAge()!=0){
        age = String.valueOf(p.getAge());
    }
    if(p.getPost()!=null){
        post = p.getPost();
    }
    if(p.getPhone()!=null){
        phone = p.getPhone();
    }
    if(p.getSign()!=null){
        sign = p.getSign();
    }
    session.setAttribute("Person",person);
%>