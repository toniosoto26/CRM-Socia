package com.socia.DAO;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;

import com.socia.conexion.Conexion;

public class TransactionDAO {

	private Conexion 	sociaDB;
	private Connection	connection;
	
	public void openConnection() throws Exception{
		this.sociaDB	=	new	Conexion();
		this.connection	=	this.sociaDB.getConnection1();
		this.connection.setAutoCommit(false);
	}
	
	public void insertAll(ArrayList<StringBuilder> queries) throws Exception{
		Statement	statement	=	this.connection.createStatement();
		
		for(int index=0; index < queries.size(); index++){
			//System.out.println(queries.get(index).toString());
			statement.execute(replaceTables(queries.get(index).toString().toUpperCase()));
		}

	}
	
	private String replaceTables(String query){
		return query.replaceAll("CRM_ADDRESS", "crm_address")
					.replaceAll("CRM_APPOINTMENT", "crm_appointment")
					.replaceAll("CRM_BL_DETAILS", "crm_bl_details")
					.replaceAll("CRM_BRAND", "crm_brand")
					.replaceAll("CRM_CALL", "crm_call")
					.replaceAll("CRM_CLIENT", "crm_client")
					.replaceAll("CRM_CLIENT_ADDRESS", "crm_client_address")
					.replaceAll("CRM_CLIENT_CONTACT", "crm_client_contact")
					.replaceAll("CRM_COMPANY_DIVISION", "crm_company_division")
					.replaceAll("CRM_CONSECUTIVES", "crm_consecutives")
					.replaceAll("CRM_CONTACT", "crm_contact")
					.replaceAll("CRM_DAYS_OFF", "crm_days_off")
					.replaceAll("CRM_DIAGNOSIS", "crm_diagnosis")
					.replaceAll("CRM_DIRECTORY", "crm_directory")
					.replaceAll("CRM_EQUIPMENT_TYPE", "crm_equipment_type")
					.replaceAll("CRM_GOAL", "crm_goal")
					.replaceAll("CRM_ITEM", "crm_item")
					.replaceAll("CRM_MODEL", "crm_model")
					.replaceAll("CRM_OPPORTUNITIES", "crm_opportunities")
					.replaceAll("CRM_POSITION", "crm_position")
					.replaceAll("CRM_QUOTATION", "crm_quotation")
					.replaceAll("CRM_QUOTATION_DETAILS", "crm_quotation_detail")
					.replaceAll("CRM_REGISTRATION_REQUIREMENT", "crm_registration_requirement")
					.replaceAll("CRM_REG_REQ", "crm_reg_req")
					.replaceAll("CRM_REQUIREMENT", "crm_requirement")
					.replaceAll("CRM_RUN_RATE", "crm_run_rate")
					.replaceAll("CRM_RUN_RATE_TYPE", "crm_run_rate_type")
					.replaceAll("CRM_TENDER", "crm_tender")
					.replaceAll("CRM_USER", "crm_user")
					.replaceAll("CRM_USER_ROLE", "crm_user_role")
					.replaceAll("CRM_USER_USERROLE", "crm_user_userrole");
	}
	
	public void commit() throws Exception{
		this.connection.commit();
	}
	
	public void rollback(){
		try{
			this.connection.rollback();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void closeConnection(){
		try{
			this.connection.close();
		}catch(Exception e){
			e.printStackTrace();	
		}
	}
}
