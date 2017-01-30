package com.socia.DTO;

import java.util.Date;

public class CallLogDTO {
	
	private Date date_call;
	private int crm_user_id;
	private String crm_user_name;
	private String cust_name;
	private String mail;
	private String phone;
	private String contact_name;
	private String  position;
	private String comments;
	private int letter;
	private int competition;
	private String  status;
	
	public CallLogDTO(Date date_call, int crm_user_id, String crm_user_name,
			String cust_name, String mail, String phone, String contact_name,
			String position, String comments, int letter, int competition,
			String status) {
		super();
		this.date_call = date_call;
		this.crm_user_id = crm_user_id;
		this.crm_user_name = crm_user_name;
		this.cust_name = cust_name;
		this.mail = mail;
		this.phone = phone;
		this.contact_name = contact_name;
		this.position = position;
		this.comments = comments;
		this.letter = letter;
		this.competition = competition;
		this.status = status;
	}
	@Override
	public String toString() {
		return "CallLogDTO [date_call=" + date_call + ", crm_user_id="
				+ crm_user_id + ", crm_user_name=" + crm_user_name
				+ ", cust_name=" + cust_name + ", mail=" + mail + ", phone="
				+ phone + ", contact_name=" + contact_name + ", position="
				+ position + ", comments=" + comments + ", letter=" + letter
				+ ", status=" + status + "]";
	}
	public Date getDate_call() {
		return date_call;
	}
	public void setDate_call(Date date_call) {
		this.date_call = date_call;
	}
	public int getCrm_user_id() {
		return crm_user_id;
	}
	public void setCrm_user_id(int crm_user_id) {
		this.crm_user_id = crm_user_id;
	}
	public String getCrm_user_name() {
		return crm_user_name;
	}
	public void setCrm_user_name(String crm_user_name) {
		this.crm_user_name = crm_user_name;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getContact_name() {
		return contact_name;
	}
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getLetter() {
		return letter;
	}
	public void setLetter(int letter) {
		this.letter = letter;
	}
	
	public int getCompetition() {
		return competition;
	}
	public void setCompetition(int competition) {
		this.competition = competition;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
