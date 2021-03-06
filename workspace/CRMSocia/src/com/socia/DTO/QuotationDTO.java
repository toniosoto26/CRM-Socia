package com.socia.DTO;

public class QuotationDTO {
	private int 	quotationId;
	private int		addressId;
	private int 	clientId;
	private String 	currency;
	private double	exchangeRate;
	private String	closingDate;
	private String	effectiveDate;
	private String	deliveryTimes;
	private int 	userId;
	
	public QuotationDTO(int quotationId, int addressId, int clientId,
			String currency, double exchangeRate, String closingDate, 
			String effectiveDate, String deliveryTimes, int userId) {
		super();
		this.quotationId = quotationId;
		this.addressId = addressId;
		this.clientId = clientId;
		this.currency = currency;
		this.exchangeRate = exchangeRate;
		this.closingDate = closingDate;
		this.effectiveDate = effectiveDate;
		this.deliveryTimes = deliveryTimes;
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
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
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
	public String getClosingDate() {
		return closingDate;
	}
	public void setClosingDate(String closingDate) {
		this.closingDate = closingDate;
	}
	public String getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public String getDeliveryTimes() {
		return deliveryTimes;
	}
	public void setDeliveryTimes(String deliveryTimes) {
		this.deliveryTimes = deliveryTimes;
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
				+ addressId + ", clientId=" + clientId + ", currency="
				+ currency + ", exchangeRate=" + exchangeRate
				+ ", closingDate=" + closingDate + ", effectiveDate="
				+ effectiveDate + ", deliveryTimes=" + deliveryTimes
				+ ", userId=" + userId + "]";
	}

}
