package com.socia.DTO;

import java.util.Date;

public class AppointmentLogDTO {
	
	private String 	companyName;
	private String 	contactName;
	private String 	position;
	private Date	date;
	private String	subject;
	private String	bdmName;
	
	public AppointmentLogDTO(String companyName, String contactName,
			String position, Date date, String subject, String bdmName) {
		super();
		this.companyName = companyName;
		this.contactName = contactName;
		this.position = position;
		this.date = date;
		this.subject = subject;
		this.bdmName = bdmName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBdmName() {
		return bdmName;
	}
	public void setBdmName(String bdmName) {
		this.bdmName = bdmName;
	}

}
