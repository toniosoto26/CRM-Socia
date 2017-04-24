package com.socia.DTO;

public class LoginDTO {

	private	int		crmUserId;
	private	String	user;
	private	String	password;
	private	String	firstName;
	private	String	lastName;
	private	String	email;
	private	String	dateCreated;
	private	String	status;
	private String	type;
	
	public LoginDTO(){}

	public int getCrmUserId() {
		return crmUserId;
	}

	public void setCrmUserId(int crmUserId) {
		this.crmUserId = crmUserId;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}
