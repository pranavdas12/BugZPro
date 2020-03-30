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
import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class SearchRecord
 */
@WebServlet("/SearchRecord")
public class SearchRecord extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session ;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchRecord() {
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
		if(desig.matches("Tester")) {
		views = request.getRequestDispatcher("WEB-INF/views/SearchRecord.jsp");
		views.forward(request, response);
		}else
		if(desig.matches("Admin")) {
			views = request.getRequestDispatcher("WEB-INF/views/admin/SearchRecordAdmin.jsp");
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
		session = request.getSession();
		try {
		String name = request.getParameter("search");
		AddData data = new AddData();
		List<BugReport> value= data.searchRecord(name);
		if(value.size()!=0) {
		request.setAttribute("foundrecord", true);
		request.setAttribute("searchresult", value);
		views = request.getRequestDispatcher("WEB-INF/views/SearchRecord.jsp");
		views.forward(request, response);
		}else {
			request.setAttribute("foundrecord",null);
			views = request.getRequestDispatcher("WEB-INF/views/SearchRecord.jsp");
			views.forward(request, response);
		}
			
	}catch(Exception e) {
		if(session.getAttribute("email")==null)
			response.sendRedirect("./welcome");
	}}

}
