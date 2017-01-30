package com.socia.DTO;

public class BrandDTO {

	private int 	brandId;
	private int	 	businessLineId;
	private String	name;
	
	public BrandDTO(int brandId, int businessLineId, String name) {
		super();
		this.brandId = brandId;
		this.businessLineId = businessLineId;
		this.name = name;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
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
	@Override
	public String toString() {
		return "BrandDTO [brandId=" + brandId + ", businessLineId="
				+ businessLineId + ", name=" + name + "]";
	}
}
