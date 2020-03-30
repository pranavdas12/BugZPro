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

import com.FinalBugProject.models.EditProfile;
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class UserProfile
 */
@WebServlet("/UserProfile")
public class UserProfile extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfile() {
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
		session.setMaxInactiveInterval(300);
		String email = session.getAttribute("email").toString();
		String password  =session.getAttribute("password").toString();
		List<EditProfile> value = data.editProfile(email, password);
		if(desig.matches("Tester")) {
		long userid = data.getUID(email, password);
		request.setAttribute("profiledata", value);
		request.setAttribute("userid", userid);
		views = request.getRequestDispatcher("WEB-INF/views/Profile.jsp");
		views.forward(request, response);}
		if(desig.matches("Admin")) {
			long userid = data.getUID(email, password);
			request.setAttribute("profiledata", value);
			request.setAttribute("userid", userid);
			views = request.getRequestDispatcher("WEB-INF/views/admin/AdminProfile.jsp");
			views.forward(request, response);
		}
		if(desig.matches("Developer")) {
			long userid = data.getUID(email, password);
			request.setAttribute("profiledata", value);
			request.setAttribute("userid", userid);
			views = request.getRequestDispatcher("WEB-INF/views/developer/DevProfile.jsp");
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
