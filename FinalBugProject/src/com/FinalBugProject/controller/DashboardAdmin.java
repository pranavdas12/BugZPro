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
 * Servlet implementation class DashboardAdmin
 */
@WebServlet("/DashboardAdmin")
public class DashboardAdmin extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
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
		views.forward(request, response);
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
