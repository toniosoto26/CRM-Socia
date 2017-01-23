package com.socia.DTO;

public class AppointmentDTO {
	
	private	int		crmAppointmentId;
	private	String	date;
	private	int		crmClientId;
	private	int		crmUserId;
	private	int		crmContactId;
	private	int		crmBdmId;
	private	String	firstName;
	private	String	lastName;
	private	String	email;
	private	String	companyName;
	private	String	comments;
	
	public int getCrmAppointmentId() {
		return crmAppointmentId;
	}
	public void setCrmAppointmentId(int crmAppointmentId) {
		this.crmAppointmentId = crmAppointmentId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getCrmClientId() {
		return crmClientId;
	}
	public void setCrmClientId(int crmClientId) {
		this.crmClientId = crmClientId;
	}
	public int getCrmUserId() {
		return crmUserId;
	}
	public void setCrmUserId(int crmUserId) {
		this.crmUserId = crmUserId;
	}
	public int getCrmContactId() {
		return crmContactId;
	}
	public void setCrmContactId(int crmContactId) {
		this.crmContactId = crmContactId;
	}
	public int getcrmBdmId() {
		return crmBdmId;
	}
	public void setcrmBdmId(int crmBdmId) {
		this.crmBdmId = crmBdmId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCrmBdmId() {
		return crmBdmId;
	}
	public void setCrmBdmId(int crmBdmId) {
		this.crmBdmId = crmBdmId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	@Override
	public String toString() {
		return "AppointmentDTO [crmAppointmentId=" + crmAppointmentId
				+ ", date=" + date + ", crmClientId=" + crmClientId
				+ ", crmUserId=" + crmUserId + ", crmContactId=" + crmContactId
				+ ", crmBdmId=" + crmBdmId + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", email=" + email
				+ ", companyName=" + companyName + ", comments=" + comments
				+ "]";
	}
	

}
