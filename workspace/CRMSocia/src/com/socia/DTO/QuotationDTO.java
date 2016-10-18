package com.socia.DTO;

public class QuotationDTO {
	private int 	quotationId;
	private int		addressId;
	private int 	contactId;
	private String 	currency;
	private double	exchangeRate;
	private int 	userId;
	
	public QuotationDTO(int quotationId, int addressId, int contactId,
			String currency, double exchangeRate, int userId) {
		super();
		this.quotationId = quotationId;
		this.addressId = addressId;
		this.contactId = contactId;
		this.currency = currency;
		this.exchangeRate = exchangeRate;
		this.userId = userId;
	}
	public int getQuotationId() {
		return quotationId;
	}
	public void setQuotationId(int quotationId) {
		this.quotationId = quotationId;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public double getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(double exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "QuotationDTO [quotationId=" + quotationId + ", addressId="
				+ addressId + ", contactId=" + contactId + ", currency="
				+ currency + ", exchangeRate=" + exchangeRate + ", userId="
				+ userId + "]";
	}

}
