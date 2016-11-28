package com.socia.DTO;

public class DivisionDTO {

	private int company_division_id;
	private String name_division;
	
	public DivisionDTO(){
		
	}
	
	public DivisionDTO(int company_division_id, String name_division) {
		super();
		this.company_division_id = company_division_id;
		this.name_division = name_division;
	}

	public int getCompany_division_id() {
		return company_division_id;
	}

	public void setCompany_division_id(int company_division_id) {
		this.company_division_id = company_division_id;
	}

	public String getName_division() {
		return name_division;
	}

	public void setName_division(String name_division) {
		this.name_division = name_division;
	}
	
}
