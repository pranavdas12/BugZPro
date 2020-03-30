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
 * Servlet implementation class DashboardDev
 */
@WebServlet("/DashboardDev")
public class DashboardDev extends HttpServlet {
	static HttpSession session;
	static AddData data2 = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardDev() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			session = request.getSession();
			String email = session.getAttribute("email").toString();
			String password = session.getAttribute("password").toString();
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
		RequestDispatcher views = request.getRequestDispatcher("WEB-INF/views/developer/dashboardDev.jsp");
		views.forward(request, response);
	}catch(Exception e) {
		if(session.getAttribute("email")==null)
			response.sendRedirect("./welcome");
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
