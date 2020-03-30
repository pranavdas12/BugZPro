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

import com.FinalBugProject.models.Login;
import com.FinalBugProject.models.Signup;
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class SearchUserRecord
 */
@WebServlet("/SearchUserRecord")
public class SearchUserRecord extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUserRecord() {
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
		List<Login> value = data.getuser(email,password);
		request.setAttribute("reportlist", value);
		views = request.getRequestDispatcher("WEB-INF/views/admin/DeleteUserAdmin.jsp");
		views.forward(request, response);
		}catch(Exception e) {
			if(session.getAttribute("email")==null) {
				response.sendRedirect("./welcome");
			}
		}
	}

	/**re
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			session = request.getSession();
			String email = session.getAttribute("email").toString();
			String password = session.getAttribute("password").toString();
		String name = request.getParameter("search");
		List<Signup> value = data.searchUser(name);
		if(value.size()!=0) {
			request.setAttribute("foundrecord", true);
			request.setAttribute("searchresult", value);
			List<Login> value1 = data.getuser(email,password);
			request.setAttribute("reportlist", value1);
			views = request.getRequestDispatcher("WEB-INF/views/admin/DeleteUserAdmin.jsp");
			views.forward(request, response);
		}else {
			request.setAttribute("foundrecord", null);
			List<Login> value1 = data.getuser(email,password);
			request.setAttribute("reportlist", value1);
			views = request.getRequestDispatcher("WEB-INF/views/admin/DeleteUserAdmin.jsp");
			views.forward(request, response);
		}
	}catch(Exception e) {
		if(session.getAttribute("email")==null) {
			response.sendRedirect("./welcome");
		}
	}
	}
}
