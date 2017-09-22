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
		var s1 = "<form action='reg_crime_info.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' name='CcrID' id='CcrID' placeholder='Criminal ID' tabindex='1' class='formstyle' maxlength='15' minlength='6' required autofocus='on'><br><br>";
		var s3 = "<input type='number' name='crime_number' id='crime_number' min='1' max='999999999' placeholder='Crime Number' tabindex='2' class='formstyle' required><br><br>";
		var s4 = "<input type='number' min='01011900' max='31122015' name='crime_date' maxlength='10' id='crime_date' placeholder='Crime Date(DDMMYYYY)' tabindex='3' class='formstyle' required><br><br>";
		var s5 = "<input type='number' min='01011900' max='31122015' name='arrest_date' maxlength='10' id='arrest_date' placeholder='Arrest Date(DDMMYYYY)' tabindex='4' class='formstyle' required><br><br>";
	
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";

		var s8 = "<input type='text' name='case_number' maxlength='10' id='case_number' min='1' max='999999999' placeholder='Case Number' tabindex='5' class='formstyle' required><br><br>";
		var s9 = "<input type='text' name='crime_type' id='crime_type' placeholder='Crime Type ( ID of Crime )' tabindex='7' class='formstyle' maxlength='15' minlength='6' required><br><br>";
		var s10 = "<input type='text' name='crime_dis' id='crime_dis' maxlength='200' placeholder='Short Discription of Crime' tabindex='7' class='formstyle' required><br><br>";
		var s11 = "<input type='text' name='crime_weapon' id='crime_weapon' maxlength='200' placeholder='Weapon Used in Crime' tabindex='8' class='formstyle' required><br><br>";
		var s12 = "<br><br></div><div style='float:right;width:100%;padding-right:5%' align='center'>";
		var s13 = "<input type='submit' name='submit' id='submitbtn' tabindex='9' value='Register'>";
		var s14 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='10' onClick = 'clearForm()'></div></form>";
		document.getElementById('newRec').innerHTML = s1+s2+s3+s4+s5+s6+s8+s9+s10+s11+s12+s13+s14;
	}
	function clearMod()
	{
		document.getElementById('modRec').innerHTML="";
	}
	function modify(crid,crno,crdt,ardt,csno,crtp,crds,crwp)
	{
		var s1 = "<form action='mod_crime_info.jsp' method='post' id='loginform'><div style='float:left;width:40%;padding-left:10%' align='right'>";
		var s2 = "<input type='text' readonly name='CcrID' id='CcrID' value = " + crid + " placeholder='Criminal ID' tabindex='1' class='formstyle' maxlength='15' minlength='6' required autofocus='on'><br><br>";
		var s3 = "<input type='number' name='crime_number' id='crime_number' value = " + crno + " min='1' max='999999999' placeholder='Crime Number' tabindex='2' class='formstyle' required><br><br>";
		var s4 = "<input type='number' min='01011900' name='crime_date' id='crime_date' value = " + crdt + " maxlength='10' placeholder='Crime Date(DDMMYYYY)' tabindex='3' class='formstyle' required><br><br>";
		var s5 = "<input type='number' min='01011900' name='arrest_date' id='arrest_date' value = " + ardt + " maxlength='10' placeholder='Arrest Date(DDMMYYYY)' tabindex='4' class='formstyle' required><br><br>";
	
		var s6 = "</div><div style='float:right;width:40%;padding-right:5%' align='left'>";

		var s8 = "<input type='text' readonly name='case_number' id='case_number' value = " + csno + " maxlength='10' placeholder='Case Number' tabindex='5' class='formstyle' required><br><br>";
		var s9 = "<input type='text' name='crime_type' id='crime_type' value = " + crtp + " placeholder='Crime Type(ID of Crime)' tabindex='7' class='formstyle' maxlength='15' minlength='6' required><br><br>";
		var s10 = "<input type='text' name='crime_dis' id='crime_dis' value = " + crds + " maxlength='200' placeholder='Short Discription of Crime' tabindex='7' class='formstyle' required><br><br>";
		var s11 = "<input type='text' name='crime_weapon' id='crime_weapon' value = " + crwp + " maxlength='200' placeholder='Weapon Used in Crime' tabindex='8' class='formstyle' required><br><br>";
		var s12 = "<br><br></div><div style='float:right;width:100%;padding-right:5%' align='center'>";
		var s13 = "<input type='submit' name='submit' id='submitbtn' tabindex='9' value='Update'>";
		var s14 = "<input type='submit' value='Cancel'  id='submitbtn' tabindex='10' onClick = 'clearForm()'></div></form>";
		document.getElementById('modRec').innerHTML = s1+s2+s3+s4+s5+s6+s8+s9+s10+s11+s12+s13+s14;
	}
</script>
<link rel='shortcut icon' type='image/x-icon' href='images/favicon.ico' />
<link rel="stylesheet" href="jailer.css">
<title>Jailer : Register New Crime</title>
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
				<input type="button" value="Add New Crime" id="submitbtn" onClick="addCrimeRec()">
				</h2><hr></center>
					<div id="newRec">
	
					</div>
					<div id="modRec">
	
					</div>
		<%@ include file="jailer_crime_info_pagination.jsp"%>
		</div>
</div>
<!-- Main Body End -->

<!-- Footer Start -->
<%@ include file="footer.jsp" %>
<!-- Footer End -->
</body>
</html>