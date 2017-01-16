package com.socia.DTO;

public class BusinessLineDTO {

	private int 	businessLineId;
	private String	name;
	
	public BusinessLineDTO(int businessLineId, String name) {
		super();
		this.businessLineId = businessLineId;
		this.name = name;
	}

	public int getBusinessLineId() {
		return businessLineId;
	}

	public void setBusinessLineId(int businessLineId) {
		this.businessLineId = businessLineId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
