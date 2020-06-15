
<%@ page contentType="text/html;charset=UTF-8" language="java" import="control.Person" %>
<%
String name=request.getParameter("name");
String personId=request.getParameter("personid");
session.setAttribute("name", name);
session.setAttribute("personId", personId);
response.sendRedirect("competition.jsp");
%>
