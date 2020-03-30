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
import com.FinalBugProject.models.Signup;
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class ResetPasswordServ
 */
@WebServlet("/ResetPasswordServ")
public class ResetPasswordServ extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordServ() {
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
		String email = session.getAttribute("email").toString();
		String password  =session.getAttribute("password").toString();
		List<EditProfile> value = data.editProfile(email, password);
		if(desig.matches("Tester")) {
		request.setAttribute("profiledata", value);
		views = request.getRequestDispatcher("WEB-INF/views/settings.jsp");
		views.forward(request, response);}
		if(desig.matches("Admin")) {
			request.setAttribute("profiledata", value);
			views = request.getRequestDispatcher("WEB-INF/views/admin/SettingsAdmin.jsp");
			views.forward(request, response);
		}
		if(desig.matches("Developer")) {
			request.setAttribute("profiledata", value);
			views = request.getRequestDispatcher("WEB-INF/views/developer/Settings.jsp");
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
		int result=0;
		try{
			session = request.getSession();
		session.setMaxInactiveInterval(300);
		String desig = session.getAttribute("desig").toString();
		String oldpass = session.getAttribute("password").toString();
		String email = session.getAttribute("email").toString();
		String existing = request.getParameter("existingpass");
		List<Signup> match = data.getPass(email, existing);
		String newpass = request.getParameter("newpass");
		String againnewpass = request.getParameter("againnewpass");
		List<EditProfile> value = data.editProfile(email, oldpass);
		String password_regex = "((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})";
		request.setAttribute("error", false);
		if(desig.matches("Tester")) {
		if(existing.matches(password_regex)==false) {
			request.setAttribute("existing", true);
			request.setAttribute("error", true);
			request.setAttribute("profiledata", value);
			views = request.getRequestDispatcher("WEB-INF/views/settings.jsp");
			views.forward(request, response);
		}else {
			if(newpass.matches(password_regex)==false) {
				request.setAttribute("existing", true);
				request.setAttribute("error", true);
				request.setAttribute("profiledata", value);
				views = request.getRequestDispatcher("WEB-INF/views/settings.jsp");
				views.forward(request, response);
			}else
			{
				if(againnewpass.matches(password_regex)==false) {
					request.setAttribute("existing", true);
					request.setAttribute("error", true);
					request.setAttribute("profiledata", value);
					views = request.getRequestDispatcher("WEB-INF/views/settings.jsp");
					views.forward(request, response);
				}
			}
		}
		if((boolean)request.getAttribute("error")==false) {
			if(existing.matches(oldpass)) {
				if(newpass.matches(againnewpass)) {
				result = data.updatePassword(newpass, email, oldpass);
				if(result!=0) {
					request.setAttribute("success", true);
					request.setAttribute("email", "");
					request.setAttribute("password", "");
					request.setAttribute("profiledata", value);
					views = request.getRequestDispatcher("WEB-INF/views/settings.jsp");
					views.forward(request, response);
					
				}
			}else {
				request.setAttribute("nomatch", true);
				request.setAttribute("profiledata", value);
				views = request.getRequestDispatcher("WEB-INF/views/settings.jsp");
				views.forward(request, response);
			}
		}else {
			request.setAttribute("oldnomatch", true);
			request.setAttribute("profiledata", value);
			views = request.getRequestDispatcher("WEB-INF/views/settings.jsp");
			views.forward(request, response);
		}
	}
		}
		if(desig.matches("Admin")) {
			if(existing.matches(password_regex)==false) {
				request.setAttribute("existing", true);
				request.setAttribute("error", true);
				request.setAttribute("profiledata", value);
				views = request.getRequestDispatcher("WEB-INF/views/admin/SettingsAdmin.jsp");
				views.forward(request, response);
			}else {
				if(newpass.matches(password_regex)==false) {
					request.setAttribute("existing", true);
					request.setAttribute("error", true);
					request.setAttribute("profiledata", value);
					views = request.getRequestDispatcher("WEB-INF/views/admin/SettingsAdmin.jsp");
					views.forward(request, response);
				}else
				{
					if(againnewpass.matches(password_regex)==false) {
						request.setAttribute("existing", true);
						request.setAttribute("error", true);
						request.setAttribute("profiledata", value);
						views = request.getRequestDispatcher("WEB-INF/views/admin/SettingsAdmin.jsp");
						views.forward(request, response);
					}
				}
			}
			if((boolean)request.getAttribute("error")==false) {
				if(existing.matches(oldpass)) {
					if(newpass.matches(againnewpass)) {
					result = data.updatePassword(newpass, email, oldpass);
					if(result!=0) {
						request.setAttribute("success", true);
						request.setAttribute("email", "");
						request.setAttribute("password", "");
						request.setAttribute("profiledata", value);
						views = request.getRequestDispatcher("WEB-INF/views/admin/SettingsAdmin.jsp");
						views.forward(request, response);
						
					}
				}else {
					request.setAttribute("nomatch", true);
					request.setAttribute("profiledata", value);
					views = request.getRequestDispatcher("WEB-INF/views/admin/SettingsAdmin.jsp");
					views.forward(request, response);
				}
			}else {
				request.setAttribute("oldnomatch", true);
				request.setAttribute("profiledata", value);
				views = request.getRequestDispatcher("WEB-INF/views/admin/SettingsAdmin.jsp");
				views.forward(request, response);
			}
		}
		}
		if(desig.matches("Developer")) {
			if(existing.matches(password_regex)==false) {
				request.setAttribute("existing", true);
				request.setAttribute("error", true);
				request.setAttribute("profiledata", value);
				views = request.getRequestDispatcher("WEB-INF/views/developer/Settings.jsp");
				views.forward(request, response);
			}else {
				if(newpass.matches(password_regex)==false) {
					request.setAttribute("existing", true);
					request.setAttribute("error", true);
					request.setAttribute("profiledata", value);
					views = request.getRequestDispatcher("WEB-INF/views/developer/Settings.jsp");
					views.forward(request, response);
				}else
				{
					if(againnewpass.matches(password_regex)==false) {
						request.setAttribute("existing", true);
						request.setAttribute("error", true);
						request.setAttribute("profiledata", value);
						views = request.getRequestDispatcher("WEB-INF/views/developer/Settings.jsp");
						views.forward(request, response);
					}
				}
			}
			if((boolean)request.getAttribute("error")==false) {
				if(existing.matches(oldpass)) {
					if(newpass.matches(againnewpass)) {
					result = data.updatePassword(newpass, email, oldpass);
					if(result!=0) {
						request.setAttribute("success", true);
						request.setAttribute("email", "");
						request.setAttribute("password", "");
						request.setAttribute("profiledata", value);
						views = request.getRequestDispatcher("WEB-INF/views/developer/Settings.jsp");
						views.forward(request, response);
						
					}
				}else {
					request.setAttribute("nomatch", true);
					request.setAttribute("profiledata", value);
					views = request.getRequestDispatcher("WEB-INF/views/developer/Settings.jsp");
					views.forward(request, response);
				}
			}else {
				request.setAttribute("oldnomatch", true);
				request.setAttribute("profiledata", value);
				views = request.getRequestDispatcher("WEB-INF/views/developer/Settings.jsp");
				views.forward(request, response);
			}
		}
		}
	}catch(Exception e) {
		if(session.getAttribute("email")==null) {
			response.sendRedirect("./welcome");
		}
	}
	}
}
