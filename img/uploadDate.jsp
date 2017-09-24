<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
	<%
	String dateStr = request.getParameter("date");  
	SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy");
	Date utilDate = formater.parse(dateStr);
	java.sql.Date result=new java.sql.Date(utilDate.getTime());
	out.println(utilDate+"<br>");
	out.println(result);
	%>