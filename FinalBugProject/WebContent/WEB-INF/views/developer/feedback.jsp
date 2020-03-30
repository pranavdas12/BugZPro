<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerDeveloper.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Feedback</title>
</head>
<body>
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
	<h2 class="ng_title">Send Feedback</h2>
	<img src="images/svg/bug.svg" style="width: 40%;
    margin: 20px 307px;">
</div>

						<%
							if (request.getAttribute("feedsubmit") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:20px;">
								The feedback has been sent successfully!
							</h2></td>
						<%
							}
						%>
<div class="ng_mainroot" style="margin: 0;">
<div class="ng_formcontainer">
<form method="post" action="./SendFeedback">
 <div class="form-group">
    <label for="exampleFormControlTextarea1">Write to us here:</label></div>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="subject" rows="3" required></textarea>
    <div class="form-group"style="margin-top:1em;">
   <button type="submit" class="btn btn-primary">Submit</button>
  </div>
 </form>
  </div>
  </div>
  </div>
</body>
</html>