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
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class SearchReportServ
 */
@WebServlet("/SearchReportServ")
public class SearchReportServ extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchReportServ() {
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
		if(desig.matches("Tester")) {
		views = request.getRequestDispatcher("WEB-INF/views/searchReport.jsp");
		views.forward(request, response);
		}else
			if(desig.matches("Admin")) {
				views = request.getRequestDispatcher("WEB-INF/views/admin/SearchReportAdmin.jsp");
				views.forward(request, response);
			}
		if(desig.matches("Developer")) {
			views = request.getRequestDispatcher("WEB-INF/views/developer/searchReport.jsp");
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
			session = request.getSession();
			String desig = session.getAttribute("desig").toString();
		String sum = request.getParameter("search");
		String priority = request.getParameter("priority");
		String severity = request.getParameter("severity");
		String status = request.getParameter("status");
		AddData data = new AddData();
		List<BugReport> value = data.getReports(sum, priority, severity, status);
		if(value.size()!=0) {
			if(desig.matches("Tester")) {
			request.setAttribute("searchresult", value);
			request.setAttribute("foundrecord", true);
			views = request.getRequestDispatcher("WEB-INF/views/searchReport.jsp");
			views.forward(request, response);
			}
				if(desig.matches("Admin")) {
					request.setAttribute("searchresult", value);
					request.setAttribute("foundrecord", true);
					views = request.getRequestDispatcher("WEB-INF/views/admin/SearchReportAdmin.jsp");
					views.forward(request, response);
				}
				if(desig.matches("Developer")) {
					request.setAttribute("searchresult", value);
					request.setAttribute("foundrecord", true);
					views = request.getRequestDispatcher("WEB-INF/views/developer/searchReport.jsp");
					views.forward(request, response);
				}
				
		}else {
			if(desig.matches("Tester")) {
			request.setAttribute("foundrecord", null);
			views = request.getRequestDispatcher("WEB-INF/views/searchReport.jsp");
			views.forward(request, response);
		}
			if(desig.matches("Admin")) {
				request.setAttribute("foundrecord", null);
				views = request.getRequestDispatcher("WEB-INF/views/admin/SearchReportAdmin.jsp");
				views.forward(request, response);
			}
			if(desig.matches("Developer")) {
				request.setAttribute("foundrecord", null);
				views = request.getRequestDispatcher("WEB-INF/views/developer/searchReport.jsp");
				views.forward(request, response);
			}
		}
		}catch(Exception e) {
			if(session.getAttribute("email")==null) {
				response.sendRedirect("./welcome");
			}
		}
	}
}
		
	