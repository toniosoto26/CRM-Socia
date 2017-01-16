package com.socia.DTO;

import java.util.Calendar;

public class DateDTO {
	
	private String 		dayOfWeek;
	private Calendar 	date;
	
	public DateDTO(String dayOfWeek, Calendar date) {
		super();
		this.dayOfWeek = dayOfWeek;
		this.date = date;
	}
	
	public String getDayOfWeek() {
		return dayOfWeek;
	}
	public void setDayOfWeek(String dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
	public Calendar getDate() {
		return date;
	}
	public void setDate(Calendar date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "DateDTO [dayOfWeek=" + dayOfWeek + ", date=" + date + "]";
	}
	
}
