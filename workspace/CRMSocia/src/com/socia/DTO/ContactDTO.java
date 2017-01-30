package com.socia.DTO;

public class ContactDTO {
	
	private int		contactId;
	private String 	firstName;
	private String 	lastName;
	private String 	phone;
	private String 	email;
	private String 	status;
	private int 	company_division_id;
	private String  name_division;
	private int 	id_position;
	private String  position;
	private String  ext;
	private	String	cellPhone;
	private	String	birthday;
	

	public ContactDTO(){
		
	}
	
	public ContactDTO(int contactId, String firstName, String lastName,
			String phone, String email, int company_division_id,
			String name_division, int id_position, String position,String ext) {
		super();
		this.contactId = contactId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.email = email;
		this.company_division_id = company_division_id;
		this.id_position = id_position;
		this.position=position;
		this.name_division=name_division;
		this.ext=ext;
	}
	
	public ContactDTO(int contactId, String firstName, String lastName,
			String phone, String email) {
		super();
		this.contactId = contactId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.email = email;
	}
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPhone() {
		return phone;
	}
	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	
	public String getCellPhone() {
		return cellPhone;
	}

	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	@Override
	public String toString() {
		return "ContactDTO [contactId=" + contactId + ", firstName="
				+ firstName + ", lastName=" + lastName + ", phone=" + phone
				+ ", email=" + email + ", status=" + status
				+ ", company_division_id=" + company_division_id
				+ ", name_division=" + name_division + ", id_position="
				+ id_position + ", position=" + position + ", ext=" + ext
				+ ", cellPhone=" + cellPhone + ", birthday=" + birthday + "]";
	}

	
	
}
