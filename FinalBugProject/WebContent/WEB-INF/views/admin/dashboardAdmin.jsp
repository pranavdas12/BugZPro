<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.HttpSession" import="javax.servlet.http.HttpServletRequest" %>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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
.bg-green {
	background-color:#0DFC04!important;
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
.bg-purple{
	background-color:#9004FC!important;
}
.bg-main{
	background-color:#FC0B04!important;
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
</style>
<style>
		.card_flex{
			display:flex;
		}
		.card_svg{
		width:30%;}
		.card_data{
		width:70%;}
	</style>
<div class="ng_mainroot">
<div class="ng_pagetitles">
	<h2 class="ng_title">Dashboard</h2>
	<img src="images/svg/dashboard.svg" style="width: 40%;
    margin: 5px 295px;">
</div>
<%
	List<BugReport> mylist = null;
	List<BugReport> mylist1 = null;
	List<BugReport> mylist2 = null;
	List<BugReport> mylist3 = null;
	List<BugReport> mylist4 = null;
	List<BugReport> mylist5 = null;
	List<Login> mylist6 = null;
	List<Login> mylist7 = null;
	List<Login> mylist8 = null;
	mylist = (List<BugReport>)request.getAttribute("list1");
	mylist1 = (List<BugReport>)request.getAttribute("list2");
	mylist2 = (List<BugReport>)request.getAttribute("list3");
	mylist3 = (List<BugReport>)request.getAttribute("list4");
	mylist4 = (List<BugReport>)request.getAttribute("list5");
	mylist5 = (List<BugReport>)request.getAttribute("list6");
	 mylist6 = (List<Login>)request.getAttribute("list7");
	 mylist7 = (List<Login>)request.getAttribute("list8");
	 mylist8 = (List<Login>)request.getAttribute("list9");
	
%>

<div class="ng_row">
		<div class="ngcard_w25">
<div class="small-box bg-info">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist.size() %></h3>
	
	                <p>Total number of bugs</p>
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
<div class="small-box bg-danger bg-info">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist2.size() %></h3>
	
	                <p>Bugs that are re-opened</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>

	<div class="ngcard_w25">
<div class="small-box  bg-info bg-yellow ">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3 style="color:#000;"><%=mylist3.size() %></h3>
	
	                <p style="color:#000;">Bugs that are postponed</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>

	<div class="ngcard_w25">
<div class="small-box bg-blue bg-info">
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
<div class="small-box bg-brown bg-info">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist5.size() %></h3>
	
	                <p>Developers assigned to bugs</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>
	<div class="ngcard_w25">
<div class="small-box bg-green bg-info">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist6.size() %></h3>
	
	                <p>Total number of users(Includes Admin)</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>
	<div class="ngcard_w25">
<div class="small-box bg-purple	 bg-info">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist7.size() %></h3>
	
	                <p>Number of developers available</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
	              </div>
	              </div>
              </div>
            </div>
</div>
	<div class="ngcard_w25">
<div class="small-box bg-main bg-info">
              <div class="inner">
               <div class="card_flex">
	              	<div class="card_data">
	              	 <h3><%=mylist8.size() %></h3>
	
	                <p>Number of testers available</p>
	              	</div>
	              <div class="card_svg">
	              <img src="images/svg/bug.svg" style="width: 100%;">
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
        labels: ['Bugs Reported', 'Not-Fixed', 'Re-opened', 'Postponed', 'Bugs Fixed', 'Devs assigned to Bugs','Total users','No. of Dev','No. of Testers'],
        datasets: [{
            label: 'Current Data',
            data: [<%=mylist.size()%>, <%=mylist1.size()%>, <%=mylist2.size()%>, <%=mylist3.size()%>, <%=mylist4.size()%>, <%=mylist5.size()%>,<%=mylist6.size()%>,<%=mylist7.size()%>,<%=mylist8.size()%>],
            backgroundColor: [
                '#17a2b8',
                '#28a745',
                '#dc3545',
                '#F3FE00',
                '#0012FE',
                '#900C3F',
                '#0DFC04',
                '#9004FC',
                '#FC0B04'
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