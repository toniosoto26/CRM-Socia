package com.socia.DTO;

public class ClientDTO {

	private int 	clientId;
	private String	companyName;
	private int		bdmId;
	private String  status;
	

	public ClientDTO(int clientId, String companyName, int bdmId) {
		super();
		this.clientId = clientId;
		this.companyName = companyName;
		this.bdmId = bdmId;
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
	@Override
	public String toString() {
		return "ClientDTO [clientId=" + clientId + ", companyName="
				+ companyName + ", bdmId=" + bdmId + "]";
	}
	
	
	
}
