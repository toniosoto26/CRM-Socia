package com.socia.DTO;

public class EquipmentTypeDTO {

	private int 	equipmentTypeId;
	private int	 	businessLineId;
	private String	name;
	public EquipmentTypeDTO(int equipmentTypeId, int businessLineId, String name) {
		super();
		this.equipmentTypeId = equipmentTypeId;
		this.businessLineId = businessLineId;
		this.name = name;
	}
	public int getEquipmentTypeId() {
		return equipmentTypeId;
	}
	public void setEquipmentTypeId(int equipmentTypeId) {
		this.equipmentTypeId = equipmentTypeId;
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
