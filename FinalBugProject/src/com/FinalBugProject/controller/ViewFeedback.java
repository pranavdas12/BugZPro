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

import com.FinalBugProject.models.Feedback;
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class ViewFeedback
 */
@WebServlet("/ViewFeedback")
public class ViewFeedback extends HttpServlet {
	static HttpSession session;
	static AddData data = new AddData();
	static RequestDispatcher views;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewFeedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			session = request.getSession();
				List<Feedback> value = data.getFeedback();
				request.setAttribute("list1", value);
				views = request.getRequestDispatcher("WEB-INF/views/admin/viewFeedback.jsp");
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
