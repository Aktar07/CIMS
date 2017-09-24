<%@page import="java.sql.*"%>
<%
	Connection connect = null;
	PreparedStatement ps = null;
	String jid = request.getParameter("ID");
	try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/cid","root","12345");
			ps = connect.prepareStatement("Delete from jail where ID=?");
			ps.setString(1,jid);
			int res = ps.executeUpdate();
			out.println("<script>alert(\"Record Deleted\");</script>");
			response.sendRedirect("admin_jail.jsp");
		}
		catch(Exception e)
		{
			out.println("Error : " + e);
		}
%>