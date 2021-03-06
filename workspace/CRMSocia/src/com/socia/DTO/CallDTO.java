package com.socia.DTO;

public class CallDTO {
	private int id_call;
	private String comments;
	private int crm_client_id;
	private int crm_user_id;
	private int crm_contact_id;
	private int status;
	private int letter;
	private int competition;
	
	
	public CallDTO(int id_call, String comments, int crm_client_id,
			int crm_user_id, int crm_contact_id, int status, int letter,int competition) {
		super();
		this.id_call = id_call;
		this.comments = comments;
		this.crm_client_id = crm_client_id;
		this.crm_user_id = crm_user_id;
		this.crm_contact_id = crm_contact_id;
		this.status = status;
		this.letter = letter;
		this.competition = competition;
	}
	
	public CallDTO(int id_call, String comments, int crm_client_id,
			int crm_user_id, int crm_contact_id) {
		super();
		this.id_call = id_call;
		this.comments = comments;
		this.crm_client_id = crm_client_id;
		this.crm_user_id = crm_user_id;
		this.crm_contact_id = crm_contact_id;
	}
	public int getCompetition() {
		return competition;
	}
	public void setCompetition(int competition) {
		this.competition = competition;
	}
	public CallDTO(){
		
	}
	public int getId_call() {
		return id_call;
	}
	public void setId_call(int id_call) {
		this.id_call = id_call;
	}
	public String getComments() {
		return comments;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getLetter() {
		return letter;
	}
	public void setLetter(int letter) {
		this.letter = letter;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getCrm_client_id() {
		return crm_client_id;
	}
	public void setCrm_client_id(int crm_client_id) {
		this.crm_client_id = crm_client_id;
	}
	public int getCrm_user_id() {
		return crm_user_id;
	}
	public void setCrm_user_id(int crm_user_id) {
		this.crm_user_id = crm_user_id;
	}
	public int getCrm_contact_id() {
		return crm_contact_id;
	}
	public void setCrm_contact_id(int crm_contact_id) {
		this.crm_contact_id = crm_contact_id;
	}

	
	
	
}
