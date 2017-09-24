import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class includeservlet extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
			out.println("Welcome to Meerut");
			out.flush();
			ServletContext con=getServletContext();
			RequestDispatcher rd=con.getRequestDispatcher("servlet1");
			rd.include(req,res);
			out.println("Welcome to India");
	}
}