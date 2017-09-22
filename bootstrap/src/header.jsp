<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="getbootstrap.jsp" %>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<style>
/* Full-width input fields */
input[type=text],[type=password],[type=email],[type=number] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 40%;
	float:left;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 25%;
    border-radius: 50%;
}

.container {
    padding: 16px;
	width:100%;
}

span.psw {
    float: right;
    padding-right: 10%;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 75%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}



#search {
    width: 130px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

/* When the input field gets focus, change its width to 100% */
#search:focus {
    width: 100%;
}
</style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand active" href="http://localhost:8080/NZS/src">NextZen Solution</a>
    </div>
	
    <ul class="nav navbar-nav navbar-right">
	  <li><a onclick="document.getElementById('id01').style.display='block'" style="width:auto;"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
<!-- Login Modal -->
<div id="id01" class="modal">
  <form class="modal-content animate" action="http://localhost:8080/NZS/src/login.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="img_avatar2.png" alt="Avatar" class="avatar">
    </div>
    <div class="container">
      <label><b></b></label>
      <input type="text" placeholder="Enter Username" name="uname" required><br>
      <label><b></b></label>
      <input type="password" placeholder="Enter Password" name="psw" required><br>
    </div>
	<div class="container" style="background-color:#f1f1f1">
		<button type="submit">Login</button>
		<button type="button" onclick="document.getElementById('id01').style.display='none';document.getElementById('id02').style.display='block'" style="float:right;width:auto;">Register</button><br><br>
	</div><hr>
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <button type="button" style="float:right;width:auto;" onclick="document.getElementById('id01').style.display='none';document.getElementById('id03').style.display='block'">Forget Password ?</button><br><br>
    </div>
  </form>
</div>

<!-- Register Modal -->
<div id="id02" class="modal">
  <form class="modal-content animate" action="http://localhost:8080/NZS/src/register.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="img_avatar2.png" alt="Avatar" class="avatar">
    </div>
    <div class="container">
      <label><b></b></label>
      <input type="email" placeholder="Enter Your Email ID" name="email" required><br>
      <label><b></b></label>
      <input type="text" placeholder="Enter Your Name" name="name" required><br>
	  <label><b></b></label>
      <input type="text" placeholder="Enter Username" name="username" required><br>
	  <label><b></b></label>
      <input type="password" placeholder="Enter New Password" name="pas" required><br>
    </div>
	<div class="container" style="background-color:#f1f1f1">
		<button type="submit">Register</button>
	</div><hr>
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn">Cancel</button>
      <button type="button" style="float:right;width:auto;" onclick="document.getElementById('id02').style.display='none';document.getElementById('id01').style.display='block'">Login</button><br><br>
    </div>
  </form>
</div>

<!-- Forget Password Modal -->
<div id="id03" class="modal">
  <form class="modal-content animate" action="http://localhost:8080/NZS/src/register.jsp">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="img_avatar2.png" alt="Avatar" class="avatar">
    </div>
    <div class="container">
      <label><b></b></label>
      <input type="email" placeholder="Enter Your Email ID" name="email" required><br>
    </div>
	<div class="container" style="background-color:#f1f1f1">
		<button type="submit">Get Password</button>
	</div><hr>
    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn">Cancel</button>
      <button type="button" style="float:right;width:auto;" onclick="document.getElementById('id03').style.display='none';document.getElementById('id01').style.display='block'">Login</button><br><br>
    </div>
  </form>
</div>


</body>
</html>
