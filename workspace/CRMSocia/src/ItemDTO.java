
public class ItemDTO {

	private String itemId;
	private String description;
	private String unit;
	private String currency;
	private double tax;
	private double lastPrice;
	
	public ItemDTO(String itemId, String description, String unit,
			String currency, double tax, double lastPrice) {
		super();
		this.itemId = itemId;
		this.description = description;
		this.unit = unit;
		this.currency = currency;
		this.tax = tax;
		this.lastPrice = lastPrice;
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
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public double getTax() {
		return tax;
	}
	public void setTax(double tax) {
		this.tax = tax;
	}
	public double getLastPrice() {
		return lastPrice;
	}
	public void setLastPrice(double lastPrice) {
		this.lastPrice = lastPrice;
	}
	@Override
	public String toString() {
		return "ItemDTO [itemId=" + itemId + ", description=" + description
				+ ", unit=" + unit + ", currency=" + currency + ", tax=" + tax
				+ ", lastPrice=" + lastPrice + "]";
	}
	
}
