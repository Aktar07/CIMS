import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class servlet1 extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		out.println("<html><body>");
		out.println("<marquee>Welcome to MIET</marquee>");
	}
}