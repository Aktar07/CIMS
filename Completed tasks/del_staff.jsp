<%@page import="java.sql.*"%>
<%
	Connection connect = null;
	PreparedStatement ps = null;
	String staffID= request.getParameter("staffID");
	try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/cid","root","12345");
			ps = connect.prepareStatement("Delete from staff where Staff_ID=?");
			ps.setString(1,staffID);
			int res = ps.executeUpdate();
			out.println("<script>alert(\"Record Deleted\");</script>");
			response.sendRedirect("admin_staff.jsp");
		}
		catch(Exception e)
		{
			out.println("Error : " + e);
		}
%>