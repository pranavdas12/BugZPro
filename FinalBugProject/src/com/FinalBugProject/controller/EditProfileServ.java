package com.FinalBugProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.FinalBugProject.models.EditProfile;
import com.FinalBugProject.services.AddData;


/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfileServ extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileServ() {
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
		String password  =session.getAttribute("password").toString();
		List<EditProfile> value = data.editProfile(email, password);
		String desig = session.getAttribute("desig").toString();
		if(desig.matches("Tester")) {
		long userid = data.getUID(email, password);
		request.setAttribute("profiledata", value);
		request.setAttribute("userid", userid);
		views = request.getRequestDispatcher("WEB-INF/views/EditProfile.jsp");
		views.forward(request, response);
		}
		if(desig.matches("Admin")) {
			long userid = data.getUID(email, password);
			request.setAttribute("profiledata", value);
			request.setAttribute("userid", userid);
			views = request.getRequestDispatcher("WEB-INF/views/admin/EditProfile.jsp");
			views.forward(request, response);
			}
		if(desig.matches("Developer")) {
			long userid = data.getUID(email, password);
			request.setAttribute("profiledata", value);
			request.setAttribute("userid", userid);
			views = request.getRequestDispatcher("WEB-INF/views/developer/EditProfile.jsp");
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
		AddData data = new AddData();
		int result=0;
		session = request.getSession();
		String desig = session.getAttribute("desig").toString();
		session.setMaxInactiveInterval(300);
		String email = session.getAttribute("email").toString();
		String password = session.getAttribute("password").toString();
		String Fullname = request.getParameter("fullname");
		String DOB = request.getParameter("dob");
		String PhoneNumber = request.getParameter("number");
		String WebsiteURL = request.getParameter("website");
		String LinkedInURL = request.getParameter("linkedin");
		String FacebookURL = request.getParameter("facebook");
		String PrimaryProf = request.getParameter("primary");
		String SecondaryProf = request.getParameter("secondary");
		String TertiaryProf = request.getParameter("tertiary");
		result = data.update(email, password, Fullname, DOB, PhoneNumber, WebsiteURL, LinkedInURL, FacebookURL, PrimaryProf, SecondaryProf, TertiaryProf);
		if(result!=0) {
			if(desig.matches("Tester")) {
		session = request.getSession();
		List<EditProfile> value = data.editProfile(email, password);
		request.setAttribute("editSuccess", true);
		request.setAttribute("profiledata", value);
		views = request.getRequestDispatcher("WEB-INF/views/Profile.jsp");
		views.forward(request, response);
			}
			if(desig.matches("Admin")) {
				session = request.getSession();
				List<EditProfile> value = data.editProfile(email, password);
				request.setAttribute("editSuccess", true);
				request.setAttribute("profiledata", value);
				views = request.getRequestDispatcher("WEB-INF/views/admin/AdminProfile.jsp");
				views.forward(request, response);
					}
			if(desig.matches("Developer")) {
				session = request.getSession();
				List<EditProfile> value = data.editProfile(email, password);
				request.setAttribute("editSuccess", true);
				request.setAttribute("profiledata", value);
				views = request.getRequestDispatcher("WEB-INF/views/developer/DevProfile.jsp");
				views.forward(request, response);
					}
		}
		
		
	}catch(Exception e) {
		if(session.getAttribute("email")==null) {
			response.sendRedirect("./welcome");
		}
	}
	}
}
