package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.socia.DTO.TenderDTO;
import com.socia.conexion.Conexion;

public class TenderDAO {
	
	public ArrayList<StringBuilder> insertTender(TenderDTO tender, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_tender (crm_tender_id, start_up_date, deadline, ");
								sqlQuery.append("requirements, comments, crm_client_id, ");
								sqlQuery.append("crm_user_id, crm_business_line_id, decision_maker, ");
								sqlQuery.append("date_created, current_brand ) ");
		sqlQuery.append(" VALUES ("+tender.getTenderId());
		sqlQuery.append(",'"+tender.getStartUpDate()+"'");
		sqlQuery.append(",'"+tender.getDeadline()+"'");
		sqlQuery.append(",'"+tender.getRequirements()+"'");
		sqlQuery.append(",'"+tender.getComments()+"'");
		sqlQuery.append(","+tender.getClientId());
		sqlQuery.append(","+tender.getUserId());
		sqlQuery.append(","+tender.getBusinessLineId());
		sqlQuery.append(",'"+tender.getDecisionMaker()+"'");
		sqlQuery.append(", now()");
		sqlQuery.append(",'"+tender.getCurrentBrand()+"')");
		
		queries.add(sqlQuery);
    
        return queries;
    }
	


	public List<TenderDTO>	getTenders(){
		List<TenderDTO>		arrTender	=	new	ArrayList<TenderDTO>();
		TenderDTO			tender		= 	null;
		Connection			con			=	null;
		PreparedStatement	ps			=	null;
		ResultSet			rs			=	null;
		Conexion			conexion	=	null;
		StringBuilder		query		=	null;
		String				startUpDate	=	"";
		String				deadLine	=	"";
		String				companyName	=	"";
		String				name		=	"";
		String				date		=	"";
		String				type		=	"";
		
		try{
			query	=	new	StringBuilder();
			query.append(" SELECT t.start_up_date, c.company_name, bl.name, 'Inicio gestión' ");
			query.append(" FROM crm_tender t  ");
			query.append(" JOIN crm_client c ON t.crm_client_id = c.crm_client_id ");
			query.append(" JOIN crm_business_line bl ON t.crm_business_line_id = bl.crm_business_line_id ");
			query.append(" UNION ");
			query.append(" SELECT t.deadline, c.company_name, bl.name, 'Fecha concurso' ");
			query.append(" FROM crm_tender t  ");
			query.append(" JOIN crm_client c ON t.crm_client_id = c.crm_client_id ");
			query.append(" JOIN crm_business_line bl ON t.crm_business_line_id = bl.crm_business_line_id ");
			
			conexion	=	new	Conexion();
			con			=	conexion.getConnection1();
			ps			=	con.prepareStatement(query.toString());
			
			rs	=	ps.executeQuery();
			
			while(rs.next()){
				date	=	rs.getString(1);
				companyName	=	rs.getString(2);
				name		=	rs.getString(3);
				type		=	rs.getString(4);
				
				if(type.equals("Inicio gestión")){
					startUpDate = date.substring(0,10);
					deadLine = null;
				}
				else{
					startUpDate = null;
					deadLine = date.substring(0,10);
				}
				
				tender = new TenderDTO();
				tender.setCompanyName(companyName);
				tender.setBusinessLineName(name);
				tender.setStartUpDate(startUpDate);
				tender.setDeadline(deadLine);
				
				System.out.println(tender.toString());
				
				arrTender.add(tender);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ps.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return arrTender;
	}

}
