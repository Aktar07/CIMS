<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == ""))
	response.sendRedirect("login.jsp");
%>
<html>
<head>
<meta http-equiv="refresh" content="201;url=success.jsp" />
<SCRIPT LANGUAGE="javascript">
function ClearHistory()
{
     var backlen = history.length;
     history.go(-backlen);
     window.location.href = "login.jsp"
}
</SCRIPT>
<script>
	function clearForm()
	{
		document.getElementById('newRec').innerHTML = "";
	}
	
	function addStaffRec()
	{
		var s1 = "<form action='reg_staff.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' name='staffID' minlength='6' maxlength='15' id='staffID' placeholder='Enter Staff_ID' tabindex='1' class='formstyle' required autofocus='on'><br><br>";
		var s3 = "<input type='text' name='staffName' id='staffName' placeholder='Enter the Name of Staff' tabindex='2' class='formstyle' required ><br><br>";
		var s4 = "<input type='text' name='staffLoc' id='staffLoc' placeholder='Enter the full address of staff' tabindex='3' class='formstyle' required><br><br>";
		var s5 = "<input type='number' min='7000000000' max='9999999999' name='staffMobile' minlength='10' maxlength='10' id='staffMobile' placeholder='Enter Mobile Number of staff' tabindex='4' class='formstyle' required ><br><br>";
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";
		var s7 = "<input type='email' name='staffEmail' id='staffEmail' placeholder='Enter EmailID of staff' tabindex='5' class='formstyle' required><br><br>";
		var s8 = "<input type='text' name='staffPost' id='staffPost' placeholder='Enter Designation of staff' tabindex='6' class='formstyle' required><br><br>";
		var s9 = "<input type='number' name='staffSalary' id='staffSalary' minlength='4' maxlength='9' placeholder='Enter the Salary of the staff' tabindex='7' class='formstyle' required><br><br><br><br><br>";
		var s10 = "</div><input type='submit' name='submit' id='submitbtn' tabindex='8' value='Register' style='float:left;'>";
		var s11 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='8' onClick = 'clearForm()'></form><hr>";
		document.getElementById('newRec').innerHTML = s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11;
	}
	function clearMod()
	{
		document.getElementById('modRec').innerHTML="";
	}
	function modify(si,sn,sa,sm,se,sd,ss)
	{
		var s1 = "<form action='mod_staff.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' name='staffID' minlength='6' maxlength='15' readonly id='staffID' value = " + si + " placeholder='Enter Staff_ID' tabindex='1' class='formstyle' required autofocus='on'><br><br>";
		var s3 = "<input type='text' name='staffName' id='staffName' value = " + sn + " placeholder='Enter the Name of Staff' tabindex='2' class='formstyle' required ><br><br>";
		var s4 = "<input type='text' name='staffLoc' id='staffLoc' value = " + sa + " placeholder='Enter the Location (full address) of Staff' tabindex='3' class='formstyle' required><br><br>";
		var s5 = "<input type='number' name='staffMobile' readonly min='7000000000' max='9999999999' minlength='10' maxlength='10' id='staffMobile' value = " + sm + " placeholder='Enter Mobile Number of Staff' tabindex='4' class='formstyle' required ><br><br>";
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";
		var s7 = "<input type='email' name='staffEmail' id='staffEmail' value = " + se + " placeholder='Enter EmailID of Staff' tabindex='5' class='formstyle' required><br><br>";
		var s8 = "<input type='text' name='staffPost' id='staffPost' value = " + sd + " placeholder='Enter the Designation of staff' tabindex='6' class='formstyle' required><br><br>";
		var s9 = "<input type='number' name='staffSalary' id='staffSalary' minlength='4' maxlength='9' value = " + ss + " placeholder='Enter the Salary of the staff' tabindex='7' class='formstyle' required><br><br><br><br><br>";
		var s10 = "</div><input type='submit' name='submit' id='submitbtn' tabindex='8' value='Update' style='float:left;'>";
		var s11 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='8' onClick = 'clearMod()'></form><hr>";
		document.getElementById('modRec').innerHTML = s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11;
	}
</script>
<link rel='shortcut icon' type='image/x-icon' href='images/favicon.ico' />
<link rel="stylesheet" href="profile.css">
<title>Admin : Register Staff</title>
</head>
<body>
<!-- Header Start -->
<%@ include file="header.jsp" %>
<!-- Header End -->

<!-- Main Body Start -->
<div class="mainbody"">

		<%@ include file="admin_menu.jsp"%>
		<!-- Divider Start -->
		<div class="hbar">
		</div>
		<!-- Divider End -->
		<div class="regcontent">
			<center>
				<h1><b>Administration Module</b></h1><hr>
				<h2>
				<input type="button" value="Add New Staff" id="addnewrecord" onClick = "addStaffRec()">
				</h2><hr><br><br>
					<div id="newRec">
					
					</div>
					<div id="modRec">
					
					</div>
					<%@ include file="admin_staff_search_result.jsp" %>
			</center>
		</div>
</div>
<!-- Main Body End -->

<!-- Footer Start -->
<%@ include file="footer.jsp" %>
<!-- Footer End -->
</body>
</html>