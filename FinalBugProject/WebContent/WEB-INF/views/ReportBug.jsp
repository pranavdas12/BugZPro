<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report Bug</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="images/bug.png" />
<link rel="stylesheet" type="text/css" href="resources/CSS/side.css">
<link rel="stylesheet" type="text/css" href="resources/CSS/boot.css">
<link rel="stylesheet" type="text/css" href="resources/CSS/util.css">
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="resources/menu/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="resources/menu/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="resources/CSS/menu.css" rel="stylesheet" media="all">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap"
	rel="stylesheet">

<style type="text/css">
, html {
	font-family: montserrat !important;
}
</style>
</head>
<body style="background-color:black;">
<% response.setHeader("Cache-Control","no-cache, no-store , must-revalidate"); %>
<%if(session.getAttribute("email")==null){%>
<% response.sendRedirect("./welcome"); %>
<% }%>
<div class="sidebar-container">
  <div class="sidebar-logo" align="middle">
  <img src="images/bug.png" align="middle" size="10px 20px">
    BugZPro
  </div>
  <ul class="sidebar-navigation">
     <li class="header">Functions</li>
    <li>
      <a href="./SearchRecord">
        <i class="fa fa-home" aria-hidden="true"></i> Report Bug
      </a>
    </li>
    <li>
      <a href="./EditReportServ">
        <i class="fa fa-info-circle" aria-hidden="true"></i> Edit Reports
      </a>
    </li>
    <li>
      <a href="./SearchReportServ">
        <i class="fa fa-info-circle" aria-hidden="true"></i> Search Reports
      </a>
    </li>
    <li>
      <a href="./DashboardTester">
        <i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard
      </a>
    </li>
    <li>
      <a href="./AllReports">
        <i class="fa fa-info-circle" aria-hidden="true"></i> All Reports
      </a>
    </li>
    <li class="header">Profile</li>
    <li>
      <a href="./UserProfile">
        <i class="fa fa-users" aria-hidden="true"></i> My Profile
      </a>
    </li>
    <li>
      <a href="./ResetPasswordServ">
        <i class="fa fa-cog" aria-hidden="true"></i> Settings
      </a>
    </li>
    <li>
      <a href="./LogoutServ">
        <i class="fa fa-info-circle" aria-hidden="true"></i> Logout
      </a>
    </li>
    <li class="header">About Product</li>
    <li>
      <a href="./SendFeedback">
        <i class="fa fa-info-circle" aria-hidden="true"></i> Send Feedback
      </a>
    </li>
    <li>
      <a href="./AboutDev">
        <i class="fa fa-info-circle" aria-hidden="true"></i> About Developer
      </a>
    </li>
    <li>
      <a href="./ContactDev">
        <i class="fa fa-info-circle" aria-hidden="true"></i> Contact Developer
      </a>
    </li>
  </ul>
</div>
<style type="text/css">
.ng_mainroot{
	margin-left:220px;
	padding-left:15px;
	padding-right:15px;
}.ng_pagetitles{
padding:30px 0;
}
.ng_title{
	font-family:montserrat;
	font-size:22px;
	color:#fff;
	font-weight:500;
}
.ng_title1{
	font-family:montserrat;
	font-size:18px;
	color:#fff;
	font-weight:500;
}
.ng_formcontainer {
	width:80%;
	margin: 0 auto;
}
.ng_formcontainer > form > .form-group > label,
.ng_formcontainer > form > .form-check > label{
color: #696969!important;
}
.ng_formcontainer > form > .form-group > .form-control{color: #696969!important;
    background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
 }
 .ng_formcontainer > form > .form-group > input:active,
 .ng_formcontainer > form > .form-group > input:focus,
 .ng_formcontainer > form > .form-group > select:active,
 .ng_formcontainer > form > .form-group > select:focus,
 .ng_formcontainer > form > .form-group > textarea:active,
 .ng_formcontainer > form > .form-group > textarea:focus{
 	background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
    box-shadow:none!important;
 }
 .form-check-inline{
     width: 360px!important;}
</style>
<div class="ng_mainroot"><div class="ng_pagetitles">
	<h2 class="ng_title">Report a Bug</h2>
	<img src="images/svg/bug.svg" style="width: 40%;
    margin: 20px 307px;">
</div>
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">->Please fill out this form clearly, precisely and in as much detail as you can manage.<br>
->Please report only a single problem  a time.<br>
-><a href="https://developer.mozilla.org/en-US/docs/Mozilla/QA/Bug_writing_guidelines">These guidelines</a> explain how to write effective bug reports.</h2>
</div>
<div class="hub">

</div>
						<%
							if (request.getAttribute("bugsubmit") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:20px;">
								The bug has been submitted successfully!
							</h2></td>
						<%
							}
						%>
<div class="ng_mainroot" style="margin: 0;">
<div class="ng_formcontainer">
	<form action="./ReportBugServ" method="POST">
  <div class="form-group">
    <label for="exampleFormControlInput1">Summary</label>
    <input type="text" class="form-control" name="summary" id="exampleFormControlInput1" placeholder="" required>
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">URL</label>
    <input type="text" class="form-control" name="url" id="exampleFormControlInput1" placeholder="" required>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">Priority</label>
    <select class="form-control" id="exampleFormControlSelect1" name="priority">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">Severity</label>
    <select class="form-control" id="exampleFormControlSelect1" name="severity">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">What did you do? (steps to reproduce)</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="stepstoreproduce" rows="3" required></textarea>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">What happened? (actual results)</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="actualresults" rows="3" required></textarea>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">What should have happened? (expected results)</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="expectedresults" rows="3" required></textarea>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Bug Type</label><br>
    </div>
	<div class="form-check form-check-inline">
  <label class="form-check-label" for="inlineRadio1">This is a defect report.</label>
  <input class="form-check-input" type="radio" name="radio" id="inlineRadio1" value="Defect_Report">
</div>
<div class="form-check form-check-inline">  
<label class="form-check-label" for="inlineRadio2">This is a request for enhancements.</label>
  <input class="form-check-input" type="radio" name="radio" id="inlineRadio2" value="Enhancements">
</div><br><br>
<div class="form-group">
    <label for="exampleFormControlSelect1">Defect Status</label>
    <select class="form-control" id="exampleFormControlSelect1" name="status">
      <option value="Fixed">Fixed</option>
      <option value="Not_Fixed">Not Fixed</option>
      <option value="Re_Open">Re-Open</option>
      <option value="Postpone">Postpone</option>
    </select>
  </div>
  <!-- ADD FILE ATTACH AND RADIO LATER ILL JUST STYLE THE FORM EVERYTHING IS THERE ONLY -->
    <div class="form-group"style="margin-top:1em;">
   <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form>
</div>
</div>

    <!-- Jquery JS-->
    <script src="resources/menu/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="resources/menu/select2.min.js"></script>
    <script src="resources/menu/moment.min.js"></script>
    <script src="resources/menu/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="resources/js/global.js"></script>
    <script src="resources/js/main.js"></script>
	</div>
	<!-- scripts -->
	<script src="resources/js/particles.js"></script>
	<script src="resources/js/app.js"></script>

	<!-- stats.js -->
	<script src="resources/js/lib/stats.js"></script>
</body>
</html>

