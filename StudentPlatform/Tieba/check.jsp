<%--
  Created by IntelliJ IDEA.
  User: DZB
  Date: 2018/4/19
  Time: 2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%
String name=request.getParameter("name");
String personId=request.getParameter("personid");
session.setAttribute("name", name);
session.setAttribute("personId", personId);
response.sendRedirect("activity.jsp");
%>