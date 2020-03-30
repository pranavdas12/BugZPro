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

import com.FinalBugProject.services.AddData;


/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	static RequestDispatcher views;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("email","");
		views = request.getRequestDispatcher("WEB-INF/views/ForgotPass.jsp");
		views.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddData data = new AddData();
		String email = request.getParameter("email");
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
		            message.setSubject("Forgotten Password");
		            message.setContent(" <center>\r\n" + 
		            		"        <div style=background:#ffffff;width:520px;>\r\n" + 
		            		"            <div style=padding-top:20px;>\r\n" + 
		            		"                <img src=https://img.icons8.com/clouds/100/000000/bug.png style=width:120px;>\r\n" + 
		            		"            </div>\r\n" + 
		            		"            <div style=margin-top:40px>\r\n" + 
		            		"                <h3 style=color:#272727;text-align:center;font-family:poppins;font-size:30px;font-weight:300;>Hello " + toEmail +"</h3>\r\n" + 
		            		"                <img src=http://tutore.carkresolutions.com/emailassests/surr-searching.png style=text-align:center;width:400px;>\r\n" + 
		            		"                <p style=text-align:center;font-family:montserrat;font-size:18px;color:#4a4a4a;font-weight:500;>We got a password reset request from your side, we have made it easy for you to get back to your account. Your password has been attached below!</p>\r\n" + 
		            		"\r\n" + 
		            		"                <div style=margin-top:40px>\r\n" + 
		            		"                    <p style=font-family:poppins;text-align:left;font-size:20px;color:#3c3c3c;>Password</p>\r\n" + 
		            		"                    <h2 style=font-family:montserrat;font-size:32px;color:#f2ab0c;>" + data.returnPassword(toEmail) + "</h2>\r\n" + 
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
				    request.setAttribute("emailsuccess", true);
				    views = request.getRequestDispatcher("WEB-INF/views/ForgotPass.jsp");
					views.forward(request, response);
		       

		        } catch (MessagingException e) {
		            e.printStackTrace();
		        }
		    }else {
		    request.setAttribute("email", "");
		    request.setAttribute("emailerror", true);
		    views = request.getRequestDispatcher("WEB-INF/views/ForgotPass.jsp");
			views.forward(request, response);
		}
		
	}

}
