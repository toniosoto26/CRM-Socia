package com.socia.DTO;

public class DiagnosisRequirement {

	public DiagnosisRequirement(int client_id, int id_requirement, String path,
			String load_date, int id_user, String status) {
		super();
		this.client_id = client_id;
		Id_requirement = id_requirement;
		this.path = path;
		this.load_date = load_date;
		this.id_user = id_user;
		this.status = status;
	}
	private int client_id;
	private int Id_requirement;
	private String path;
	private String load_date;
	private int id_user;
	private String status;
	

	public DiagnosisRequirement() {
		
	}
	

	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	
	
	public int getClient_id() {
		return client_id;
	}
	public void setClient_id(int client_id) {
		this.client_id = client_id;
	}
	public int getId_requirement() {
		return Id_requirement;
	}
	public void setId_requirement(int id_requirement) {
		Id_requirement = id_requirement;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getLoad_date() {
		return load_date;
	}
	public void setLoad_date(String load_date) {
		this.load_date = load_date;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	
}
