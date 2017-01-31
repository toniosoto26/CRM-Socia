package com.socia.DTO;

public class RunRateDetailDTO {
	
	private int runRateId;
	private int diagnosisId;
	private int clientId;
	private int runRateTypeId;
	private int brandId;
	private int modelId;
	private int qty;
	private String frequency;
	private String other;
	
	public RunRateDetailDTO() {
		super();
	}
	public RunRateDetailDTO(int runRateId, int diagnosisId, int clientId,
			int runRateTypeId, int brandId, int modelId, int qty,
			String frequency, String other) {
		super();
		this.runRateId = 0;
		this.diagnosisId = 0;
		this.clientId = 0;
		this.runRateTypeId = 0;
		this.brandId = 0;
		this.modelId = 0;
		this.qty = 0;
		this.frequency = "";
		this.other = "";
	}
	public int getRunRateId() {
		return runRateId;
	}
	public void setRunRateId(int runRateId) {
		this.runRateId = runRateId;
	}
	public int getDiagnosisId() {
		return diagnosisId;
	}
	public void setDiagnosisId(int diagnosisId) {
		this.diagnosisId = diagnosisId;
	}
	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public int getRunRateTypeId() {
		return runRateTypeId;
	}
	public void setRunRateTypeId(int runRateTypeId) {
		this.runRateTypeId = runRateTypeId;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public int getModelId() {
		return modelId;
	}
	public void setModelId(int modelId) {
		this.modelId = modelId;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getFrequency() {
		return frequency;
	}
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}

}
