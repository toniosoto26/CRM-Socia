package com.socia.DTO;

public class OpportunitiesDTO {
	
	private int clientId;
	private int diagnosisId;
	private String	comments;
	private String	nextStep;
	
	public OpportunitiesDTO() {
		super();
	}
	public OpportunitiesDTO(int clientId, int diagnosisId, String comments,
			String nextStep) {
		super();
		this.clientId = clientId;
		this.diagnosisId = diagnosisId;
		this.comments = comments;
		this.nextStep = nextStep;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public int getDiagnosisId() {
		return diagnosisId;
	}
	public void setDiagnosisId(int diagnosisId) {
		this.diagnosisId = diagnosisId;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getNextStep() {
		return nextStep;
	}
	public void setNextStep(String nextStep) {
		this.nextStep = nextStep;
	}

}
