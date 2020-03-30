<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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
    <script type="text/javascript" src="resources/js/jquery.js"></script>
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


<style>
.modal{
top:12em;
}
.noip{
	border:none;
	outline:none;
	background:transparent;
}
</style>

<script src="resources/js/chart.js"></script>
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
<style>
.ng_mainroot{
    margin-left: 240px;
    height: 100%;
    width: 100%;
    position: absolute;
}.ng_pagetitles{
padding:30px 0;
}
.ng_title{
	font-family:montserrat;
	font-size:22px;
	color:#fff;
	font-weight:500;
}
.ng_row {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -7.5px;
    margin-left: -7.5px;
}
.bg-info, .bg-info>a {
    color: #fff!important;
}
.bg-info {
    background-color: #17a2b8!important;
}
.bg-success {
    background-color: #28a745!important;
}
.bg-danger {
    background-color: #dc3545!important;
}
.bg-yellow {
    background-color: #F3FE00!important;
}
.bg-blue{
	background-color: #0012FE!important;
}
.bg-brown{
	background-color:#900C3F!important;
}
.small-box {
    border-radius: .25rem;
    box-shadow: 0 0 1px rgba(0,0,0,.125), 0 1px 3px rgba(0,0,0,.2);
    display: block;
    margin-bottom: 20px;
    position: relative;
}
.small-box>.inner {
    padding: 10px;
}.small-box h3 {
    font-size: 2.2rem;
    font-weight: 700;
    margin: 0 0 10px 0;
    padding: 0;
    white-space: nowrap;
}.small-box p {
    font-size: 1rem;
}
@media (min-width: 992px){
.ngcard_w25 {
    -ms-flex: 0 0 25%;
    flex: 0 0 25%;
    max-width: 25%;
    margin:0 12px;
}}
.chartjs-render-monitor {
    animation: chartjs-render-animation 1ms;
}
.f_r{
	    position: absolute;
    right: 0;
    top: 2em;
}
.ng_iconcontainer{
	position: relative;
    margin-right: 1em;
    border-radius: 5px;
    background: #000000;    height: 40px;
    width: 40px;
}
.ng_badge{
	position: absolute;
    user-select: none;
    cursor: default;
    font-size: 0.6rem;
    background: #e74c3c;
    width: 1.2rem;
    height: 1.2rem;
    color: #ecf0f1;
    display: inline-flex;
    justify-content: center;
    align-items: center;
    border-radius: 50%;
    top: -0.33rem;
    right: -.66rem;
    box-sizing: border-box;
}
.ng_notifs {
     width: 440px;
     white-space: nowrap;
     overflow: hidden;
     text-overflow: ellipsis;
}
.notification_panel{
display:none;
    cursor: default;
    position: absolute;
    z-index: 999;
       top: 6em;
    right: 0rem;
    width: 400px;
    font-weight: 300;
    background: white;
    border-radius: 0.5rem;
    box-sizing: border-box;
    box-shadow: 0.5rem 0.5rem 2rem 0 rgba(0, 0, 0, 0.2);
    animation-name: dropPanel;
    animation-iteration-count: 1;
    animation-timing-function: all;
    animation-duration: .75s;
}
.bleh-bleh{
	display:block;
}
.notification_panel:before {
    content: "";
    position: absolute;
    top: 1px;
    right: 0;
    width: 0;
    height: 0;
    transform: translate(-1rem, -100%);
    border-left: .75rem solid transparent;
    border-right: .75rem solid transparent;
    border-bottom: .75rem solid white;
}
.nt_title{
    text-transform: uppercase;
    font-size: 75%;
    font-weight: 700;
    color: #84929f;
    padding: 1.5rem 2rem;
}
.ng_notifs{
	    height: 3.25rem;
    padding: 1.125rem 4rem 0.75rem 2rem;
    font-size: 100%;
    border-top: 1px solid rgba(0, 0, 0, 0.1);
}
.issashown{
	display:block;
}
.btn_layout{
	padding:12px;
}
</style>
<%
	List<BugReport> mylist = null;
	List<BugReport> mylist1 = null;
	List<BugReport> mylist2 = null;
	List<BugReport> mylist3 = null;
	List<BugReport> mylist4 = null;
	List<BugReport> mylist5 = null;
	mylist = (List<BugReport>)request.getAttribute("list1");
	mylist1 = (List<BugReport>)request.getAttribute("list2");
	mylist2 = (List<BugReport>)request.getAttribute("list3");
	mylist3 = (List<BugReport>)request.getAttribute("list4");
	mylist4 = (List<BugReport>)request.getAttribute("list5");
	mylist5 = (List<BugReport>)request.getAttribute("list6");
	
%>
<div class="ng_mainroot">

<div class="ng_pagetitles">
	<h2 class="ng_title">Dashboard</h2>
	<img src="images/svg/dashboard.svg" style="width: 40%;
    margin: 5px 295px;">
</div>

<div class="ng_row">
	<div class="ngcard_w25">
	<div class="small-box bg-info">
	<style>
		.card_flex{
			display:flex;
		}
		.card_svg{
		width:30%;}
		.card_data{
		width:70%;}
	</style>
	              <div class="inner"> 
	              
	              <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist.size() %></h3>
	
	                <p>Total Bugs Reported</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
	               
	              </div>
	            </div>
	</div>
	
	<div class="ngcard_w25">
<div class="small-box bg-success bg-info">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist1.size() %></h3>
	
	                <p>Bugs that are not fixed</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>

<div class="ngcard_w25">
<div class="small-box bg-info bg-danger">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist2.size() %></h3>
	
	                <p>Bugs that are reopened</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>
<div class="ngcard_w25">
<div class="small-box bg-yellow">
              <div class="inner">
              <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist3.size() %></h3>
	
	                <p>Bugs that are postponed</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>
<div class="ngcard_w25">
<div class="small-box bg-info bg-blue">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist4.size() %></h3>
	
	                <p>Bugs that are fixed</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>
<div class="ngcard_w25">
<div class="small-box bg-info bg-brown">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist5.size() %></h3>
	
	                <p>Developers assigned to bug</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
            </div>
    

</div>
            <div class="container" >
           
             <div class="col-md-6 py-1">
            <div class="card"  style="float: left;
    margin: 2px 95px;border-radius:8px">
     
                <div class="card-body">
                <img src="images/svg/graph.svg" style="width: 30%;
    margin: 5px 295px;">
 <canvas id="myChart" width="200" height="100" style="display: block;
    height: 265px;
    width: 504px;"></canvas>
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Bugs Reported', 'Not-Fixed', 'Re-opened', 'Postponed', 'Bugs Fixed', 'Devs assigned to Bugs'],
        datasets: [{
            label: 'Current Data',
            data: [<%=mylist.size()%>, <%=mylist1.size()%>, <%=mylist2.size()%>, <%=mylist3.size()%>, <%=mylist4.size()%>, <%=mylist5.size()%>],
            backgroundColor: [
                '#17a2b8',
                '#28a745',
                '#dc3545',
                '#F3FE00',
                '#0012FE',
                '#900C3F'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 0
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>
         </div> 
         </div>
         </div>
         
         </div>
</div>

</body>
</html>