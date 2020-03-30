<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.* , java.lang.Exception , com.FinalBugProject.models.*" %>
    <%@ include file="headerAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
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
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}
figure{
   width:300px; /*container-width*/
   overflow:hidden; /*hide bounds of image */
   margin:0;   /*reset margin of figure tag*/
}
figure img{
   display:block; /*remove inline-block spaces*/
   width:100%; /*make image streatch*/
}
figure img{
   /*add to other styles*/   margin:-11.875% 0;
}
</style>
<div class="ng_mainroot">
<div class="ng_pagetitles">
	<h2 class="ng_title">User Profile</h2>
	<img src="images/svg/profile.svg" style="width: 40%;
    margin: 5px 295px;">
</div>
<%
							if (request.getAttribute("editSuccess") != null) {
						%>
						<td><h2 style="color: green; margin: 0 0 30px 0;font-size:20px;">
								The changes have been saved successfully!
							</h2></td>
						<%
							}
						%>
<%
	List<EditProfile> mylist = null;
	Object userid = request.getAttribute("userid");
	mylist = (List<EditProfile>)request.getAttribute("profiledata");
	 for (int i = 0;i<mylist.size();i++) {
%>
<div class="container emp-profile">
            <form method="post" >
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                        <!-- while runtime the path will be specified below by default 
                        then concatenate the path with the filename simple.-->
                        <figure>
                       
                            <%if(mylist.get(i).getImageName()!=null){ %>
                            <img src="images/userProfilePics/<%=mylist.get(i).getImageName() %>" /><%}else{ %>
                            <img src="images/userProfilePics/download.png" />
                            <%} %>
                           </figure>
                            
                                
                                <!-- 
                                	during run time 
                                	
                                	first while registration it self take the profile pictur of the user
                                	
                                	` TO store image
                                	create a folder dedicated only to user images in your server root dir
                                	and store only the name of the image into table not that entire image it self
                                	
                                	so when he comes to this page in that image source you add his picture
                                	
                                 -->
                         
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
                    <div class="col-md-2">
                       <div class="ng_pagetitles">
                       <a href="./EditProfile">Edit Profile</a>
                       </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>WORK LINK</p>
                            <a href="<%=mylist.get(i).getWebsiteURL() %>">Website Link</a><br/>
                            <a href="<%=mylist.get(i).getLinkedInURL() %>">LinkedIn Profile</a><br/>
                            <a href="<%=mylist.get(i).getFacebookURL() %>">Facebook Profile</a>
                            <p>SKILLS</p>
                            <%=mylist.get(i).getPrimaryProf() %><br/>
                            <%=mylist.get(i).getSecondaryProf() %><br/>
                            <%=mylist.get(i).getTertiaryProf() %><br/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=userid %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=mylist.get(i).getFullName() %></p>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <label>Date of Birth</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=mylist.get(i).getDOB() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=session.getAttribute("email") %></p>
                                            </div>
                                        </div>
                                  
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Profession</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=mylist.get(i).getPrimaryProf() %></p>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone Number</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=mylist.get(i).getPhno() %></p>
                                            </div>
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