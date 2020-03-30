package com.FinalBugProject.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Bug_Reports")
public class BugReport {

public String UserID;
public String getUserId() {
	return UserID;
}
public void setUserId(String userId) {
	UserID = userId;
}
public long getId() {
		return Id;
	}
	public void setId(long id) {
		this.Id = id;
	}

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name="Report_No")
private long Id;
private String summary;
public BugReport() {
}
public BugReport(long id) {
	this.Id = id;
}
public String getSummary() {
	return summary;
}
public void setSummary(String summary) {
	this.summary = summary;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public String getPriority() {
	return priority;
}
public void setPriority(String priority) {
	this.priority = priority;
}
public String getSeverity() {
	return severity;
}
public void setSeverity(String severity) {
	this.severity = severity;
}
public String getReproduce() {
	return reproduce;
}
public void setReproduce(String reproduce) {
	this.reproduce = reproduce;
}
public String getActual() {
	return actual;
}
public void setActual(String actual) {
	this.actual = actual;
}
public String getExpected() {
	return expected;
}
public void setExpected(String expected) {
	this.expected = expected;
}
public String getBugtype() {
	return bugtype;
}
public void setBugtype(String bugtype) {
	this.bugtype = bugtype;
}
private String Status;
public String getStatus() {
	return Status;
}
public void setStatus(String status) {
	this.Status = status;
}
private String url;
private String priority;
private String severity;
private String reproduce;
private String actual;
private String expected;

private String bugtype;
private String Developer_Asgn;
public String getDeveloper_Asgn() {
	return Developer_Asgn;
}
public void setDeveloper_Asgn(String developer_Asgn) {
	Developer_Asgn = developer_Asgn;
}
public String getDeveloper_ID() {
	return Developer_ID;
}
public void setDeveloper_ID(String developer_ID) {
	Developer_ID = developer_ID;
}
private String Developer_ID;
}
