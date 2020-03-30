<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerDeveloper.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Search Reports</title>
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
	<h2 class="ng_title">Search Reports</h2>
	<img src="images/svg/bug.svg" style="width: 40%;
    margin: 20px 307px;">
</div>
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">->Perform search by inputting your Summary into the search box.<br></h2></div>
<style type="text/css">
.form-inline > .form-control{color: #ffffff!important;
    background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
 }
.form-inline > .form-control:active,
.form-inline > .form-control:focus{
 	background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
    box-shadow:none!important;
 }
 .form-inline label{
 	margin: 0 20px;    color: #fff!important;
 }
 select.form-control{
    color: #ffffff!important;
    background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
 } select.form-control:active,
  select.form-control:focus{
    border: 1px solid #1a1a1a!important;
 }
</style>
<form class="form-inline" action="./SearchReportServ" method="post">
			<input class="form-control" type="search" placeholder="Search"
				aria-label="Search" name="search" style="width: 80%;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			 <div class="form-group">
    <label for="exampleFormControlSelect1">Search By Priority</label>
    <select class="form-control" id="exampleFormControlSelect1" name="priority">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">Search By Severity</label>
    <select class="form-control" id="exampleFormControlSelect1" name="severity">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select>
		</div>	
		<div class="form-group">
    <label for="exampleFormControlSelect1">Search By Defect Status</label>
    <select class="form-control" id="exampleFormControlSelect1" name="status">
      <option value="Fixed">Fixed</option>
      <option value="Not_Fixed">Not Fixed</option>
      <option value="Re_Open">Re-Open</option>
      <option value="Postpone">Postpone</option>
    </select>
  </div>	
		</form>	<br><br>
		<% if(request.getAttribute("foundrecord")!=null){%>
		<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">User Id</th>
      <th scope="col">Report No</th>
      <th scope="col">Status of Bug</th>
      <th scope="col">Developer ID</th>
      <th scope="col">Developer Assigned</th>
      <th scope="col">Bug Type</th>
      <th scope="col">Summary</th>
      <th scope="col">URL</th>
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
         	      	  
         	      	 smallList = (List<BugReport>)request.getAttribute("searchresult");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         	 %>
     	
     	<tr>
     		<th scope="row"><%=smallList.get(i).getUserId() %></th>
     	    <td><%=smallList.get(i).getId() %></td>
     	    <td><%=smallList.get(i).getStatus() %></td>
     	    <td><%=smallList.get(i).getDeveloper_ID() %></td>
     	    <td><%=smallList.get(i).getDeveloper_Asgn() %></td>
     	    <td><%=smallList.get(i).getBugtype() %></td>
     	    <td><%=smallList.get(i).getSummary() %></td>
     	    <td><%=smallList.get(i).getUrl() %></td>
     	    <td><%=smallList.get(i).getReproduce() %></td>
     	   <td><%=smallList.get(i).getExpected() %></td>
     	    <td><%=smallList.get(i).getActual() %></td>
     	</tr>
	
	
	<%}%>
     	
 <%}catch(Exception e){ %>
 
 <%}}else{%>
 <%if(request.getAttribute("foundrecord")==null){%>
 <td><h4 style="color: Tomato; margin: 0 0 30px 0;font-size:15px;">
								No Record Found!
							</h4></td><%}}%>
  </tbody>
</table>
</div>