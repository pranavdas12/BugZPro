package com.FinalBugProject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FinalBugProject.models.Feedback;
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class SendFeedback
 */
@WebServlet("/SendFeedback")
public class SendFeedback extends HttpServlet {
	static HttpSession session;
	static RequestDispatcher views;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendFeedback() {
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
		views = request.getRequestDispatcher("WEB-INF/views/feedback.jsp");
		views.forward(request, response);
			}
			if(desig.matches("Admin")) {
				views = request.getRequestDispatcher("WEB-INF/views/admin/feedback.jsp");
				views.forward(request, response);
			}
			if(desig.matches("Developer")) {
				views = request.getRequestDispatcher("WEB-INF/views/developer/feedback.jsp");
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
		if(desig.matches("Tester")) {
		String subject = request.getParameter("subject");
		String email = session.getAttribute("email").toString();
		Feedback feed = new Feedback();
		feed.setSenderEmail(email);
		feed.setSubject(subject);
		data.sendFeedback(feed);
		request.setAttribute("feedsubmit", true);
		views = request.getRequestDispatcher("WEB-INF/views/feedback.jsp");
		views.forward(request, response);
		}
		if(desig.matches("Admin")) {
			String subject = request.getParameter("subject");
			String email = session.getAttribute("email").toString();
			Feedback feed = new Feedback();
			feed.setSenderEmail(email);
			feed.setSubject(subject);
			data.sendFeedback(feed);
			request.setAttribute("feedsubmit", true);
			views = request.getRequestDispatcher("WEB-INF/views/admin/feedback.jsp");
			views.forward(request, response);
			}
		if(desig.matches("Developer")) {
			String subject = request.getParameter("subject");
			String email = session.getAttribute("email").toString();
			Feedback feed = new Feedback();
			feed.setSenderEmail(email);
			feed.setSubject(subject);
			data.sendFeedback(feed);
			request.setAttribute("feedsubmit", true);
			views = request.getRequestDispatcher("WEB-INF/views/developer/feedback.jsp");
			views.forward(request, response);
			}
}catch(Exception e) {
	if(session.getAttribute("email")==null)
		response.sendRedirect("./welcome");
}
}
}