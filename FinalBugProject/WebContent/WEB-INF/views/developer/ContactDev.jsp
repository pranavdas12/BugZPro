<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerDeveloper.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Contact Developer</title>
<style type="text/css">
.ng_mainroot{
	margin-left:220px;
	padding-left:15px;
	padding-right:15px;
}
.ng_pagetitles{
padding:30px 0;
}
.ng_title{
	font-family:montserrat;
	font-size:22px;
	color:#fff;
	font-weight:500;
}



.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
}
.profile-img img{
    width: 70%;
    height: 100%;
}
.profile-img .file {
    position: relative;
    overflow: hidden;
    margin-top: -20%;
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #000;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
 .form-group > .form-control {
    color: white!important;
    background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
    width: 160%;
}

.profile-tab p{
    font-weight: 600;
    color: #0062cc;
} .form-group > input:active,
 .form-group > input:focus,
 .form-group > select:active,
.form-group > select:focus,
 .form-group > textarea:active,
 .ng_formcontainer > form > .form-group > textarea:focus{
 	background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
    box-shadow:none!important;

 }
</style>
<div class="ng_mainroot">
<div class="ng_pagetitles">
	<h2 class="ng_title">Send Email</h2>
	<img src="images/svg/email.svg" style="width: 40%;
    margin: 5px 295px;">
</div>
<%if (request.getAttribute("emailsuccess") != null) {
						%>
						<td><h3 style="color: green">Email is sent successfully!
								</h3></td>
						<%
							}
						%>
<form method="post" action="./ContactDev">
 <label for="exampleFormControlInput1" style="color:#fff;text-align:centre">Sender's Email ID:</label>
    <input type="email" class="form-control" name="email" id="exampleFormControlInput1" placeholder="" required value=<%=request.getAttribute("email")%>>
     <label for="exampleFormControlInput1" style="color:#fff;text-align:centre">Enter the Subject:</label>
    <input type="text" class="form-control" name="subject" id="exampleFormControlInput1" placeholder="" required value=<%=request.getAttribute("subject")%>>
     <label for="exampleFormControlInput1" style="color:#fff;text-align:centre">Enter the body of the Email:</label>
    <textarea class="form-control" name="body" id="exampleFormControlTextarea1" rows="5" placeholder="" required value=<%=request.getAttribute("body")%>></textarea>
    <div class="form-group"style="margin-top:1em;">
   <button type="submit" class="btn btn-primary" style="margin: 4px 500px;">Send Email</button>
   </div>
</form>
</div>
</html>
