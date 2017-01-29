package com.socia.DTO;

import java.util.Date;

public class QuotationLogDTO {

	private int 	quotationId;
	private String 	companyName;
	private String	itemId;
	private int		quantity;
	private double	unitPrice;
	private String	currency;
	private double	margin;
	private Date	deadline;
	
	public QuotationLogDTO(int quotationId, String companyName, String itemId,
			int quantity, double unitPrice, String currency, double margin,
			Date deadline) {
		super();
		this.quotationId = quotationId;
		this.companyName = companyName;
		this.itemId = itemId;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.currency = currency;
		this.margin = margin;
		this.deadline = deadline;
	}
	public int getQuotationId() {
		return quotationId;
	}
	public void setQuotationId(int quotationId) {
		this.quotationId = quotationId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public double getMargin() {
		return margin;
	}
	public void setMargin(double margin) {
		this.margin = margin;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
}
