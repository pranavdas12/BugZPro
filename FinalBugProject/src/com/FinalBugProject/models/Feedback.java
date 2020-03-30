package com.FinalBugProject.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Feedback {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private long Id;
	public long getId() {
		return Id;
	}
	public void setId(long id) {
		this.Id = id;
	}
	@Column(columnDefinition="text")
	private String Subject;
	public String getSubject() {
		return Subject;
	}
	public void setSubject(String subject) {
		Subject = subject;
	}
	public String getSenderEmail() {
		return senderEmail;
	}
	public void setSenderEmail(String senderEmail) {
		this.senderEmail = senderEmail;
	}
	private String senderEmail;
}
