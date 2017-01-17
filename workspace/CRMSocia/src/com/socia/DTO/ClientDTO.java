package com.socia.DTO;

public class ClientDTO {

	private int 	clientId;
	private String	companyName;
	private int		bdmId;
	private String  status;
	private String	clientType;
	private int		userId;

	public ClientDTO(int clientId, String companyName, int bdmId,
			String clientType) {
		super();
		this.clientId = clientId;
		this.companyName = companyName;
		this.bdmId = bdmId;
		this.clientType = clientType;
	}
	
	public ClientDTO(int clientId, String companyName, int bdmId, int userId) {
		super();
		this.clientId = clientId;
		this.companyName = companyName;
		this.bdmId = bdmId;
		this.userId = userId;
	}

	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getBdmId() {
		return bdmId;
	}
	public void setBdmId(int bdmId) {
		this.bdmId = bdmId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getClientType() {
		return clientType;
	}
	public void setClientType(String clientType) {
		this.clientType = clientType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "ClientDTO [clientId=" + clientId + ", companyName="
				+ companyName + ", bdmId=" + bdmId + ", status=" + status
				+ ", clientType=" + clientType + ", userId=" + userId + "]";
	}
	
}
