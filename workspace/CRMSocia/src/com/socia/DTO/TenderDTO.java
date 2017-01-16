package com.socia.DTO;

public class TenderDTO {
	
	private int 	tenderId;
	private String	startUpDate;
	private String	deadline;
	private String	requirements;
	private String	comments;
	private int		clientId;
	private int		userId;
	private int		businessLineId;
	private String	decisionMaker;
	private String	dateCreated;
	private String 	currentBrand;
	
	private String	companyName;
	private	String	businessLineName;
	
	public TenderDTO() {
		super();
		this.tenderId = 0;
		this.startUpDate = "";
		this.deadline = "";
		this.requirements = "";
		this.comments = "";
		this.clientId = 0;
		this.userId = 0;
		this.businessLineId = 0;
		this.decisionMaker = "";
		this.dateCreated = "";
		this.currentBrand = "";
		this.companyName = "";
		this.businessLineName = "";
	}
	
	public TenderDTO(int tenderId, String startUpDate, String deadline,
			String requirements, String comments, int clientId, int userId,
			int businessLineId, String decisionMaker, String dateCreated,
			String currentBrand) {
		super();
		this.tenderId = tenderId;
		this.startUpDate = startUpDate;
		this.deadline = deadline;
		this.requirements = requirements;
		this.comments = comments;
		this.clientId = clientId;
		this.userId = userId;
		this.businessLineId = businessLineId;
		this.decisionMaker = decisionMaker;
		this.dateCreated = dateCreated;
		this.currentBrand = currentBrand;
		this.companyName = "";
		this.businessLineName = "";
	}

	public int getTenderId() {
		return tenderId;
	}

	public void setTenderId(int tenderId) {
		this.tenderId = tenderId;
	}

	public String getStartUpDate() {
		return startUpDate;
	}

	public void setStartUpDate(String startUpDate) {
		this.startUpDate = startUpDate;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getBusinessLineId() {
		return businessLineId;
	}

	public void setBusinessLineId(int businessLineId) {
		this.businessLineId = businessLineId;
	}

	public String getDecisionMaker() {
		return decisionMaker;
	}

	public void setDecisionMaker(String decisionMaker) {
		this.decisionMaker = decisionMaker;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getCurrentBrand() {
		return currentBrand;
	}

	public void setCurrentBrand(String currentBrand) {
		this.currentBrand = currentBrand;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getBusinessLineName() {
		return businessLineName;
	}

	public void setBusinessLineName(String businessLineName) {
		this.businessLineName = businessLineName;
	}

	@Override
	public String toString() {
		return "TenderDTO [tenderId=" + tenderId + ", startUpDate="
				+ startUpDate + ", deadline=" + deadline + ", requirements="
				+ requirements + ", comments=" + comments + ", clientId="
				+ clientId + ", userId=" + userId + ", businessLineId="
				+ businessLineId + ", decisionMaker=" + decisionMaker
				+ ", dateCreated=" + dateCreated + ", currentBrand="
				+ currentBrand + ", companyName=" + companyName
				+ ", businessLineName=" + businessLineName + "]";
	}

}
