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

import com.FinalBugProject.models.Signup;
import com.FinalBugProject.services.AddData;
import com.FinalBugProject.services.SendEmail;

/**
 * Servlet implementation class UpdateReportServ
 */
@WebServlet("/UpdateReportServ")
public class UpdateReportServ extends HttpServlet {
	static HttpServletRequest request;
	static AddData data = new AddData();
	static RequestDispatcher views;
	static HttpSession session;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReportServ() {
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
		int result=0;
		session = request.getSession();
		String desig = session.getAttribute("desig").toString();
		String report = session.getAttribute("reportno").toString();
		String email = session.getAttribute("email").toString();
		String password = session.getAttribute("password").toString();
		String summary = request.getParameter("summary");
		String url = request.getParameter("url");
		String status = request.getParameter("status");
		String priority = request.getParameter("priority");
		String severity = request.getParameter("severity");
		String reproduce = request.getParameter("stepstoreproduce");
		String actual = request.getParameter("actualresults");
		String expected = request.getParameter("expectedresults");
		String bugType = request.getParameter("radio");
		String hidden = request.getParameter("hidden");
			if(desig.matches("Tester")) {
		result = data.updateReport(report,email, password, summary, url, status, priority, severity, reproduce, actual, expected, bugType);
		if(result!=0) {
			request.setAttribute("bugsubmit", true);
			views = request.getRequestDispatcher("WEB-INF/views/EditReport.jsp");
			views.forward(request, response);
		}
		}
			if(desig.matches("Admin")) {
				result = data.updateReportAdmin(report, summary, url, status, priority, severity, reproduce, actual, expected, bugType);
				if(result!=0) {
					request.setAttribute("bugsubmit", true);
					views = request.getRequestDispatcher("WEB-INF/views/admin/EditReportAdmin.jsp");
					views.forward(request, response);
			}
	}else {
		result = data.updateReportDev(email,report, summary, url, status, reproduce, actual, expected,hidden);
		if(result!=0) {
			String subject = "Bug Fixed";
			String body = "Hi, the developer with EmailID: "+email+" has fixed the bug.Please go ahead and check the bug report and if not fixed go to edit reports and change the bug status.Thank You!! ";
			List<Signup> value = data.getTesterEmail(hidden);
			String testerEmail = value.get(0).getEmail(); 
			SendEmail send = new SendEmail();
			send.sendEmail(subject, testerEmail, body);
			views = request.getRequestDispatcher("WEB-INF/views/developer/fixbug.jsp");
			request.setAttribute("bugsubmit", true);
			views.forward(request, response);
		}
	
	}
		
		session.setMaxInactiveInterval(300);
		}catch(Exception e) {
		if(session.getAttribute("email")==null) {
			response.sendRedirect("./welcome");
		}
	}
	}

	
}
