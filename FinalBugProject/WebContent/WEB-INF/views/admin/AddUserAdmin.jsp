<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Add User</title>
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
	<h2 class="ng_title">Add User</h2>
	<img src="images/svg/editprofile.svg" style="width: 40%;
    margin: 5px 295px;">
</div>
<form method="post" action="./AddUserAdmin">
<%
							if (request.getAttribute("success") != null) {
						%>
						<td><h3 style="color: green">User has been added successfully!
								</h3></td>
						<%
							}
						%>
	 <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
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
    <label for="exampleFormControlInput1" style="color:#fff;text-align:centre">Email</label>
    <input type="email" class="form-control" name="email" id="exampleFormControlInput1" placeholder="" required value=<%=request.getAttribute("email1")%>>
  </div><%
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
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1" style="color:#fff">Username</label>
    <input type="text" class="form-control" name="username" id="exampleFormControlInput1" placeholder="" required value=<%=request.getAttribute("username1")%> >
  </div><%
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
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1" style="color:#fff">Password</label>
    <input type="password" class="form-control" name="password" id="exampleFormControlInput1" placeholder="" required value=<%=request.getAttribute("password1")%> >
  </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1" style="color:#fff">Designation</label></div></div></div>
                                        <input type="radio" id="r1" name="radio" value="Developer" checked>
						<label for="r1" style="color:white;font-size:20px;">Developer</label>
						&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
						<input type="radio" id="r2" name="radio" value="Tester">
						<label for="r2" style="color:white;font-size:20px;">Tester</label>
						&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
						<input type="radio" id="r3" name="radio" value="Admin">
						<label for="r3" style="color:white;font-size:20px;">Admin</label><br>
<div class="form-group"style="margin-top:1em;">
   <button type="submit" class="btn btn-primary" style="margin: 4px 500px;">Add</button>
   </div>
   
</form>
  </div>
  
  </head>
  </html>
 