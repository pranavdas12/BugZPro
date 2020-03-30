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
import com.FinalBugProject.services.SendEmail;
import com.FinalBugProject.models.BugReport;
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class EditReportServ
 */
@WebServlet("/EditReportServ")
public class EditReportServ extends HttpServlet {
	static RequestDispatcher views;	
	static HttpSession session;
	static AddData data = new AddData();
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReportServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			session = request.getSession();
			String desig = session.getAttribute("desig").toString();
		session.setMaxInactiveInterval(300);
		if(desig.matches("Tester")) {
		String email = session.getAttribute("email").toString();
		String password = session.getAttribute("password").toString();
		List<BugReport> value= data.dashboardSmallTester(email, password);
		request.setAttribute("reportlist", value);
		views = request.getRequestDispatcher("WEB-INF/views/EditReport.jsp");
		views.forward(request, response);}else
			if(desig.matches("Admin")) {
				String email = session.getAttribute("email").toString();
				String password = session.getAttribute("password").toString();
				List<BugReport> value= data.adminReports(email, password);
				request.setAttribute("reportlist", value);
				views = request.getRequestDispatcher("WEB-INF/views/admin/EditReportAdmin.jsp");
				views.forward(request, response);
			}
		if(desig.matches("Developer")) {
			String email = session.getAttribute("email").toString();
			String password = session.getAttribute("password").toString();
			List<BugReport> value= data.getDevStatus1(email, password);
			request.setAttribute("reportlist", value);
			views = request.getRequestDispatcher("WEB-INF/views/developer/fixbug.jsp");
			views.forward(request, response);
		}
		}catch(Exception e) {
			if(session.getAttribute("email")==null) {
				response.sendRedirect("./welcome");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String num = request.getParameter("reportno");
		session = request.getSession();
		session.setAttribute("reportno", num);
		String desig = session.getAttribute("desig").toString();
		session.setMaxInactiveInterval(300);
		String email = session.getAttribute("email").toString();
		String password = session.getAttribute("password").toString();
		AddData data = new AddData();
		if(desig.matches("Tester")) {
		List<BugReport> value=data.editRecord(num, email, password);
		request.setAttribute("reportfound", value);
		views = request.getRequestDispatcher("WEB-INF/views/EditReport.jsp");
		views.forward(request, response);}else 
			if(desig.matches("Admin")) {
				List<BugReport> value=data.editRecordAdmin(num);
				request.setAttribute("reportfound", value);
				views = request.getRequestDispatcher("WEB-INF/views/admin/EditReportAdmin.jsp");
				views.forward(request, response);
			}
		if(desig.matches("Developer")) {
			List<BugReport> value= data.getDevStatus1(email, password);
			request.setAttribute("reportfound", value);
			views = request.getRequestDispatcher("WEB-INF/views/developer/fixbug.jsp");
			views.forward(request, response);
		}
	}catch(Exception e) {
		if(session.getAttribute("email")==null) {
			response.sendRedirect("./welcome");
		}
	}
	}
}
