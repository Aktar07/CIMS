<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == ""))
	response.sendRedirect("logout_code.jsp");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.sql.*"  %>
<%@ include file="header.jsp" %>
<%!
public int nullIntconv(String str)
{   
    int conv=0;
    if(str==null)
    {
        str="0";
    }
    else if((str.trim()).equals("null"))
    {
        str="0";
    }
    else if(str.equals(""))
    {
        str="0";
    }
    try{
        conv=Integer.parseInt(str);
    }
    catch(Exception e)
    {
    }
    return conv;
}
%>
<%
	String cText=(String)session.getAttribute("cText");
	String sText=(String)session.getAttribute("sText");
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cid","root", "12345");

    ResultSet rsPagination = null;
    ResultSet rsRowCnt = null;
    
    PreparedStatement psPagination=null;
    PreparedStatement psRowCnt=null;
    
    int iShowRows=10;  // Number of records show on per page
    int iTotalSearchRecords=200;  // Number of pages index shown
    
    int iTotalRows=nullIntconv(request.getParameter("iTotalRows"));
    int iTotalPages=nullIntconv(request.getParameter("iTotalPages"));
    int iPageNo=nullIntconv(request.getParameter("iPageNo"));
    int cPageNo=nullIntconv(request.getParameter("cPageNo"));
    
    int iStartResultNo=0;
    int iEndResultNo=0;
    
    if(iPageNo==0)
    {
        iPageNo=0;
    }
    else
	{
        iPageNo=Math.abs((iPageNo-1)*iShowRows);
    }
    

    
    String sqlPagination="SELECT SQL_CALC_FOUND_ROWS * FROM criminal,c_Details where criminal.C_ID=c_Details.C_ID and criminal.C_ID like ? limit "+iPageNo+","+iShowRows+"";
    psPagination=conn.prepareStatement(sqlPagination);
	psPagination.setString(1,"%"+sText+"%");
    rsPagination=psPagination.executeQuery();
    
    //// this will count total number of rows
     String sqlRowCnt="SELECT FOUND_ROWS() as cnt";
     psRowCnt=conn.prepareStatement(sqlRowCnt);
     rsRowCnt=psRowCnt.executeQuery();
     
     if(rsRowCnt.next())
      {
         iTotalRows=rsRowCnt.getInt("cnt");
      }
%>
<head>
  <link rel="stylesheet" href="search.css">
</head>
<div class="mainbody"">
<form name="frm">
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="iShowRows" value="<%=iShowRows%>">
<table width="100%" border="1">
<tr>
<th>ID</th>
<th>Name</th>
<th>ID 1</th>
<th>ID 2</th>
<th>Address</th>
<th>Date of Birth</th>
<th>Mobile</th>
<th>Crime No</th>
<th>Case No</th>
<th>Crime Type</th>
<th>Weapon</th>
<th>Jail_ID</th>
<th>ARD</th>
<th>Photo</th>
</tr>
<%
  while(rsPagination.next())
  {
%>
	<%
		String cri = rsPagination.getString("C_ID");
		String crn = rsPagination.getString("C_Name");
		String cd1 = rsPagination.getString("ID_Proof1");
		String cd2 = rsPagination.getString("ID_Proof2");
		String cra = rsPagination.getString("C_Address");
		String crdob = rsPagination.getString("DateOfBirth");
		String crmob = rsPagination.getString("Mobile");
		String crnn = rsPagination.getString("Crime_Number");
		String cd1c = rsPagination.getString("Case_No");
		String cd2t = rsPagination.getString("Crime_Type");
		String craw = rsPagination.getString("Weapon");
		String crdobj = rsPagination.getString("Jail_ID");
		String crmoba = rsPagination.getString("ARD");
	%>
    <tr>
		<td><%= cri %></td>
		<td><%= crn %></td>
		<td><%= cd1 %></td>
		<td><%= cd2 %></td>
		<td><%= cra %></td>
		<td><%= crdob %></td>
		<td><%= crmob %></td>
		<td><%= crnn %></td>
		<td><%= cd1c %></td>
		<td><%= cd2t %></td>
		<td><%= craw %></td>
		<td><center><%= crdobj %>
		<%
		out.println("<br><a href=\"search_jail.jsp?jail_sid="+ rsPagination.getString("Jail_ID") + "\">Detail</a></td></center>");
		%>
		<td><%= crmoba %></td>
		<td>
					<center>
					  <table>
					  <tr><td width="50px" height="50px">
					  <img src="testshow.jsp?disid=<%= cri %>" width="100%" height="100%" alt="Not Uploaded"/>
					 </td></tr>
					 </table>
					</center>
		<%
		out.println("<center><a href=\"r.jsp?discid="+ rsPagination.getString("C_ID") + "\">View</a></td></center>");
		%>
    </tr>
    <% 
 }
 %>
<%
  //// calculate next record start record  and end record 
        try{
            if(iTotalRows<(iPageNo+iShowRows))
            {
                iEndResultNo=iTotalRows;
            }
            else
            {
                iEndResultNo=(iPageNo+iShowRows);
            }
           
            iStartResultNo=(iPageNo+1);
            iTotalPages=((int)(Math.ceil((double)iTotalRows/iShowRows)));
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

%>
<tr>
<td colspan="15">
<div>
<%
        //// index of pages 
        
        int i=0;
        int cPage=0;
        if(iTotalRows!=0)
        {
        cPage=((int)(Math.ceil((double)iEndResultNo/(iTotalSearchRecords*iShowRows))));
        
        int prePageNo=(cPage*iTotalSearchRecords)-((iTotalSearchRecords-1)+iTotalSearchRecords);
        if((cPage*iTotalSearchRecords)-(iTotalSearchRecords)>0)
        {
         %>
          <a href="searchById.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
         <%
        }
        
        for(i=((cPage*iTotalSearchRecords)-(iTotalSearchRecords-1));i<=(cPage*iTotalSearchRecords);i++)
        {
          if(i==((iPageNo/iShowRows)+1))
          {
          %>
           <a href="searchById.jsp?iPageNo=<%=i%>" style="cursor:pointer;color:#DAA520"><b><%=i%></b></a>
          <%
          }
          else if(i<=iTotalPages)
          {
          %>
           <a href="searchById.jsp?iPageNo=<%=i%>"><%=i%></a>
          <% 
          }
        }
        if(iTotalPages>iTotalSearchRecords && i<iTotalPages)
        {
         %>
         <a href="searchById.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a> 
         <%
        }
        }
      %>
<b>&nbsp &nbsp &nbsp &nbsp &nbsp Rows <%=iStartResultNo%> - <%=iEndResultNo%>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Total Result--><%=iTotalRows%> </b>
</div>
</td>
</tr>
<tr>
<BR><BR>
<a style="display:block;color:Blue;" href="#" onclick="history.go(-1);return true;">Back</a>
</tr>
</table>
</form>
</div>
<%
    try{
         if(psPagination!=null){
             psPagination.close();
         }
         if(rsPagination!=null){
             rsPagination.close();
         }
         
         if(psRowCnt!=null){
             psRowCnt.close();
         }
         if(rsRowCnt!=null){
             rsRowCnt.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
<%@ include file="footer.jsp" %>