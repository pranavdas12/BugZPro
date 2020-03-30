<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Delete User</title>
	<style type="text/css">
.ng_mainroot {
	margin-left: 220px;
	padding-left: 15px;
	padding-right: 15px;
}

.ng_pagetitles {
	padding: 30px 0;
}

.ng_title {
	font-family: montserrat;
	font-size: 22px;
	color: #fff;
	font-weight: 500;
}

.ng_title1 {
	font-family: montserrat;
	font-size: 18px;
	color: #fff;
	font-weight: 500;
}

.ng_formcontainer {
	width: 80%;
	margin: 0 auto;
}

.ng_formcontainer>form>.form-group>label, .ng_formcontainer>form>.form-check>label
	{
	color: #696969 !important;
}

.ng_formcontainer>form>.form-group>.form-control {
	color: #696969 !important;
	background-color: #1a1a1a !important;
	border: 1px solid #1a1a1a !important;
}

.ng_formcontainer>form>.form-group>input:active, .ng_formcontainer>form>.form-group>input:focus,
	.ng_formcontainer>form>.form-group>select:active, .ng_formcontainer>form>.form-group>select:focus,
	.ng_formcontainer>form>.form-group>textarea:active, .ng_formcontainer>form>.form-group>textarea:focus
	{
	background-color: #1a1a1a !important;
	border: 1px solid #1a1a1a !important;
	box-shadow: none !important;
}

.form-check-inline {
	width: 360px !important;
}
</style>
	<div class="ng_mainroot">
		<div class="ng_pagetitles">
			<h2 class="ng_title">Search the Bug</h2>
			<img src="images/svg/search.svg" style="width: 40%;
    margin: 5px 295px;">
		</div>
		<div class="ng_pagetitles" style="text-align: left;">
			<h2 class="ng_title1">
				->Please search for the UserID by entering the mail id.
				<br> ->If User ID is already known select from the drop down menu below.
			</h2>
		</div>
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
</style>
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">Please enter Email ID(If not sure just enter letter by letter):</h2></div>
		<form class="form-inline" action="./SearchUserRecord" method="post">
			<input class="form-control" type="search" placeholder="Search"
				aria-label="Search" name="search" style="width: 80%;">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
		<br>
		<br>
		<% if(request.getAttribute("foundrecord")!=null){%>
		<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">User Id</th>
      <th scope="col">Username</th>
      <th scope="col">Designation</th>
      <th scope="col">Email ID</th>
    </tr>
  </thead>
  <tbody>
    
     	 <%
         	 	try
         	      	   {
         	      	  List<Signup> smallList = null;
         	      	  
         	      	 smallList = (List<Signup>)request.getAttribute("searchresult");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         	 %>
     	
     	<tr>
     		<th scope="row"><%=smallList.get(i).getId() %></th>
     	    <td><%=smallList.get(i).getUname() %></td>
     	    <td><%=smallList.get(i).getDesig() %></td>
     	    <td><%=smallList.get(i).getEmail() %></td>
     	</tr>
	<%}%>
     	
 <%}catch(Exception e){ %>
 
 <%}}else{%>
 <td><h4 style="color: Tomato; margin: 0 0 30px 0;font-size:15px;">
								No Record Found!
							</h4></td><%}%>
  </tbody>
</table>
</div><br><br><br>

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
<div class="ng_mainroot">
<%
							if (request.getAttribute("deleted") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:20px;">
								The user's records have been erased successfully!
							</h2></td>
						<%
							}
						%>
						<h2 class="ng_title1">Please select the User ID:</h2></div><br>
						<form action="./DeleteUser" method="post">
    <select class="form-control" id="exampleFormControlSelect1" name="userid"style="width: 40%;
    margin: 0 235px;">
      			<%
         	 	try
         	      	   {
         	      	  List<Login> smallList = null;
         	      	  
         	      	 smallList = (List<Login>)request.getAttribute("reportlist");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         		 %>
         		 <option value=<%=smallList.get(i).getId() %>><%=smallList.get(i).getId()%></option>
         		 <%} %>
         		  <%}catch(Exception e){ %>
 
 <%} %>
    </select>
   <div class="form-group"style="margin-top:1em;">
   <button type="submit" class="btn btn-primary" style="margin: 4px 240px;">Delete</button>
   </div>
   </form>
   </div>
</head>

</html>