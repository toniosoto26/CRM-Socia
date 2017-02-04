package com.socia.DTO;

public class Vendor {

	private String vendorNum;
	private String name;
	
	public Vendor(String vendorNum, String name) {
		super();
		this.vendorNum = vendorNum;
		this.name = name;
	}

	public String getVendorNum() {
		return vendorNum;
	}
	public void setVendorNum(String vendorNum) {
		this.vendorNum = vendorNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
