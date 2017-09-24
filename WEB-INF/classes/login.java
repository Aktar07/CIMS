import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class login extends HttpServlet
{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		PrintWriter pw=res.getWriter();
		String c_name=req.getParameter("luname");
		String c_pass=req.getParameter("lupass");
		if(c_name.equals("Ketan") && c_pass.equals("12345"))
		{
			res.sendRedirect("index.html");
		}
		else
		{
			pw.println("Please enter correct values");
		}
	}
}