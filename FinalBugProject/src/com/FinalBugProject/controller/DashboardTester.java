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
 * Servlet implementation class DashboardTester
 */
@WebServlet("/DashboardTester")
public class DashboardTester extends HttpServlet {
	static HttpSession session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardTester() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		session = request.getSession();
		session.setMaxInactiveInterval(300);
		String email = session.getAttribute("email").toString();
		String password = session.getAttribute("password").toString();
		AddData data = new AddData();
		List<BugReport> value1 = data.dashboardSmallTester(email, password);
		List<BugReport> value2 = data.getStatus(email, password);
		List<BugReport> value3 = data.getStatus1(email, password);
		List<BugReport> value4 = data.getStatus2(email, password);
		List<BugReport> value5 = data.getStatus3(email, password);
		List<BugReport> value6 = data.getDevStatus(email, password);
		request.setAttribute("list1", value1);
		request.setAttribute("list2", value2);
		request.setAttribute("list3", value3);
		request.setAttribute("list4", value4);
		request.setAttribute("list5", value5);
		request.setAttribute("list6", value6);
		RequestDispatcher views = request.getRequestDispatcher("WEB-INF/views/dashboardTester.jsp");
		views.forward(request, response);}catch(Exception e) {
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
