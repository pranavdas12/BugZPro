package com.FinalBugProject.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FinalBugProject.models.BugReport;
import com.FinalBugProject.models.Login;
import com.FinalBugProject.services.AddData;






/**
 * Servlet implementation class login
 */
@WebServlet("/Loginserv")
public class Loginserv extends HttpServlet {
	static RequestDispatcher views;
	static AddData data = new AddData();
	static HttpSession session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginserv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		request.setAttribute("errors", true);
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(300);
		session.setAttribute("email", email);
		session.setAttribute("password", password);
		String email_regex = "^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
		String password_regex = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";
		if((email.matches(email_regex)&&email.length()>2)==false) {
			request.setAttribute("errors", false);
			request.setAttribute("email_error", true);
			request.setAttribute("email","");
			views = request.getRequestDispatcher("WEB-INF/views/login.jsp");
			views.forward(request, response);
		}else {
			request.setAttribute("email",email);	
		}
		if((password.matches(password_regex)&&password.length()>2)==false) {
			request.setAttribute("errors", false);
			request.setAttribute("password_error", true);
			request.setAttribute("password","");
			views = request.getRequestDispatcher("WEB-INF/views/login.jsp");
			views.forward(request, response);
		}else {
			request.setAttribute("password",password);
		}
		if((boolean)request.getAttribute("errors")){
			
		String desig = data.validate(email, password);
		session.setAttribute("desig", desig);
		if(desig.matches("Developer")){
			views = request.getRequestDispatcher("WEB-INF/views/developer/dashboardDev.jsp");
			session = request.getSession();
			AddData data2 = new AddData();
			List<BugReport> vlue1 = data2.getAdminStatus();
			List<BugReport> vlue2 = data2.getAdminStatus1();
			List<BugReport> vlue3 = data2.getAdminStatus2();
			List<BugReport> vlue4 = data2.getAdminStatus3();
			List<BugReport> vlue5 = data2.getAdminStatus4();
			List<BugReport> vlue6 = data2.getDevStatus1(email,password);
			request.setAttribute("list1", vlue1);
			request.setAttribute("list2", vlue2);
			request.setAttribute("list3", vlue3);
			request.setAttribute("list4", vlue4);
			request.setAttribute("list5", vlue5);
			request.setAttribute("list6", vlue6);
			views.forward(request, response);
		}else if(desig.matches("Tester")) {
			views = request.getRequestDispatcher("WEB-INF/views/dashboardTester.jsp");
			session = request.getSession();
			AddData data1 = new AddData();
			List<BugReport> value1 = data1.dashboardSmallTester(email, password);
			List<BugReport> value2 = data1.getStatus(email, password);
			List<BugReport> value3 = data1.getStatus1(email, password);
			List<BugReport> value4 = data1.getStatus2(email, password);
			List<BugReport> value5 = data1.getStatus3(email, password);
			List<BugReport> value6 = data1.getDevStatus(email, password);
			request.setAttribute("list1", value1);
			request.setAttribute("list2", value2);
			request.setAttribute("list3", value3);
			request.setAttribute("list4", value4);
			request.setAttribute("list5", value5);
			request.setAttribute("list6", value6);
			request.setAttribute("email", email);
			views.forward(request, response);
		}else if(desig.matches("Admin")) {
			views = request.getRequestDispatcher("WEB-INF/views/admin/dashboardAdmin.jsp");
			session = request.getSession();
			AddData data2 = new AddData();
			List<BugReport> vlue1 = data2.getAdminStatus();
			List<BugReport> vlue2 = data2.getAdminStatus1();
			List<BugReport> vlue3 = data2.getAdminStatus2();
			List<BugReport> vlue4 = data2.getAdminStatus3();
			List<BugReport> vlue5 = data2.getAdminStatus4();
			List<BugReport> vlue6 = data2.getAdminStatus5();
			List<Login> vlue7 = data2.getAdminStatus6();
			List<Login> vlue8 = data2.getAdminStatus7();
			List<Login> vlue9 = data2.getAdminStatus8();
			request.setAttribute("list1", vlue1);
			request.setAttribute("list2", vlue2);
			request.setAttribute("list3", vlue3);
			request.setAttribute("list4", vlue4);
			request.setAttribute("list5", vlue5);
			request.setAttribute("list6", vlue6);
			request.setAttribute("list7", vlue7);
			request.setAttribute("list8", vlue8);
			request.setAttribute("list9", vlue9);
			request.setAttribute("email", email);
			views.forward(request, response);
		}else if(desig.matches(""))	{
			views = request.getRequestDispatcher("WEB-INF/views/login.jsp");
			request.setAttribute("invalid", true);
			views.forward(request, response);
		}
	
	}
	}catch(Exception e) {
		if(session.getAttribute("email")==null)
			response.sendRedirect("./welcome");
	}
	}
}
