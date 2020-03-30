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
 * Servlet implementation class UpdateProfilePic
 */
@WebServlet("/UpdateProfilePic")
public class UpdateProfilePic extends HttpServlet {
	static HttpSession session;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfilePic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			session = request.getSession();
			String desig = session.getAttribute("desig").toString();
			if(desig.matches("Tester")) {
			RequestDispatcher views = request.getRequestDispatcher("WEB-INF/views/settings.jsp");
		String email = session.getAttribute("email").toString();
		String password  =session.getAttribute("password").toString();
		List<EditProfile> value = data.editProfile(email, password);
		request.setAttribute("profpic", true);
		request.setAttribute("profiledata", value);
		views.forward(request, response);
		try {
			ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> item = sf.parseRequest(request);
			for(FileItem num : item) {
			num.write(new File("C:\\Users\\prana\\eclipse-workspace\\FinalBugProject\\WebContent\\images\\userProfilePics\\"+num.getName()));
			data.updatePicName(email, password, num.getName());
			}}catch(Exception e) {
				System.out.println(e);
			}
			}
			if(desig.matches("Admin")) {
				RequestDispatcher views = request.getRequestDispatcher("WEB-INF/views/admin/SettingsAdmin.jsp");
				String email = session.getAttribute("email").toString();
				String password  =session.getAttribute("password").toString();
				List<EditProfile> value = data.editProfile(email, password);
				request.setAttribute("profpic", true);
				request.setAttribute("profiledata", value);
				views.forward(request, response);
				try {
					ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
					List<FileItem> item = sf.parseRequest(request);
					for(FileItem num : item) {
					num.write(new File("C:\\Users\\prana\\eclipse-workspace\\FinalBugProject\\WebContent\\images\\userProfilePics\\"+num.getName()));
					data.updatePicName(email, password, num.getName());
					}}catch(Exception e) {
						System.out.println(e);
					}
			}
			if(desig.matches("Developer")) {
				RequestDispatcher views = request.getRequestDispatcher("WEB-INF/views/developer/Settings.jsp");
				String email = session.getAttribute("email").toString();
				String password  =session.getAttribute("password").toString();
				List<EditProfile> value = data.editProfile(email, password);
				request.setAttribute("profpic", true);
				request.setAttribute("profiledata", value);
				views.forward(request, response);
				try {
					ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
					List<FileItem> item = sf.parseRequest(request);
					for(FileItem num : item) {
					num.write(new File("C:\\Users\\prana\\eclipse-workspace\\FinalBugProject\\WebContent\\images\\userProfilePics\\"+num.getName()));
					data.updatePicName(email, password, num.getName());
					}}catch(Exception e) {
						System.out.println(e);
					}
			}
	}catch(Exception e) {
		if(session.getAttribute("email")==null) {
			response.sendRedirect("./welcome");
		}
	}
	}
}
