package com.socia.DTO;

import java.util.ArrayList;

public class BlDetailsDTO {

	private int		diagnosisId;
	private int		clientId;
	private int 	businessLineId;
	private int	 	currentBrand;
	private String 	equipmentBrand;
	private int		equipmentType;
	private int		equipmentQty;
	private double	unitPrice;
	private String	currentVendor;
	private String	serviceContract;
	private String	specialConfig;
	private String	deliverBy;
	private String	lease;
	private	String	nextTender;
	private String	requirementsNeeded;
	private String	demo;
	private String	sales;
	private String	executive;
	private String	gainFactor;
	private String	decisionMaker;
	private String	position;
	private String	phone;
	private String	email;
	private String	requirements;
	private String	nextStep;
	private String	commercialProposal;
	private ArrayList<BrandDTO> brandArray;
	
	public BlDetailsDTO() {
		super();
		diagnosisId = 0;
		clientId = 0;
		businessLineId =0;
		currentBrand = 0; 
		equipmentBrand = ""; 
		equipmentType=0; 
		equipmentQty = 0; 
		unitPrice = 0; 
		currentVendor = ""; 
		serviceContract = "";
		specialConfig = "";
		deliverBy = "";
		lease = "";
		nextTender = "";
		requirementsNeeded="";
		demo = ""; 
		sales = ""; 
		executive = ""; 
		gainFactor = ""; 
		decisionMaker = ""; 
		position = "";
		phone = ""; 
		email = ""; 
		requirements = ""; 
		nextStep = ""; 
		commercialProposal = "";
	}
	public BlDetailsDTO(int diagnosisId, int clientId, int businessLineId,
			int currentBrand, String equipmentBrand, int equipmentType,
			int equipmentQty, double unitPrice, String currentVendor,
			String serviceContract, String specialConfig,
			String requirementsNeeded, String demo, String sales,
			String executive, String gainFactor, String decisionMaker,
			String position, String phone, String email, String requirements,
			String nextStep, String commercialProposal) {
		super();
		this.diagnosisId = diagnosisId;
		this.clientId = clientId;
		this.businessLineId = businessLineId;
		this.currentBrand = currentBrand;
		this.equipmentBrand = equipmentBrand;
		this.equipmentType = equipmentType;
		this.equipmentQty = equipmentQty;
		this.unitPrice = unitPrice;
		this.currentVendor = currentVendor;
		this.serviceContract = serviceContract;
		this.specialConfig = specialConfig;
		this.requirementsNeeded = requirementsNeeded;
		this.demo = demo;
		this.sales = sales;
		this.executive = executive;
		this.gainFactor = gainFactor;
		this.decisionMaker = decisionMaker;
		this.position = position;
		this.phone = phone;
		this.email = email;
		this.requirements = requirements;
		this.nextStep = nextStep;
		this.commercialProposal = commercialProposal;
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
	public int getBusinessLineId() {
		return businessLineId;
	}
	public void setBusinessLineId(int businessLineId) {
		this.businessLineId = businessLineId;
	}
	public int getCurrentBrand() {
		return currentBrand;
	}
	public void setCurrentBrand(int currentBrand) {
		this.currentBrand = currentBrand;
	}
	public String getEquipmentBrand() {
		return equipmentBrand;
	}
	public void setEquipmentBrand(String equipmentBrand) {
		this.equipmentBrand = equipmentBrand;
	}
	public int getEquipmentType() {
		return equipmentType;
	}
	public void setEquipmentType(int equipmentType) {
		this.equipmentType = equipmentType;
	}
	public int getEquipmentQty() {
		return equipmentQty;
	}
	public void setEquipmentQty(int equipmentQty) {
		this.equipmentQty = equipmentQty;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getCurrentVendor() {
		return currentVendor;
	}
	public void setCurrentVendor(String currentVendor) {
		this.currentVendor = currentVendor;
	}
	public String getServiceContract() {
		return serviceContract;
	}
	public void setServiceContract(String serviceContract) {
		this.serviceContract = serviceContract;
	}
	public String getSpecialConfig() {
		return specialConfig;
	}
	public void setSpecialConfig(String specialConfig) {
		this.specialConfig = specialConfig;
	}
	public String getRequirementsNeeded() {
		return requirementsNeeded;
	}
	public void setRequirementsNeeded(String requirementsNeeded) {
		this.requirementsNeeded = requirementsNeeded;
	}
	public String getDemo() {
		return demo;
	}
	public void setDemo(String demo) {
		this.demo = demo;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public String getExecutive() {
		return executive;
	}
	public void setExecutive(String executive) {
		this.executive = executive;
	}
	public String getGainFactor() {
		return gainFactor;
	}
	public void setGainFactor(String gainFactor) {
		this.gainFactor = gainFactor;
	}
	public String getDecisionMaker() {
		return decisionMaker;
	}
	public void setDecisionMaker(String decisionMaker) {
		this.decisionMaker = decisionMaker;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPhone() {
		return phone;
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
	public String getRequirements() {
		return requirements;
	}
	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}
	public String getNextStep() {
		return nextStep;
	}
	public void setNextStep(String nextStep) {
		this.nextStep = nextStep;
	}
	public String getCommercialProposal() {
		return commercialProposal;
	}
	public void setCommercialProposal(String commercialProposal) {
		this.commercialProposal = commercialProposal;
	}
	public ArrayList<BrandDTO> getBrandArray() {
		return brandArray;
	}
	public void setBrandArray(ArrayList<BrandDTO> brandArray) {
		this.brandArray = brandArray;
	}
	public String getDeliverBy() {
		return deliverBy;
	}
	public void setDeliverBy(String deliverBy) {
		this.deliverBy = deliverBy;
	}
	public String getLease() {
		return lease;
	}
	public void setLease(String lease) {
		this.lease = lease;
	}
	public String getNextTender() {
		return nextTender;
	}
	public void setNextTender(String nextTender) {
		this.nextTender = nextTender;
	}
	
}
