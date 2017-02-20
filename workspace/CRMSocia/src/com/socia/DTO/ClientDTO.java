package com.socia.DTO;

public class ClientDTO {

	private int 	clientId;
	private String	companyName;
	private int		bdmId;
	private String  status;
	private String	clientType;
	private int		userId;
	private	String	dateCreated;
	private	int		bdmId2;
	private	String	rfc;
	private	String	bussinesTurn;
	private	String	street;
	private	String	extNum;
	private	String	intNum;
	private String	suburb;
	private	String	city;
	private	String	state;
	private	String	country;
	private	int		zipCode;
	private	int		employees;
	private	double	annualSales;
	private	String	webSite;
	private	int		branch;
	private	String	phone;
	
	
	public ClientDTO(){}
	
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
		this.clientType = "P";
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

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getBdmId2() {
		return bdmId2;
	}

	public void setBdmId2(int bdmId2) {
		this.bdmId2 = bdmId2;
	}

	public String getRfc() {
		return rfc;
	}

	public void setRfc(String rfc) {
		this.rfc = rfc;
	}

	public String getBussinesTurn() {
		return bussinesTurn;
	}

	public void setBussinesTurn(String bussinesTurn) {
		this.bussinesTurn = bussinesTurn;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getExtNum() {
		return extNum;
	}

	public void setExtNum(String extNum) {
		this.extNum = extNum;
	}

	public String getIntNum() {
		return intNum;
	}

	public void setIntNum(String intNum) {
		this.intNum = intNum;
	}

	public String getSuburb() {
		return suburb;
	}

	public void setSuburb(String suburb) {
		this.suburb = suburb;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public int getEmployees() {
		return employees;
	}

	public void setEmployees(int employees) {
		this.employees = employees;
	}

	public double getAnnualSales() {
		return annualSales;
	}

	public void setAnnualSales(double annualSales) {
		this.annualSales = annualSales;
	}

	public String getWebSite() {
		return webSite;
	}

	public void setWebSite(String webSite) {
		this.webSite = webSite;
	}

	public int getBranch() {
		return branch;
	}

	public void setBranch(int branch) {
		this.branch = branch;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "ClientDTO [clientId=" + clientId + ", companyName="
				+ companyName + ", bdmId=" + bdmId + ", status=" + status
				+ ", clientType=" + clientType + ", userId=" + userId
				+ ", dateCreated=" + dateCreated + ", bdmId2=" + bdmId2
				+ ", rfc=" + rfc + ", bussinesTurn=" + bussinesTurn
				+ ", street=" + street + ", extNum=" + extNum + ", intNum="
				+ intNum + ", suburb=" + suburb + ", city=" + city + ", state="
				+ state + ", country=" + country + ", zipCode=" + zipCode
				+ ", employees=" + employees + ", annualSales=" + annualSales
				+ ", webSite=" + webSite + ", branch=" + branch + ", phone="
				+ phone + "]";
	}
	
	
}
