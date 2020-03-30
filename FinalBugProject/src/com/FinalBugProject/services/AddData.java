package com.FinalBugProject.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.FinalBugProject.models.BugReport;
import com.FinalBugProject.models.EditProfile;
import com.FinalBugProject.models.Feedback;
import com.FinalBugProject.models.Login;
import com.FinalBugProject.models.Signup;

public class AddData {
	static HttpServletRequest request;
	static SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
	static Session session = sessionFactory.openSession();
	static HttpSession session1;
	static RequestDispatcher views;

	public void insertLogin(Login user) {
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
	}

	public void insertSignup(Signup user) {
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
	}

	public void insertEdit(EditProfile user) {
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
	}
	public void submitBug(BugReport user) {
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
	}
	public void sendFeedback(Feedback user) {
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
	}



	public void endSession() {
		
			session.close();
		
	
	}
	public String validate(String email, String password) {
		Query query = session.createQuery("from Login");
		String desig = "";
		String email1 = "";
		String pass = "";
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Login login = (Login) itr.next();
			email1 = login.getEmail();
			pass = login.getPassword();
			if (email1.matches(email) && (pass.matches(password))) {
				desig = login.getDesig();
			}
			
		}
		return desig;
		
	}
	public int exists(String email, String username, String password) {
		int flag = 0;
		String Email = "";
		String uname = "";
		String pwd = "";
		Query query = session.createQuery("from Signup");
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Signup signup = (Signup) itr.next();
			Email = signup.getEmail();
			uname = signup.getUname();
			pwd = signup.getPwd();
			if (Email.matches(email)) {
				flag = 1;
			} else if (uname.matches(username)) {
				flag = 2;
			} else if (pwd.matches(password)) {
				flag = 3;
			}
		}
		return flag;
	}

	public int existsEmail(String email) {
		int flag = 0;
		String Email = "";
		String pwd = "";
		List returnString = new ArrayList();
		Query query = session.createQuery("from Signup");
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Signup signup = (Signup) itr.next();
			Email = signup.getEmail();
			pwd = signup.getPwd();
			if (Email.matches(email)) {
				flag = 1;
			}
		}
		return flag;
	}

	public String returnPassword(String email) {
		int flag = 0;
		String Email = "";
		String pwd = "";
		String password = "";
		List returnString = new ArrayList();
		Query query = session.createQuery("from Signup");
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Signup signup = (Signup) itr.next();
			Email = signup.getEmail();
			pwd = signup.getPwd();
			if (Email.matches(email)) {
				password = pwd;
			}
		}
		return password;
	}
	public String returnEmail(String uid) {
		int flag = 0;
		long id=0;
		String Email="";
		List returnString = new ArrayList();
		Query query = session.createQuery("from Signup");
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Signup signup = (Signup) itr.next();
			id = signup.getId();
			if (uid.matches(Long.toString(id)))
				Email = signup.getEmail();
		}
		return Email;
	}

	public long getUID(String email, String password) {
		Query query = session.createQuery("from Login");
		String desig = "";
		String email1 = "";
		String pass = "";
		long userId = 0;
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Login login = (Login) itr.next();
			email1 = login.getEmail();
			pass = login.getPassword();

			if (email1.matches(email) && pass.matches(password)) {
				userId = login.getId();
			}
		}
		return userId;
	}
	public int update(String email, String password, String fullname, String dob, String prof, String website,
			String linkedin, String facebook, String primary, String secondary, String tertiary)  {
		session.beginTransaction();
		int result = 0;
		String value = validate(email, password);
		if (value != null) {
			long uid = getUID(email, password);
			String stmnt = "Update EditProfile set FullName=:fullname,DOB=:dob,PhoneNumber=:phno"
					+ ",WebsiteURL=:website,LinkedInURL=:linkedin,FacebookURL=:facebook,PrimaryProf=:primary,SecondaryProf=:secondary,TertiaryProf=:tertiary"
					+ " where User_ID_FK=:uid";
			
			Query query = session.createQuery(stmnt);
			query.setParameter("fullname", fullname);
			query.setParameter("dob", dob);
			query.setParameter("phno", prof);
			query.setParameter("website", website);
			query.setParameter("linkedin", linkedin);
			query.setParameter("facebook", facebook);
			query.setParameter("primary", primary);
			query.setParameter("secondary",secondary);
			query.setParameter("tertiary", tertiary);
			query.setParameter("uid", uid);
			result = query.executeUpdate();
			session.getTransaction().commit();
			
		}
		return result;
	}



	
	public String[] getEdit(String email, String password) {
		Query query = session.createQuery("from Login");
		String [] values = new String[10];
		String email1 = "";
		String pass = "";
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Login login = (Login) itr.next();
			email1 = login.getEmail();
			pass = login.getPassword();

			if (email1.matches(email) && (pass.matches(password))) {
				Query query1 = session.createQuery("from EditProfile where User_ID_FK="+getUID(email,password));
				List data1 = query1.getResultList();
				Iterator itr1 = data1.iterator();
				while(itr1.hasNext()) {
					EditProfile edit = (EditProfile) itr1.next();
				values[0]= String.valueOf(getUID(email,password));
				values[1]= edit.getFullName();
				values[2] =  edit.getDOB();
				values[3]=edit.getPhno();
				values[4]= edit.getWebsiteURL();
				values[5] = edit.getLinkedInURL();
				values[6]= edit.getFacebookURL();
				values[7]= edit.getPrimaryProf();
				values[8]= edit.getSecondaryProf();
				values[9]= edit.getTertiaryProf();
			}
		}
		}
	return values;	
	}
	
	public List<BugReport> dashboardSmallTester(String email, String password) {
		Query query = session.createQuery("from Login");
		String email1 = "";
		String pass = "";
		List<BugReport> value = new ArrayList<BugReport>();
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Login login = (Login) itr.next();
			email1 = login.getEmail();
			pass = login.getPassword();
			if (email1.matches(email) && (pass.matches(password))) {
				Query query1 = session.createQuery("from BugReport where UserID="+getUID(email,password));
				value = query1.getResultList();
				
			}
			
		}
		return value;
	}
		
	public List<BugReport> searchRecord(String name) {
		Query query = session.createQuery("from BugReport where summary like '%"+name+"%'");
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> editRecord(String name,String email,String password) {
		Query query = session.createQuery("from BugReport where Report_No="+name+"and UserID="+getUID(email,password));
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	
	public int updateReport(Object report,String email, String password, String summary, String url, String status, String priority, String severity,
			String reproduce, String actual, String expected, String bugtype)  {
		session.beginTransaction();
		int result = 0;
		String value = validate(email, password);
		if (value != null) {
			long uid = getUID(email, password);
			String stmnt = "Update BugReport set summary=:fullname,url=:dob,Status=:phno"
					+ ",priority=:website,severity=:linkedin,reproduce=:facebook,actual=:primary,expected=:secondary,bugtype=:tertiary"
					+ " where UserID="+uid+"and Report_No="+report;
			
			Query query = session.createQuery(stmnt);
			query.setParameter("fullname", summary);
			query.setParameter("dob", url);
			query.setParameter("phno", status);
			query.setParameter("website", priority);
			query.setParameter("linkedin", severity);
			query.setParameter("facebook", reproduce);
			query.setParameter("primary", actual);
			query.setParameter("secondary",expected);
			query.setParameter("tertiary", bugtype);
			result = query.executeUpdate();
			session.getTransaction().commit();
			
		}
		return result;
	}
	
	public List<EditProfile> editProfile(String email,String password) {
		Query query = session.createQuery("from EditProfile where User_ID_FK="+getUID(email,password));
		List<EditProfile> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getStatus(String email,String password) {
		Query query = session.createQuery("from BugReport where Status='Not_Fixed' and UserID="+getUID(email,password));
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getStatus1(String email,String password) {
		Query query = session.createQuery("from BugReport where Status='Re_Open' and UserID="+getUID(email,password));
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getStatus2(String email,String password) {
		Query query = session.createQuery("from BugReport where Status='Postpone' and UserID="+getUID(email,password));
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getStatus3(String email,String password) {
		Query query = session.createQuery("from BugReport where Status='Fixed' and UserID="+getUID(email,password));
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getDevStatus(String email,String password) {
		Query query = session.createQuery("from BugReport where Developer_Asgn='Yes' and UserID="+getUID(email,password));
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public int updatePassword(String newpass,String email,String pass)  {
		session.beginTransaction();
		int result = 0;
			String stmnt = "Update Signup set Password=:pass where User_ID_PK="+getUID(email,pass);
			String stmnt1 = "Update Login set Password=:pass where User_ID_FK="+getUID(email,pass);
			Query query = session.createQuery(stmnt);
			Query query1 = session.createQuery(stmnt1);
			query.setParameter("pass", newpass);
			query1.setParameter("pass", newpass);
			result = query.executeUpdate();
			result = query1.executeUpdate();
			session.getTransaction().commit();
		return result;
	}
	
	public List<Signup> getPass(String email,String pass) {
		Query query = session.createQuery("from Signup where User_ID_PK="+getUID(email,pass));
		List<Signup> value = new ArrayList();
		value = query.getResultList();
		return value;
	}
	public List<BugReport> getAdminStatus() {
		Query query = session.createQuery("from BugReport");
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getAdminStatus1() {
		Query query = session.createQuery("from BugReport where Status='Not_Fixed'");
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getAdminStatus2() {
		Query query = session.createQuery("from BugReport where Status='Re_Open'");
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getAdminStatus3() {
		Query query = session.createQuery("from BugReport where Status='Postpone'");
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getAdminStatus4() {
		Query query = session.createQuery("from BugReport where Status='Fixed'");
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getAdminStatus5() {
		Query query = session.createQuery("from BugReport where Developer_Asgn='Yes'");
		List<BugReport> value = new ArrayList<BugReport>();
		value = query.getResultList();
		return value;
}
	public List<Login> getAdminStatus6() {
		Query query = session.createQuery("from Login");
		List<Login> value = new ArrayList<Login>();
		value = query.getResultList();
		return value;
}
	public List<Login> getAdminStatus7() {
		Query query = session.createQuery("from Login where Designation='Developer'");
		List<Login> value = new ArrayList<Login>();
		value = query.getResultList();
		return value;
}
	public List<Login> getAdminStatus8() {
		Query query = session.createQuery("from Login where Designation='Tester'");
		List<Login> value = new ArrayList<Login>();
		value = query.getResultList();
		return value;
}
	public List<Signup> getDev() {
		Query query = session.createQuery("from Signup where Designation='Developer'");
		List<Signup> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<BugReport> getReportStat(){
		Query query = session.createQuery("from BugReport where Status not in(select Status from BugReport where Status='Fixed') and Developer_Asgn='No' ");
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
	}
	public int assignDev(long reportno,String dev,String asgn)  {
		session.beginTransaction();
		int result = 0;
			String stmnt = "Update BugReport set Developer_Asgn=:asgn,Developer_ID=:dev where Report_No="+reportno;
			Query query = session.createQuery(stmnt);
			query.setParameter("asgn", asgn);
			query.setParameter("dev", dev);
			result = query.executeUpdate();
			session.getTransaction().commit();
		return result;
	}
	
	public List<BugReport> getReports(String name,String priority,String severity,String status){
		Query query = null;
		query = session.createQuery("from BugReport where summary like '%"+name+"%' and priority="+priority+" and severity="+severity+" and Status=:stat");
		query.setParameter("stat", status);
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
	}

	
	public int updatePicName(String email,String password,String imgname) {
		int result=0;
		session.beginTransaction();
		String stmnt = "Update EditProfile set ImageName=:img where User_ID_FK="+getUID(email,password);
		Query query = session.createQuery(stmnt);
		query.setParameter("img", imgname);
		result = query.executeUpdate();
		session.getTransaction().commit();
	return result;
	}
	
	public List<BugReport> adminReports(String email, String password) {
		Query query = session.createQuery("from Login");
		String email1 = "";
		String pass = "";
		List<BugReport> value = new ArrayList<BugReport>();
		List data = query.getResultList();
		Iterator itr = data.iterator();
		for (int i = 0; itr.hasNext(); i++) {
			Login login = (Login) itr.next();
			email1 = login.getEmail();
			pass = login.getPassword();
			if (email1.matches(email) && (pass.matches(password))) {
				Query query1 = session.createQuery("from BugReport");
				value = query1.getResultList();
				
			}
			
		}
		return value;
	}
	
	public List<BugReport> editRecordAdmin(String name) {
		Query query = session.createQuery("from BugReport where Report_No="+name);
		List<BugReport> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public int updateReportAdmin(Object report, String summary, String url, String status, String priority, String severity,
			String reproduce, String actual, String expected, String bugtype)  {
		session.beginTransaction();
		int result = 0;
		
			String stmnt = "Update BugReport set summary=:fullname,url=:dob,Status=:phno"
					+ ",priority=:website,severity=:linkedin,reproduce=:facebook,actual=:primary,expected=:secondary,bugtype=:tertiary where Report_No="+report;
			
			Query query = session.createQuery(stmnt);
			query.setParameter("fullname", summary);
			query.setParameter("dob", url);
			query.setParameter("phno", status);
			query.setParameter("website", priority);
			query.setParameter("linkedin", severity);
			query.setParameter("facebook", reproduce);
			query.setParameter("primary", actual);
			query.setParameter("secondary",expected);
			query.setParameter("tertiary", bugtype);
			result = query.executeUpdate();
			session.getTransaction().commit();
			
		return result;
	}
	public List<Signup> searchUser(String name) {
		Query query = session.createQuery("from Signup where Email like '%"+name+"%'");
		List<Signup> value = new ArrayList();
		value = query.getResultList();
		return value;
}
	public List<Login> getuser(String email,String password) {
		Query query = session.createQuery("from Login where User_ID_FK!="+getUID(email,password));
		List<Login> value = new ArrayList<Login>();
		value = query.getResultList();
		return value;
}
	public int deleteUser(String userid) {
		int i=0;
		session.beginTransaction();
		String query1 = "delete from EditProfile where User_ID_FK="+userid;
		String query2 = "delete from Login where User_ID_FK="+userid;
		String query3 = "delete from Signup where User_ID_PK="+userid;
		Query a = session.createQuery(query1);
		Query b = session.createQuery(query2);
		Query c = session.createQuery(query3);
		i = a.executeUpdate();
		i = b.executeUpdate();
		i = c.executeUpdate();
		session.getTransaction().commit();
		return i;
	}
	public List<Feedback> getFeedback() {
		Query query = session.createQuery("from Feedback");
		List<Feedback> value = new ArrayList<Feedback>();
		value = query.getResultList();
		return value;
}

	public List<BugReport> getDevStatus1(String email,String password) {
		Query query = session.createQuery("from BugReport where Developer_Asgn='Yes' and Developer_ID="+getUID(email,password));
		List<BugReport> value = new ArrayList<BugReport>();
		value = query.getResultList();
		return value;
}
	public List<Signup> getTesterEmail(String reportno) {
		Query query = session.createQuery("from Signup where User_ID_PK="+reportno);
		List<Signup> value = new ArrayList<Signup>();
		value = query.getResultList();
		return value;
}
	public int updateReportDev(String email,Object report, String summary, String url, String status, String reproduce, String actual, String expected,String hidden)  {
		session.beginTransaction();
		int result = 0;
			String stmnt = "Update BugReport set summary=:fullname,url=:dob,Status=:phno"
					+ ",reproduce=:facebook,actual=:primary,expected=:secondary where Report_No="+report;
			Query query = session.createQuery(stmnt);
			query.setParameter("fullname", summary);
			query.setParameter("dob", url);
			query.setParameter("phno", status);
			query.setParameter("facebook", reproduce);
			query.setParameter("primary", actual);
			query.setParameter("secondary",expected);
			result = query.executeUpdate();
			session.getTransaction().commit();	
		return result;
	}
	
}

