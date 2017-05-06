package com.socia.DTO;

public class MailDeliveryDTO {
	
	private int 	mailDeliveryId;
	private String	email;
	private String	password;
	
	public MailDeliveryDTO(int mailDeliveryId, String email, String password) {
		super();
		this.mailDeliveryId = mailDeliveryId;
		this.email = email;
		this.password = password;
	}
	public int getMailDeliveryId() {
		return mailDeliveryId;
	}
	public void setMailDeliveryId(int mailDeliveryId) {
		this.mailDeliveryId = mailDeliveryId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
