<%@page import="java.sql.*"%>
<%
	Connection connect = null;
	PreparedStatement ps = null;
	String re = request.getParameter("email");
	try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/cid","root","12345");
			ps = connect.prepareStatement("Delete from users where Email=?");
			ps.setString(1,re);
			int res = ps.executeUpdate();
			out.println("<script>alert(\"Record Deleted\");</script>");
			response.sendRedirect("admin.jsp");
		}
		catch(Exception e)
		{
			out.println("Error : " + e);
		}
%>