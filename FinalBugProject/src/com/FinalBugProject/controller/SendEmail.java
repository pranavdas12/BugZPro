package com.FinalBugProject.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.FinalBugProject.services.AddData;

/**
 * Servlet implementation class SendEmail
 */
@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
	static RequestDispatcher views;
	static HttpSession session1;
	static AddData data = new AddData();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("email", "");
		request.setAttribute("subject", "");
        request.setAttribute("body", "");
		views = request.getRequestDispatcher("WEB-INF/views/admin/SendEmail.jsp");
		views.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			session1 = request.getSession();
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		String body = request.getParameter("body");
		int found = data.existsEmail(email);
		if(found==1) {
			final String fromEmail = "bugzproexec@gmail.com";
			final String password = "98860@das";
			final String toEmail = email;
			 Properties prop = new Properties();
				prop.put("mail.smtp.host", "smtp.gmail.com");
		        prop.put("mail.smtp.port", "465");
		        prop.put("mail.smtp.auth", "true");
		        prop.put("mail.smtp.socketFactory.port", "465");
		        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		        
		        Session session = Session.getInstance(prop,
		                new javax.mail.Authenticator() {
		                    protected PasswordAuthentication getPasswordAuthentication() {
		                        return new PasswordAuthentication(fromEmail, password);
		                    }
		                });

		        try {
		        	
		            Message message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(fromEmail));
		            message.setRecipients(
		                    Message.RecipientType.TO,
		                    InternetAddress.parse(toEmail)
		            );
		            message.setSubject(subject+" from "+session1.getAttribute("email").toString());
		            message.setContent(" <center>\r\n" + 
		            		"        <div style=background:#ffffff;width:520px;>\r\n" + 
		            		"            <div style=padding-top:20px;>\r\n" + 
		            		"                <img src=https://img.icons8.com/clouds/100/000000/bug.png style=width:120px;>\r\n" + 
		            		"            </div>\r\n" + 
		            		"            <div style=margin-top:40px>\r\n" + 
		            		"                <h3 style=color:#272727;text-align:center;font-family:poppins;font-size:20px;font-weight:300;>Hello " + toEmail +"</h3>\r\n" + 
		            		"                \r\n" + 
		            		"                <p style=text-align:center;font-family:montserrat;font-size:20px;color:#4a4a4a;font-weight:500;>"+body+"</p>\r\n" + 
		            		"\r\n" + 
		            		"                    <div style=margin-top:30px>\r\n" + 
		            		"                        <h4 style=font-family:poppins;font-weight:400;color:#a9a9a9;>Copyright © 2020 | BUG Z PRO</h4>\r\n" + 
		            		"                        <p style=font-weight:500;font-family:montserrat;font-size:14px;color:#5f6368;>Replies are not monitored.</p>\r\n" + 
		            		"                        <p style=font-weight:500;font-family:montserrat;font-size:12px;color:#5f6368;>Email sent by BugZPro Admin.</p>\r\n" + 
		            		"                    </div>\r\n" + 
		            		"                </div>\r\n" + 
		            		"            </div>\r\n" + 
		            		"\r\n" + 
		            		"        </div>\r\n" + 
		            		"    </center>","text/html");
		            Transport.send(message);
		            request.setAttribute("email", "");
		            request.setAttribute("subject", "");
		            request.setAttribute("body", "");
				    request.setAttribute("emailsuccess", true);
				    views = request.getRequestDispatcher("WEB-INF/views/admin/SendEmail.jsp");
					views.forward(request, response);
		       

		        } catch (MessagingException e) {
		            e.printStackTrace();
		        }
		    }else {
		    request.setAttribute("email", "");
		    request.setAttribute("emailerror", true);
		    views = request.getRequestDispatcher("WEB-INF/views/admin/SendEmail.jsp");
			views.forward(request, response);
		}
		
	}catch(Exception e) {
		if(session1.getAttribute("email")==null)
			response.sendRedirect("./welcome");
	}
	}
}
