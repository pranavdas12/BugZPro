<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Reports</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="images/bug.png" />
<link rel="stylesheet" type="text/css" href="resources/CSS/z3usv1.min.css">
<link rel="stylesheet" type="text/css" href="resources/CSS/side.css">
<link rel="stylesheet" type="text/css" href="resources/CSS/boot.css">
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
position: relative;
    margin-left: 220px;
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
.ng_title1{
	font-family:montserrat;
	font-size:18px;
	color:#fff;
	font-weight:500;
}
</style>
<div class="ng_mainroot">
<div class="ng_pagetitles">
	<h2 class="ng_title">All Reports</h2>
	<img src="images/svg/document.svg" style="width: 30%;
    margin: 5px 295px;">
</div>
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">->Summary Table(Submitted by <%=session.getAttribute("email") %>)</h2>
	</div>
<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">User Id</th>
      <th scope="col">Report No</th>
      <th scope="col">Status of Bug</th>
      <th scope="col">Bug Type</th>
      <th scope="col">Summary</th>
      <th scope="col">Developer Assigned</th>
    </tr>
  </thead>
  <tbody>
    
     	 <%
         	 	try
         	      	   {
         	      	  List<BugReport> smallList = null;
         	      	  
         	      	 smallList = (List<BugReport>)request.getAttribute("list1");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         	      	
         	 %>
     	
     	<tr>
     		<th scope="row"><%=smallList.get(i).getUserId() %></th>
     	    <td><%=smallList.get(i).getId()%></td>
     	    <td><%=smallList.get(i).getStatus() %></td>
     	    <td><%=smallList.get(i).getBugtype() %></td>
     	    <td><%=smallList.get(i).getSummary() %></td>
     	    <td><%=smallList.get(i).getDeveloper_Asgn() %></td>
     	</tr>
	
	
	<%}%>
     	
 <%}catch(Exception e){ %>
 
 <%} %>
  </tbody>
</table>
<br>
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">All Detailed Report</h2></div>
	<table class="table table-dark">
  <thead>
    <tr>
          <th scope="col">User Id</th>
      <th scope="col">Report No</th>
      <th scope="col">Status of Bug</th>
      <th scope="col">Bug Type</th>
      <th scope="col">Summary</th>
      <th scope="col">URL</th>
       <th scope="col">Developer_ID</th>
      <th scope="col">Developer_Asgn</th>
      <th scope="col">Steps to reproduce</th>
      <th scope="col">Expected Results</th>
      <th scope="col">Actual Results</th>
     
    </tr>
  </thead>
  <tbody>
    
     	 <%
         	 	try
         	      	   {
         	      	  List<BugReport> smallList = null;
         	      	  
         	      	 smallList = (List<BugReport>)request.getAttribute("list1");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         	 %>
     	
     	<tr>
     		<th scope="row"><%=smallList.get(i).getUserId() %></th>
     	    <td><%=smallList.get(i).getId() %></td>
     	    <td><%=smallList.get(i).getStatus() %></td>
     	    <td><%=smallList.get(i).getBugtype() %></td>
     	    <td><%=smallList.get(i).getSummary() %></td>
     	     <td><%=smallList.get(i).getUrl() %></td>
     	       <td><%=smallList.get(i).getDeveloper_ID() %></td>
     	    <td><%=smallList.get(i).getDeveloper_Asgn() %></td>
     	    <td><%=smallList.get(i).getReproduce() %></td>
     	   <td><%=smallList.get(i).getExpected() %></td>
     	    <td><%=smallList.get(i).getActual() %></td>
     	</tr>
	
	
	<%}%>
     	
 <%}catch(Exception e){ %>
 
 <%} %>
  </tbody>
</table>
</div>

</div>
</body>
</html>