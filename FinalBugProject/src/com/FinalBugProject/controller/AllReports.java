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
 * Servlet implementation class AllReports
 */
@WebServlet("/AllReports")
public class AllReports extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllReports() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		session = request.getSession();
		String desig = session.getAttribute("desig").toString();
		if(desig.matches("Tester")) {
		String email = session.getAttribute("email").toString();
		String pass = session.getAttribute("password").toString();
		List<BugReport> value = data.dashboardSmallTester(email, pass);
		request.setAttribute("list1", value);
		views = request.getRequestDispatcher("WEB-INF/views/tester.jsp");
		views.forward(request, response);}
		if(desig.matches("Admin")) {
			String email = session.getAttribute("email").toString();
			String pass = session.getAttribute("password").toString();
			List<BugReport> value = data.getAdminStatus();
			request.setAttribute("list1", value);
			views = request.getRequestDispatcher("WEB-INF/views/admin/admin.jsp");
			views.forward(request, response);}
		
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
		
	}

}
