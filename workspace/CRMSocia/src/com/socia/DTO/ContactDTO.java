package com.socia.DTO;

public class ContactDTO {
	
	private int		contactId;
	private String 	firstName;
	private String 	lastName;
	private String 	phone;
	private String 	email;
	
	public ContactDTO(int contactId, String firstName, String lastName,
			String phone, String email) {
		super();
		this.contactId = contactId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.email = email;
	}
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "ContactDTO [contactId=" + contactId + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", phone=" + phone + ", email="
				+ email + "]";
	}

}
