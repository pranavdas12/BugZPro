package com.FinalBugProject.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Login")
public class Login {
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="User_ID_FK")
	private Signup signup;
public Signup getSignup() {
		return signup;
	}
	public void setSignup(Signup signup) {
		this.signup = signup;
	}
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column
private long Id;
@Column(name="Email")
private String email;

public long getId() {
	return Id;
}
public void setId(long id) {
	this.Id = id;
}
@Column(name="Password")
private String pwd;

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return pwd;
}
public void setPassword(String password) {
	this.pwd = password;
}
@Column(name="Designation")
private String desig;
public String getDesig() {
	return desig;
}

public void setDesig(String desig) {
	this.desig = desig;

}

}


