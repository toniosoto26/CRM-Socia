package com.socia.DTO;

public class RunRateTypeDTO {

	private int 	runRateTypeId;
	private String	name;
	
	public RunRateTypeDTO(int runRateTypeId, String name) {
		super();
		this.runRateTypeId = runRateTypeId;
		this.name = name;
	}

	public int getRunRateTypeId() {
		return runRateTypeId;
	}

	public void setRunRateTypeId(int runRateTypeId) {
		this.runRateTypeId = runRateTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
