package com.socia.DTO;

import java.util.Date;

public class TenderLogDTO {
	
	private Date	date;
	private String 	companyName;
	private String 	businessLine;
	private String 	brand;
	private String 	comments;
	private Date	deadline;
	private Date	dateCreated;
	
	public TenderLogDTO(Date date, String companyName, String businessLine,
			String brand, String comments, Date deadline, Date dateCreated) {
		super();
		this.date = date;
		this.companyName = companyName;
		this.businessLine = businessLine;
		this.brand = brand;
		this.comments = comments;
		this.deadline = deadline;
		this.dateCreated = dateCreated;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getBusinessLine() {
		return businessLine;
	}
	public void setBusinessLine(String businesLine) {
		this.businessLine = businesLine;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	@Override
	public String toString() {
		return "TenderLogDTO [date=" + date + ", companyName=" + companyName
				+ ", businessLine=" + businessLine + ", brand=" + brand
				+ ", comments=" + comments + ", deadline=" + deadline
				+ ", dateCreated=" + dateCreated + "]";
	}

}
