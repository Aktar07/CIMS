<%@ page import="java.sql.*" %>
<%!Statement st=null;
Connection cn=null;
%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/cid","root", "12345");
st=cn.createStatement();
%>