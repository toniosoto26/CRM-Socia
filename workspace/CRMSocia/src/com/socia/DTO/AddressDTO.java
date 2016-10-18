package com.socia.DTO;

public class AddressDTO {
	
	private int addressId;
	private String street;
	private String extNum;
	private String intNum;
	private String suburb;
	private String city;
	private String state;
	private String country;
	private String zipCode;

	public AddressDTO(int addressId, String street, String extNum,
			String intNum, String suburb, String city, String state,
			String country, String zipCode) {
		super();
		this.addressId = addressId;
		this.street = street;
		this.extNum = extNum;
		this.intNum = intNum;
		this.suburb = suburb;
		this.city = city;
		this.state = state;
		this.country = country;
		this.zipCode = zipCode;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
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

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	@Override
	public String toString() {
		return "AddressDTO [addressId=" + addressId + ", street=" + street
				+ ", extNum=" + extNum + ", intNum=" + intNum + ", suburb="
				+ suburb + ", city=" + city + ", state=" + state + ", country="
				+ country + ", zipCode=" + zipCode + "]";
	}

}
