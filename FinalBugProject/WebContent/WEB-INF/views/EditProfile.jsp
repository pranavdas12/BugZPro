<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="images/bug.png" />
<link rel="stylesheet" type="text/css" href="resources/CSS/z3usv1.min.css">
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
	<h2 class="ng_title">Edit Profile</h2>
	<img src="images/svg/editprofile.svg" style="width: 40%;
    margin: 5px 295px;">
</div>
<%
	List<EditProfile> mylist = null;
Object userid = request.getAttribute("userid");
	mylist = (List<EditProfile>)request.getAttribute("profiledata");
	 for (int i = 0;i<mylist.size();i++) {
%>

<div class="container emp-profile">
            <form method="post" action="./EditProfile" >
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                        
                            <figure>
                       
                            <%if(mylist.get(i).getImageName()!=null){ %>
                            <img src="images/userProfilePics/<%=mylist.get(i).getImageName() %>" /><%}else{ %>
                            <img src="images/userProfilePics/download.png" />
                            <%} %>
                           </figure>
                      <div class="file ">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        <%=mylist.get(i).getFullName() %>
                                    </h5>
                                    <h6>
                                        <%=mylist.get(i).getPrimaryProf() %>
                                    </h6>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                   
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                 <div class="form-group">
                                                 <%
							if (request.getAttribute("editSuccess") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:15px;">
								The profile data has been saved successfully!
							</h2></td>
						<%
							}
						%>
                                              
    <label for="exampleFormControlInput1">Full Name</label>
    <input type="text" class="form-control" name="fullname" id="exampleFormControlInput1" placeholder="" required  value=<%=mylist.get(i).getFullName()%>>
  </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1">DOB</label>
    <input type="date" class="form-control" name="dob" id="exampleFormControlInput1" placeholder="" required  value=<%=mylist.get(i).getDOB() %>>
  </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1">Phone Number</label>
    <input type="text" class="form-control" name="number" id="exampleFormControlInput1" placeholder="" required  value=<%=mylist.get(i).getPhno() %>>
  </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1">Website URL</label>
    <input type="text" class="form-control" name="website" id="exampleFormControlInput1" placeholder="" required  value=<%=mylist.get(i).getWebsiteURL() %>>
  </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1">LinkedIn URL</label>
    <input type="text" class="form-control" name="linkedin" id="exampleFormControlInput1" placeholder="" required  value=<%=mylist.get(i).getLinkedInURL() %>>
  </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1">Facebook URL</label>
    <input type="text" class="form-control" name="facebook" id="exampleFormControlInput1" placeholder="" required  value=<%=mylist.get(i).getFacebookURL() %>>
  </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1">Primary Proficiency As</label>
      <select class="form-control" id="exampleFormControlSelect1" name="primary" >
     <option value="Automation-Tester">Automation Tester</option>
      <option value="Manual-Tester">Manual Tester</option>
      <option value="Java-Developer">Java Developer</option>
      <option value="Full-Stack-Developer">Full Stack Developer</option>
      <option value="Front-End-Developer">Front End Developer/Web Designer</option>
      <option value="Back-End-Developer">Back End Developer</option>
      <option value="Others">Others</option>
    </select>
  </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1">Secondary Proficiency As</label>
      <select class="form-control" id="exampleFormControlSelect1" name="secondary" >
      <option value="Automation-Tester">Automation Tester</option>
      <option value="Manual-Tester">Manual Tester</option>
      <option value="Java-Developer">Java Developer</option>
      <option value="Full-Stack-Developer">Full Stack Developer</option>
      <option value="Front-End-Developer">Front End Developer/Web Designer</option>
      <option value="Back-End-Developer">Back End Developer</option>
      <option value="Others">Others</option>
    </select>
  </div>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">    <div class="form-group">
    <label for="exampleFormControlInput1">Tertiary Proficiency As(If Any)</label>
      <select class="form-control" id="exampleFormControlSelect1" name="tertiary">
      <option value="Automation-Tester">Automation Tester</option>
      <option value="Manual-Tester">Manual Tester</option>
      <option value="Java-Developer">Java Developer</option>
      <option value="Full-Stack-Developer">Full Stack Developer</option>
      <option value="Front-End-Developer">Front End Developer/Web Designer</option>
      <option value="Back-End-Developer">Back End Developer</option>
      <option value="Others">Others</option>
    </select>
  </div>
                                            </div>
                                        </div>
                                        <div class="form-group"style="margin-top:1em;">
   <button type="submit" class="btn btn-primary">Submit</button>
  </div>
                                        
                            </div>
                        </div>
                    </div>
                </div>
            </form>           
        </div>
<%} %>
</div>
</body>
</html>