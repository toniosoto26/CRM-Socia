package com.socia.DTO;

public class QuotationDetailDTO {
	
	private int 	quotationId;
	private int		itemId;
	private String	warranty;
	private double	unitPrice;
	private int		quantity;
	private String	estimatedShipping;
	
	public QuotationDetailDTO(int quotationId, int itemId, String warranty,
			double unitPrice, int quantity, String estimatedShipping) {
		super();
		this.quotationId = quotationId;
		this.itemId = itemId;
		this.warranty = warranty;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.estimatedShipping = estimatedShipping;
	}
	public int getQuotationId() {
		return quotationId;
	}
	public void setQuotationId(int quotationId) {
		this.quotationId = quotationId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getWarranty() {
		return warranty;
	}
	public void setWarranty(String warranty) {
		this.warranty = warranty;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getEstimatedShipping() {
		return estimatedShipping;
	}
	public void setEstimatedShipping(String estimatedShipping) {
		this.estimatedShipping = estimatedShipping;
	}
	@Override
	public String toString() {
		return "QuotationDetailDTO [quotationId=" + quotationId + ", itemId="
				+ itemId + ", warranty=" + warranty + ", unitPrice="
				+ unitPrice + ", quantity=" + quantity + ", estimatedShipping="
				+ estimatedShipping + "]";
	}
	
}
