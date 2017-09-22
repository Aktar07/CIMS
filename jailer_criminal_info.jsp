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
		var s1 = "<form action='reg_cHealth.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' name='Hcrid' id='Hcrid' placeholder='Enter Criminal ID' tabindex='1' class='formstyle' maxlength='15' minlength='6' required autofocus='on'><br><br>";
		var s3 = "<input type='text' name='cr_mark' id='cr_mark' maxlength='100' minlength='10' placeholder='Enter Criminals Marks Identification' tabindex='2' class='formstyle' required><br><br>";
		var s4 = "<select id='group' name='group' title='Choose the group' tabindex='3' required><option value='O+'>O+</option><option value='O-'>O-</option><option value='A+'>A+</option><option value='A-'>A-</option><option value='B+'>B+</option><option value='B-'>B-</option><option value='AB+'>AB+</option><option value='AB-'>AB-</option></select><br><br>";
		var s5 = "<input type='text' name='cr_dna' id='c_dna' maxlength='50' placeholder='Enter DNA values of Criminal ( manual )' tabindex='4' class='formstyle' required><br><br><br>";
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";
		
		var s8 = "<input type='text' name='cr_phy' id='cr_phy' maxlength='50' placeholder='Enter Physical Health Rating of Criminal' tabindex='5' class='formstyle' required><br><br>";
		var s10 = "<input type='text' name='cr_mnt' id='cr_mnt' placeholder='Enter Mental Health Rating of Criminal' tabindex='7' class='formstyle' required><br><br>";
		var s11 = "<input type='text' name='cr_dis' id='cr_dis' placeholder='Enter any regular Disease of Criminal' tabindex='8' class='formstyle' required><br><br><br>";
		var s12 = "<br><br></div><div style='float:right;width:100%;padding-right:5%' align='center'>";
		var s13 = "<input type='submit' name='submit' id='submitbtn' tabindex='9' value='Update'>";
		var s14 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='10' onClick = 'clearForm()'></div></form>";
		document.getElementById('newRec').innerHTML = s1+s2+s3+s4+s5+s6+s8+s10+s11+s12+s13+s14;
	}
	function clearMod()
	{
		document.getElementById('modRec').innerHTML="";
	}
	function modify(cmi,cmm,cmg,cmd,cmp,cmn,cmdi)
	{
		var s1 = "<form action='mod_cHealth.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' readonly name='Hcrid' id='cr_id' value = " + cmi + " placeholder='Enter Criminal ID' tabindex='1' class='formstyle' maxlength='15' minlength='6' required autofocus='on'><br><br>";
		var s3 = "<input type='text' name='cr_mark' id='cr_mark' value = " + cmm + " maxlength='100' minlength='10' placeholder='Enter Criminals Marks Identification' tabindex='2' class='formstyle' required><br><br>";
		var s4 = "<select id='group' name='group' title='Choose value = " + cmg + " the group' tabindex='3' required><option value='O+'>O+</option><option value='O-'>O-</option><option value='A+'>A+</option><option value='A-'>A-</option><option value='B+'>B+</option><option value='B-'>B-</option><option value='AB+'>AB+</option><option value='AB-'>AB-</option></select><br><br>";
		var s5 = "<input type='text' name='cr_dna' id='c_dna' maxlength='50' value = " + cmd + " placeholder='Enter DNA values of Criminal ( manual )' tabindex='4' class='formstyle' required><br><br><br>";
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";
		
		var s8 = "<input type='text' name='cr_phy' id='cr_phy' maxlength='50' value = " + cmp + " placeholder='Enter Physical Health Rating of Criminal' tabindex='5' class='formstyle' required><br><br>";
		var s10 = "<input type='text' name='cr_mnt' id='cr_mnt' value = " + cmn + " placeholder='Enter Mental Health Rating of Criminal' tabindex='7' class='formstyle' required><br><br>";
		var s11 = "<input type='text' name='cr_dis' id='cr_dis' value = " + cmdi + " placeholder='Enter any regular Disease of Criminal' tabindex='8' class='formstyle' required><br><br><br>";
		var s12 = "<br><br></div><div style='float:right;width:100%;padding-right:5%' align='center'>";
		var s13 = "<input type='submit' name='submit' id='submitbtn' tabindex='9' value='Update'>";
		var s14 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='10' onClick = 'clearForm()'></div></form>";
		document.getElementById('modRec').innerHTML = s1+s2+s3+s4+s5+s6+s8+s10+s11+s12+s13+s14;
	}
</script>
<link rel='shortcut icon' type='image/x-icon' href='images/favicon.ico' />
<link rel="stylesheet" href="jailer.css">
<title>Jailer : Health Information</title>
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
				<input type="button" value="Criminal's Health Info" id="submitbtn" onClick="addCrimeRec()">
				</h2><hr></center>
					<div id="newRec">
	
					</div>
					<div id="modRec">
	
					</div>
			<%@ include file="jailer_criminal_info_pagination.jsp"%>
		</div>
</div>
<!-- Main Body End -->

<!-- Footer Start -->
<%@ include file="footer.jsp" %>
<!-- Footer End -->
</body>
</html>