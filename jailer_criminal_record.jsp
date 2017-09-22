<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")||(!session.getAttribute("group").equals("Jailer")))
	response.sendRedirect("logout_code.jsp");
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
	
	function addCrimeRec()
	{
		var s1 = "<form action='reg_criminal.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' name='crID' id='crID' placeholder='Enter Criminal ID' tabindex='1' class='formstyle' maxlength='15' minlength='6' required autofocus='on'><br><br>";
		var s3 = "<input type='text' name='cr_name' id='cr_name' maxlength='50' placeholder='Enter Criminal Name' tabindex='2' class='formstyle' required><br><br>";
		var s4 = "<input type='text' name='cr_id1' id='cr_id1' maxlength='50' placeholder='Enter first ID Proof' tabindex='3' class='formstyle' required><br><br>";
		var s5 = "<input type='text' name='cr_id2' id='c_id2' placeholder='Enter Second ID Proof(optional)' tabindex='4' class='formstyle' required><br><br>";
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";
		var s8 = "<input type='text' name='cr_address' id='cr_address' maxlength='200' placeholder='Enter Address of Criminal' tabindex='5' class='formstyle' required><br><br>";
		var s10 = "<input type='number' name='cr_dob' id='cr_dob' placeholder='Enter date of birth of Criminal(DDMMYYYY)' tabindex='7' class='formstyle' min='01011900' max='31122015' required><br><br>";
		var s11 = "<input type='number' name='cr_mobile' id='cr_mobile' max='9999999999' maxlength='10' min='7000000000' placeholder='Enter Mobile Number of Criminal' tabindex='8' class='formstyle' required><br><br>";
		var s12 = "<br><br></div><div style='float:right;width:100%;padding-right:5%' align='center'>";
		var s13 = "<input type='submit' name='submit' id='submitbtn' tabindex='9' value='Register'>";
		var s14 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='10' onClick = 'clearForm()'></div></form>";
		document.getElementById('newRec').innerHTML = s1+s2+s3+s4+s5+s6+s8+s10+s11+s12+s13+s14;
	}
	function clearMod()
	{
		document.getElementById('modRec').innerHTML="";
	}
	function modify(cri,crn,cd1,cd2,cra,crdob,crmob)
	{
		var s1 = "<form action='mod_criminal.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' name='crID' id='crID' value = " + cri + " placeholder='Enter Criminal ID' tabindex='1' class='formstyle' maxlength='15' minlength='6' required autofocus='on' readonly><br><br>";
		var s3 = "<input type='text' name='cr_name' id='cr_name' value = " + crn + " maxlength='50' placeholder='Enter Criminal Name' tabindex='2' class='formstyle' required><br><br>";
		var s4 = "<input type='text' name='cr_id1' id='cr_id2' value = " + cd1 + " maxlength='50' placeholder='Enter first ID Proof' tabindex='3' class='formstyle' required><br><br>";
		var s5 = "<input type='text' name='cr_id2' id='c_id2' value = " + cd2 + " placeholder='Enter Second ID Proof(optional)' tabindex='4' class='formstyle' required><br><br>";
	
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";

		var s8 = "<input type='text' name='cr_address' id='cr_address' value = " + cra + " maxlength='200' placeholder='Enter Address of Criminal' tabindex='5' class='formstyle' required><br><br>";
		var s10 = "<input type='number' name='cr_dob' min='01011900' max='31122015' id='cr_dob' value = " + crdob + " title='Enter date of birth of Criminal(DDMMYYYY)' tabindex='7' class='formstyle' required><br><br>";
		var s11 = "<input type='number' name='cr_mobile' id='cr_mobile' value = " + crmob + " max='9999999999' min='7000000000' placeholder='Enter Mobile Number of Criminal' tabindex='8' class='formstyle' required><br><br>";
		var s12 = "<br><br></div><div style='float:right;width:100%;padding-right:5%' align='center'>";
		var s13 = "<input type='submit' name='submit' id='submitbtn' tabindex='9' value='Update'>";
		var s14 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='10' onClick = 'clearMod()'></div></form>";
		document.getElementById('modRec').innerHTML = s1+s2+s3+s4+s5+s6+s8+s10+s11+s12+s13+s14;
	}
</script>
<link rel='shortcut icon' type='image/x-icon' href='images/favicon.ico' />
<link rel="stylesheet" href="jailer.css">
<title>Jailer : Register Criminal</title>
</head>
<body>
<!-- Header Start -->
<%@ include file="header.jsp" %>
<!-- Header End -->

<!-- Main Body Start -->
<div class="mainbody"">

		<%@ include file="jailer_menu.jsp"%>
		<!-- Divider Start -->
		<div class="hbar">
		</div>
		<!-- Divider End -->
		<div class="regcontent">
				<center>
				<h2>
				<input type="button" value="Add New Criminal" id="submitbtn" onClick="addCrimeRec()">
				</h2><hr></center>
					<div id="newRec">
	
					</div>
					<div id="modRec">
	
					</div>
			<%@ include file="jailer_criminal_pagination.jsp" %>
		</div>
</div>
<!-- Main Body End -->

<!-- Footer Start -->
<%@ include file="footer.jsp" %>
<!-- Footer End -->
</body>
</html>