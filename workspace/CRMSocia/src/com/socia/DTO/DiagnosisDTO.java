package com.socia.DTO;

public class DiagnosisDTO {
	
	private	int		diagnosisId;
	private	String	dateUpdate;
	private	String	name;
	private	String	clientType;
	private	int		userId;
	private	int		clientId;
	
	
	public DiagnosisDTO(){}
	
	public int getDiagnosisId() {
		return diagnosisId;
	}
	public void setDiagnosisId(int diagnosisId) {
		this.diagnosisId = diagnosisId;
	}
	public String getDateUpdate() {
		return dateUpdate;
	}
	public void setDateUpdate(String dateUpdate) {
		this.dateUpdate = dateUpdate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClientType() {
		return clientType;
	}

	public void setClientType(String clientType) {
		this.clientType = clientType;
	}

	@Override
	public String toString() {
		return "DiagnosisDTO [diagnosisId=" + diagnosisId + ", dateUpdate="
				+ dateUpdate + ", name=" + name + ", clientType=" + clientType
				+ ", userId=" + userId + ", clientId=" + clientId + "]";
	}

}
