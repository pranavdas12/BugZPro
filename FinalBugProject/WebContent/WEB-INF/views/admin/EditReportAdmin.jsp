<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Edit Report</title>
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
	<h2 class="ng_title">Edit Report</h2>
		<img src="images/svg/edit.svg" style="width: 40%;
    margin: 5px 295px;">
</div>
<div class="ng_pagetitles"style="text-align:left;">
	<h2 class="ng_title1">->Please select the report number from the drop down menu and click edit.<br>
	->Please fill out this form clearly, precisely and in as much detail as you can manage.</h2><br>
</div>
						<%
							if (request.getAttribute("bugsubmit") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:20px;">
								The bug has been updated successfully!
							</h2></td>
						<%
							}%>
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
						<form action="./EditReportServ" method="post">
    <select class="form-control" id="exampleFormControlSelect1" name="reportno"style="width:80%">
      			<%
         	 	try
         	      	   {
         	      	  List<BugReport> smallList = null;
         	      	  
         	      	 smallList = (List<BugReport>)request.getAttribute("reportlist");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         		 %>
         		 <option value=<%=smallList.get(i).getId() %>><%=smallList.get(i).getId()%></option>
         		 <%} %>
         		  <%}catch(Exception e){ %>
 
 <%} %>
    </select>
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
   </form>
  </div>
 <%if(request.getAttribute("reportfound")!=null) {%>
		<%
         	 	try
         	      	   {
         	      	  List<BugReport> smallList = null;
         	      	  
         	      	 smallList = (List<BugReport>)request.getAttribute("reportfound");
         	      	  
         	      	  for (int i = 0;i<smallList.size();i++) {
         	 %> 
<div class="ng_mainroot">
<div class="ng_formcontainer" style="margin: 0px -236px;">
	<form action="./UpdateReportServ" method="POST">
  <div class="form-group">
    <label for="exampleFormControlInput1">Summary</label>
    <input type="text" class="form-control" name="summary" id="exampleFormControlInput1" placeholder="" required value=<%=smallList.get(i).getSummary() %>>
  </div>
  <div class="form-group">
    <label for="exampleFormControlInput1">URL</label>
    <input type="text" class="form-control" name="url" id="exampleFormControlInput1" placeholder="" required value=<%=smallList.get(i).getUrl() %>>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">Priority</label>
    <select class="form-control" id="exampleFormControlSelect1" name="priority" value=<%=smallList.get(i).getPriority() %>>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleFormControlSelect1">Severity</label>
    <select class="form-control" id="exampleFormControlSelect1" name="severity" value=<%=smallList.get(i).getSeverity() %>>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">What did you do? (steps to reproduce)</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="stepstoreproduce" rows="3" required ><%=smallList.get(i).getReproduce() %></textarea>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">What happened? (actual results)</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="actualresults" rows="3" required ><%=smallList.get(i).getActual() %></textarea>
  </div>
  
  <div class="form-group">
    <label for="exampleFormControlTextarea1">What should have happened? (expected results)</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="expectedresults" rows="3" required><%=smallList.get(i).getExpected() %></textarea>
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea1">Bug Type</label><br>
    </div>
	<div class="form-check form-check-inline">
  <label class="form-check-label" for="inlineRadio1">This is a defect report.</label>
  <input class="form-check-input" type="radio" name="radio" id="inlineRadio1" value="Defect_Report" selected>
</div>
<div class="form-check form-check-inline">  
<label class="form-check-label" for="inlineRadio2">This is a request for enhancements.</label>
  <input class="form-check-input" type="radio" name="radio" id="inlineRadio2" value="Enhancements">
</div><br><br>
<div class="form-group">
    <label for="exampleFormControlSelect1">Defect Status</label>
    <select class="form-control" id="exampleFormControlSelect1" name="status" value=<%=smallList.get(i).getStatus() %>>
      <option value="Fixed">Fixed</option>
      <option value="Not_Fixed">Not Fixed</option>
      <option value="Re_Open">Re-Open</option>
      <option value="Postpone">Postpone</option>
    </select>
  </div>
  <!-- ADD FILE ATTACH AND RADIO LATER ILL JUST STYLE THE FORM EVERYTHING IS THERE ONLY -->
    <div class="form-group"style="margin-top:1em;">
   <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form>
</div>
</div> 
<%}%>
<% }catch(Exception e){ %>
<%}}%>
 

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
