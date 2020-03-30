<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>View Feedbacks</title>
</head>
<body>
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

<table class="table table-dark">
  <thead>
    <tr>
      <th scope="col">User Email</th>
      <th scope="col">Feedback Content</th>
    </tr>
  </thead>
  <tbody>
    
     	 <%
         	 	try
         	      	   {
         	      	  List<Feedback> smallList = null;
         	      	  
         	      	 smallList = (List<Feedback>)request.getAttribute("list1");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         	      	
         	 %>
     	
     	<tr>
     		<th scope="row"><%=smallList.get(i).getSenderEmail() %></th>
     	    <td><%=smallList.get(i).getSubject() %></td>
     	</tr>
	
	
	<%}%>
     	
 <%}catch(Exception e){ %>
 
 <%} %>
  </tbody>
</table>
</body>
</html>