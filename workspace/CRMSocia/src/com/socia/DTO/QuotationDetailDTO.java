package com.socia.DTO;

public class QuotationDetailDTO {
	
	private int 	quotationId;
	private String	itemId;
	private String	description;
	private String	warranty;
	private double	unitPrice;
	private double  margin;
	private int		quantity;
	private String	estimatedShipping;
	
	public QuotationDetailDTO(int quotationId, String itemId,
			String description, String warranty, double unitPrice,
			double margin, int quantity, String estimatedShipping) {
		super();
		this.quotationId = quotationId;
		this.itemId = itemId;
		this.description = description;
		this.warranty = warranty;
		this.unitPrice = unitPrice;
		this.margin = margin;
		this.quantity = quantity;
		this.estimatedShipping = estimatedShipping;
	}
	public int getQuotationId() {
		return quotationId;
	}
	public void setQuotationId(int quotationId) {
		this.quotationId = quotationId;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public double getMargin() {
		return margin;
	}
	public void setMargin(double margin) {
		this.margin = margin;
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
				+ itemId + ", description=" + description + ", warranty="
				+ warranty + ", unitPrice=" + unitPrice + ", margin=" + margin
				+ ", quantity=" + quantity + ", estimatedShipping="
				+ estimatedShipping + "]";
	}
	
}
