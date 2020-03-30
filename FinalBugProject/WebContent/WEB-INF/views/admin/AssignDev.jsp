<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Assign Developers</title>
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
	<h2 class="ng_title">Assign Developers</h2>
		<img src="images/svg/developer.svg" style="width: 30%;
    margin: 5px 295px;">
</div>
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">->Please select the report number from the drop down menu.<br>
	->Please select the free developers who are available to fix the bug.<br>
	->Click Assign to assign the developers to the specified bug.</h2>
</div>
      <%
							if (request.getAttribute("assigned") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:15px;">
								The bug has been assigned successfully!
							</h2></td>
						<%
							}
						%>
<div class="ng_mainroot">
<div class="ng_formcontainer">						
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">->Please select the Report Number:</h2></div>
<style type="text/css">
.form-control{color: #ffffff!important;
    background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
 }
.form-control:active,
.form-control:focus{
 	background-color: #1a1a1a!important;
    border: 1px solid #1a1a1a!important;
    box-shadow:none!important;
 }
</style>
						<div class="form-group form-inline">
						<form action="./AssignDevServ" method="post">
    <select class="form-control" id="exampleFormControlSelect1" name="reportno"style="width:80%">
      			<%
         	 	try
         	      	   {
         	      	  List<BugReport> smallList = null;
         	      	  
         	      	 smallList = (List<BugReport>)request.getAttribute("list2");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         		 %>
         		 <option value=<%=smallList.get(i).getId() %>><%=smallList.get(i).getId()%>/<%=smallList.get(i).getStatus() %>/<%=smallList.get(i).getSummary() %></option>
         		 <%} %>
         		  <%}catch(Exception e){ %>
 
 <%} %>
    </select>
    <div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">->Please select the Developer:</h2></div>
    <div class="form-group form-inline">
    <select class="form-control" id="exampleFormControlSelect1" name="dev"style="width:80%">
      			<%
         	 	try
         	      	   {
         	      	  List<Signup> smallList = null;
         	      	  
         	      	 smallList = (List<Signup>)request.getAttribute("list1");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         		 %>
         		 <option value=<%=smallList.get(i).getId() %>><%=smallList.get(i).getId()%>/<%=smallList.get(i).getEmail() %></option>
         		 <%} %>
         		  <%}catch(Exception e){ %>
 
 <%} %>
 </select>
 <br>
 <br>
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Assign</button>
   </form>
  </div>
  </div>
  </div>
  </div>
  </body>
  </html>