package com.FinalBugProject.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.FinalBugProject.services.SendEmail;
import com.FinalBugProject.models.BugReport;
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class ReportBug
 */
@WebServlet("/ReportBugServ")
public class ReportBugServ extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportBugServ() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		views = request.getRequestDispatcher("WEB-INF/views/ReportBug.jsp");
		views.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		session = request.getSession();
		session.setMaxInactiveInterval(300);
		AddData data = new AddData();
		String email = session.getAttribute("email").toString();
		String password = session.getAttribute("password").toString(); 
		String summary = request.getParameter("summary");
		String subject="Reporting Bug";
		String body = "The bug report has been submitted successfully!For further details login to your dashboard.Thank you!!";
		String url = request.getParameter("url");
		String status = request.getParameter("status");
		String priority = request.getParameter("priority");
		String severity = request.getParameter("severity");
		String reproduce = request.getParameter("stepstoreproduce");
		String actual = request.getParameter("actualresults");
		String expected = request.getParameter("expectedresults");
		String bugType = request.getParameter("radio");
		String asgn = "No";
		String uid = String.valueOf(data.getUID(email, password));
		BugReport report = new BugReport();
		SendEmail send = new SendEmail();
		report.setUserId(uid);
		report.setUrl(url);
		report.setSummary(summary);
		report.setActual(actual);
		report.setBugtype(bugType);
		report.setExpected(expected);
		report.setPriority(priority);
		report.setSeverity(severity);
		report.setReproduce(reproduce);
		report.setStatus(status);
		report.setDeveloper_Asgn(asgn);
		data.submitBug(report);
		send.sendEmail(subject, email, body);
		request.setAttribute("bugsubmit", true);
		views = request.getRequestDispatcher("WEB-INF/views/ReportBug.jsp");
		views.forward(request, response);
	}catch(Exception e) {
		if(session.getAttribute("email")==null) {
			response.sendRedirect("./welcome");
		}
	}
	
	}
}
