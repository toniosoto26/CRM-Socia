package com.socia.DTO;

public class RunRateDTO {
	
	private String 				runRateName;
	private RunRateDetailDTO 	detail;
	
	public RunRateDTO(String runRateName, RunRateDetailDTO detail) {
		super();
		this.runRateName = runRateName;
		this.detail = detail;
	}
	public String getRunRateName() {
		return runRateName;
	}
	public void setRunRateName(String runRateName) {
		this.runRateName = runRateName;
	}
	public RunRateDetailDTO getDetail() {
		return detail;
	}
	public void setDetail(RunRateDetailDTO detail) {
		this.detail = detail;
	}

}
