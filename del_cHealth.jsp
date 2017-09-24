<%@page import="java.sql.*"%>
<%
	Connection connect = null;
	PreparedStatement ps = null;
	String cid = request.getParameter("Hcrid");
	try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/cid","root","12345");
			ps = connect.prepareStatement("Delete from chealth where C_ID=?");
			ps.setString(1,cid);
			int res = ps.executeUpdate();
			out.println("<script>alert(\"Record Deleted\");</script>");
			response.sendRedirect("jailer_criminal_info.jsp");
		}
		catch(Exception e)
		{
			out.println("Error : " + e);
		}
%>