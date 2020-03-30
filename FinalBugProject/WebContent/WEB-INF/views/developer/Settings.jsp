<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerDeveloper.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>
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
figure{
   width:300px; /*container-width*/
   overflow:hidden; /*hide bounds of image */
   margin:0;   /*reset margin of figure tag*/
}
figure img{
   display:block; /*remove inline-block spaces*/
   width:100%; /*make image streatch*/
}
figure img{
   /*add to other styles*/   margin:-11.875% 0;
}
</style>
<div class="ng_mainroot"><div class="ng_pagetitles">
	<h2 class="ng_title">Settings</h2>
</div>
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">->Change/Reset your password..<br>
	<h2 class="ng_title1">->After the password is changed.It must be entered in the next time you Login.<br>
	<h2 class="ng_title1">->Whereas after the change the session is gonna be the same.<br>
	<h2 class="ng_title1">->Change the profile picture by selecting the file(.png only) and click update.<br>
	<img src="images/svg/setting.svg" style="    width: 50%;
    height: 10%;
    margin: 26px 335px 5px;">
</div>
<div class="container emp-profile">
            <form method="post" action="./UpdateProfilePic" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                        <%
							if (request.getAttribute("profpic") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:20px;">
								The picture has been uploaded and saved successfully!<br>
								The picture will reflect in your profile the next time you login.
							</h2></td>
						<%
							}
						%>
						<div class="ng_mainroot"><div class="ng_pagetitles">
	<h2 class="ng_title">Change profile photo</h2>
</div>
                        <figure>
                        <%
	List<EditProfile> mylist = null;
	mylist = (List<EditProfile>)request.getAttribute("profiledata");
	 for (int i = 0;i<mylist.size();i++) {
%><%if(mylist.get(i).getImageName()!=null){ %>
                            <img src="images/userProfilePics/<%=mylist.get(i).getImageName() %>" /><%}else{ %>
                            <img src="images/userProfilePics/download.png" /></figure>
                            <%} }%>
                       <div class="file btn-lg btn-primary" style="width:300px">
                                Change Photo
                                <input class="" type="file" name="file"/>
                            </div>
                        </div>
                         <div class="form-group"style="margin-top:1em;">
   <button type="submit" class="btn btn-primary" style="margin: 4px 234px;">Update</button>
  </div>
                    </div>
                    
                    </div>
               
                    </form>
                    </div>
						<%
							if (request.getAttribute("success") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:20px;">
								The password has been changed successfully!
							</h2></td>
						<%
							}
						%>
					
<div class="ng_mainroot">
<img src="https://img.icons8.com/cute-clipart/64/000000/password.png"/ style="margin: 12px 84px -235px;">
<div class="ng_formcontainer">
	<form action="./ResetPasswordServ" method="POST">
  <div class="form-group">
  <br><br><br><br><br><br><br><br>
    <label for="exampleFormControlInput1">Enter your existing Password</label>
    <input type="password" class="form-control" name="existingpass" id="exampleFormControlInput1" placeholder="" required>
  </div>
  <%
							if (request.getAttribute("oldnomatch") != null) {
						%>
						<td><h4 style="color: Tomato; margin: 0 0 30px 0;">
								Your password does not match with your existing password.
							</h4></td>
						<%
							}
						%>
  <div class="form-group">
    <label for="exampleFormControlInput1">Enter your new Password</label>
    <input type="password" class="form-control" name="newpass" id="exampleFormControlInput1" placeholder="" required>
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">Enter your new Password Again!</label>
    <input type="password" class="form-control" name="againnewpass" id="exampleFormControlInput1" placeholder="" required>
  </div>
  <%
							if (request.getAttribute("existing") != null) {
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
						<%
							if (request.getAttribute("nomatch") != null) {
						%>
						<td><h4 style="color: Tomato; margin: 0 0 30px 0;">
								The new password's do not match!
							</h4></td>
						<%
							}
						%>
						
  
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

