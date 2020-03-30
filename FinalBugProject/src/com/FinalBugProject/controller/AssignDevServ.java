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
import com.FinalBugProject.models.Signup;
import com.FinalBugProject.services.AddData;
import com.FinalBugProject.services.SendEmail;
/**
 * Servlet implementation class AssignDevServ
 */
@WebServlet("/AssignDevServ")
public class AssignDevServ extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignDevServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		session = request.getSession();
		List<Signup> value = data.getDev();
		List<BugReport> value1 = data.getReportStat();
		request.setAttribute("list1", value);
		request.setAttribute("list2", value1);
		views = request.getRequestDispatcher("WEB-INF/views/admin/AssignDev.jsp");
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
		try {
			session = request.getSession();
		long reportno = Long.parseLong(request.getParameter("reportno"));
		String dev = request.getParameter("dev");
		int result = 0;
		if(dev!=null) {
			String asgn = "Yes";
			result = data.assignDev(reportno, dev, asgn);
			String email = data.returnEmail(dev);
			String subject = "Assigned Bug";
			String body = "A bug has been assigned to you with report number="+reportno+".Please check your dashboard for more details ";
			SendEmail send = new SendEmail();
			send.sendEmail(subject, email, body);
			if(result!=0) {
				List<Signup> value = data.getDev();
				List<BugReport> value1 = data.getReportStat();
				request.setAttribute("list1", value);
				request.setAttribute("list2", value1);
				request.setAttribute("assigned", true);
				views = request.getRequestDispatcher("WEB-INF/views/admin/AssignDev.jsp");
				views.forward(request, response);
			}
		}
	}catch(Exception e) {
		if(session.getAttribute("email")==null)
			response.sendRedirect("./welcome");
	}
	}
}
