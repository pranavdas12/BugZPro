<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Reports</title>
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