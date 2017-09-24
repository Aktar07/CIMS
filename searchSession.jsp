<%
    String criteriaText = request.getParameter("group");    
    String searchText = request.getParameter("search");
	session.setAttribute("cText", criteriaText);
	session.setAttribute("sText", searchText);
	session.setMaxInactiveInterval(60);
    response.sendRedirect("search.jsp");
%>