package com.FinalBugProject.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AboutDev
 */
@WebServlet("/AboutDev")
public class AboutDev extends HttpServlet {
	static HttpSession session;
	static RequestDispatcher views;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AboutDev() {
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
		views = request.getRequestDispatcher("WEB-INF/views/AboutDev.jsp");
		views.forward(request, response);
		}
		if(desig.matches("Admin")) {
			views = request.getRequestDispatcher("WEB-INF/views/admin/AboutDev.jsp");
			views.forward(request, response);
		}
		if(desig.matches("Developer")) {
			views = request.getRequestDispatcher("WEB-INF/views/developer/AboutDev.jsp");
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
		
	}

}
