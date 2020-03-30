<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/bug.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="resources/CSS/util.css">
<link rel="stylesheet" type="text/css" href="resources/CSS/main.css">
<link rel="stylesheet" media="screen" href="resources/CSS/style.css">
<link rel="stylesheet" type="text/css" href="resources/CSS/z3usv1.min.css">
<!--===============================================================================================-->
<!-- FONT FAMILY ALWAYS BE CONNECTED TO THE INTERNET -->
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap"
	rel="stylesheet">
</head>
<body>
	<style type="text/css">
/*
	OVERRIDE TO USE DEFAULT FONT
*/
*, html {
	font-family: montserrat !important;
}
</style>
	<!-- particles.js container -->
	<div class="container-login100"  style="width: 100%;height: 100vh;">
		<div id="particles-js" >
			<div class="wrap-login100">

				<form class="login100-form validate-form" action="./Signupserv"
					method="Post" >
					<span class="login100-form-logo"> <img src="images/bug.png"
						class="ng_logo" alt="?">
					</span>
					<div class="limiter" style="margin: 0 0 30px 0;">
						<span class="login100-form-title p-b-34 p-t-27" style="margin: 0 0 30px 0;"> BugZPro </span>
						 <span
							class="login100-form-title p-b-34 p-t-27"> Sign Up </span>
							<img src="images/svg/signup.svg" style="width: 50%;
    margin: 5px 104px;">
						&nbsp; &nbsp; <br>
						
						<div class="wrap-input100 validate-input"
							data-validate="Enter email">
							<input class="input100" type="text" name="email"
								placeholder="Email"
								value=<%=request.getAttribute("email1")%>> <span
								class="focus-input100" data-placeholder="&#xf207;"></span>

						</div>
						<%
							if (request.getAttribute("emailexists") != null) {
						%>
						<td><h4 style="color: Tomato; margin: 0 0 30px 0;">
								Email already exists!! Try Something else.
							</h4></td>
						<%
							}
						%>
						<%
							if (request.getAttribute("email_error") != null) {
						%>
						<td><h4 style="color: Tomato; margin: 0 0 30px 0;">
								Invalid Email!!
							</h4></td>
						<%
							}
						%>
						<div class="wrap-input100 validate-input"
							data-validate="Enter UserName">
							<input class="input100" type="text" name="username"
								placeholder="UserName"
								value=<%=request.getAttribute("username1")%>> <span
								class="focus-input100" data-placeholder="&#xf207;"></span>

						</div>
						<%
							if (request.getAttribute("usernameexists") != null) {
						%>
						<td><h4 style="color: Tomato; margin: 0 0 30px 0;">
								Username already exists!! Try Something else.
							</h4></td>
						<%
							}
						%>
						<%
							if (request.getAttribute("username_error") != null) {
						%>
						<td><h4 style="color: Tomato; margin: 0 0 30px 0;">
								Invalid username!!
							</h4></td>
						<%
							}
						%>

						<div class="wrap-input100 validate-input"
							data-validate="Enter password">
							<input class="input100" type="password" name="password"
								placeholder="Password"
								value=<%=request.getAttribute("password1")%>> <span
								class="focus-input100" data-placeholder="&#xf191;"></span>

						</div>
						<%
							if (request.getAttribute("passwordexists") != null) {
						%>
						<td><h4 style="color: Tomato; margin: 0 0 30px 0;">
								Password already exists!! Try Something else.
							</h4></td>
						<%
							}
						%>
						<%
							if (request.getAttribute("password_error") != null) {
						%>
						<td><h4 style="color: Tomato; margin: 0 0 30px 0;">
								Invalid password!!<br> The password should consist of
								atleast 6 digits where a minimum of 1 lower case letter [a-z]
								and 1 upper case letter [A-Z] and 1 numeric character [0-9] and
								1 special character must be included.
							</h4></td>
						<%
							}
						%>
						<input type="radio" id="r1" name="radio" value="Developer" checked>
						<label for="r1" style="color:white;font-size:20px;">Developer</label>
						&nbsp; &nbsp;
						<input type="radio" id="r2" name="radio" value="Tester">
						<label for="r2" style="color:white;font-size:20px;">Tester</label>
						<br>
						<br>
						<div class="container-login100-form-btn">
							<button class="login100-form-btn">Sign Up</button>
						</div>
						<div class="text-center" style="padding-top: 20px !important;">
							<a class="txt1" href="./welcome">Already a member?Click here to
								Login </a>
						</div>

				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>
	<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>
	</div>
	<!-- scripts -->
	<script src="resources/js/particles.js"></script>
	<script src="resources/js/app.js"></script>

	<!-- stats.js -->
	<script src="resources/js/lib/stats.js"></script>

</body>
</html>