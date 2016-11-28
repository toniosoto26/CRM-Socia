package com.socia.DTO;

public class PositionDTO {
	private int id_position;
	private String position;
	
	
	public PositionDTO(){
		
	}
	public PositionDTO(int id_position, String position) {
		super();
		this.id_position = id_position;
		this.position = position;
	}
	public int getId_position() {
		return id_position;
	}

	public void setId_position(int id_position) {
		this.id_position = id_position;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
}
