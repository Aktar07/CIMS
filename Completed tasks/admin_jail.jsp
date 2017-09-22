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
	
	function addJailRec()
	{
		var s1 = "<form action='reg_jail.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' name='jailID' minlength='6' maxlength='15' id='jailID' placeholder='Enter Jail_ID' tabindex='1' class='formstyle' required autofocus='on'><br><br>";
		var s3 = "<input type='text' name='jailName' id='jailName' placeholder='Enter the Name of Jail' tabindex='2' class='formstyle' required ><br><br>";
		var s4 = "<input type='text' name='jailLoc' id='jailLoc' placeholder='Enter the Location (full address) of Jail' tabindex='3' class='formstyle' required><br><br>";
		var s5 = "<input type='text' name='jailCity' id='jailCity' placeholder='Enter the City of Jail' tabindex='4' class='formstyle' required ><br><br>";
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";
		var s7 = "<input type='text' name='jailState' id='jailState' placeholder='Enter the State of Jail' tabindex='5' class='formstyle' required><br><br>";
		var s8 = "<input type='number' min='111111' max='999999' name='jailPin' id='jailPin' placeholder='Enter the Pincode of Jail' tabindex='6' class='formstyle' required><br><br>";
		var s9 = "<input type='text' name='SupID' id='SupID' minlength='6' maxlength='15' placeholder='Enter the Superintendent ID of the Jail' tabindex='7' class='formstyle' required><br><br><br><br><br>";
		var s10 = "</div><input type='submit' name='submit' id='submitbtn' tabindex='8' value='Register' style='float:left;'>";
		var s11 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='8' onClick = 'clearForm()'></form><hr>";
		document.getElementById('newRec').innerHTML = s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11;
	}
	function clearMod()
	{
		document.getElementById('modRec').innerHTML="";
	}
	function modify(ri,rn,rl,rc,rst,rp,rsid)
	{
		var s1 = "<form action='mod_jail.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' name='jailID' minlength='6' maxlength='15' readonly id='jailID' value = " + ri + " placeholder='Enter Jail_ID' tabindex='1' class='formstyle' required autofocus='on'><br><br>";
		var s3 = "<input type='text' name='jailName' id='jailName' value = " + rn + " placeholder='Enter the Name of Jail' tabindex='2' class='formstyle' required ><br><br>";
		var s4 = "<input type='text' name='jailLoc' id='jailLoc' value = " + rl + " placeholder='Enter the Location (full address) of Jail' tabindex='3' class='formstyle' required><br><br>";
		var s5 = "<input type='text' name='jailCity' id='jailCity' value = " + rc + " placeholder='Enter the City of Jail' tabindex='4' class='formstyle' required ><br><br>";
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";
		var s7 = "<input type='text' name='jailState' id='jailState' value = " + rst + " placeholder='Enter the State of Jail' tabindex='5' class='formstyle' required><br><br>";
		var s8 = "<input type='number' min='111111' max='999999' name='jailPin' id='jailPin' readonly value = " + rp + " placeholder='Enter the Pincode of Jail' tabindex='6' class='formstyle' required><br><br>";
		var s9 = "<input type='text' name='SupID' id='SupID' minlength='6' maxlength='15' value = " + rsid + " placeholder='Enter the Superintendent ID of the Jail' tabindex='7' class='formstyle' required><br><br><br><br><br>";
		var s10 = "</div><input type='submit' name='submit' id='submitbtn' tabindex='8' value='Update' style='float:left;'>";
		var s11 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='8' onClick = 'clearMod()'></form><hr>";
		document.getElementById('modRec').innerHTML = s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11;
	}
</script>
<link rel='shortcut icon' type='image/x-icon' href='images/favicon.ico' />
<link rel="stylesheet" href="profile.css">
<title>Admin : Register Jail</title>
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
				<input type="button" value="Add New Jail" id="addnewrecord" onClick = "addJailRec()">
				</h2><hr><br><br>
					<div id="newRec">
	
					</div>
					<div id="modRec">
	
					</div>
					<%@ include file="admin_jail_search_result.jsp" %>
			</center>
		</div>
</div>
<!-- Main Body End -->

<!-- Footer Start -->
<%@ include file="footer.jsp" %>
<!-- Footer End -->
</body>
</html>