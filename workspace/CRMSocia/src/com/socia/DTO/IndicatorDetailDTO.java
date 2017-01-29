package com.socia.DTO;

public class IndicatorDetailDTO {

	private int 		total;
	private int 		effective;
	private int 		objective;
	private String		type;
	private double		value;
	private String		date;
	
	public IndicatorDetailDTO(int total, int effective, int objective) {
		super();
		this.total = total;
		this.effective = effective;
		this.objective = objective;
	}
	public IndicatorDetailDTO(int total, int objective,
			String type, double value) {
		super();
		this.total = total;
		this.effective = 0;
		this.objective = objective;
		this.type = type;
		this.value = value;
	}
	public IndicatorDetailDTO(int total,
			String type, String date) {
		super();
		this.total = total;
		this.effective = 0;
		this.objective = 0;
		this.type = type;
		this.value = 0;
		this.date = date;
	}
	public IndicatorDetailDTO(int total,
			String type) {
		super();
		this.total = total;
		this.effective = 0;
		this.objective = 0;
		this.type = type;
		this.value = 0;
		this.date = "";
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getEffective() {
		return effective;
	}
	public void setEffective(int effective) {
		this.effective = effective;
	}
	public int getObjective() {
		return objective;
	}
	public void setObjective(int objective) {
		this.objective = objective;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
