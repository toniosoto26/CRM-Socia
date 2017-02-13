package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.socia.DTO.AppointmentLogDTO;
import com.socia.DTO.TenderDTO;
import com.socia.DTO.TenderLogDTO;
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
		int					tenderId	=	0;
		
		try{
			query	=	new	StringBuilder();
			query.append(" SELECT t.start_up_date, c.company_name, bl.name, 'Inicio gestión', t.crm_tender_id ");
			query.append(" FROM crm_tender t  ");
			query.append(" JOIN crm_client c ON t.crm_client_id = c.crm_client_id ");
			query.append(" JOIN crm_business_line bl ON t.crm_business_line_id = bl.crm_business_line_id ");
			query.append(" UNION ");
			query.append(" SELECT t.deadline, c.company_name, bl.name, 'Fecha concurso', t.crm_tender_id ");
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
				tenderId	=	rs.getInt("crm_tender_id");
				
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
				tender.setTenderId(tenderId);
				
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
	
	public ArrayList<TenderLogDTO> getTenderLog(String fechaIni,String fechaFin,int userId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Tender objects*/
		Date					date			= null;
		String		 			companyName		= "";
		String				 	businessLine	= "";
		String	 				brand			= "";
		String					comments		= "";
		Date					deadline		= null;
		TenderLogDTO			tender			=	null;
		ArrayList<TenderLogDTO>	arrTender		= 	new ArrayList<TenderLogDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select ten.start_up_date, cli.company_name, bl.name, ten.current_brand, ten.comments, deadline  ");
			sqlQuery.append(" from crm_tender ten, crm_client cli, crm_business_line bl ");
			sqlQuery.append(" where ten.crm_client_id=cli.crm_client_id ");
			sqlQuery.append(" and ten.crm_business_line_id = bl.crm_business_line_id ");
			sqlQuery.append(" and DATE(ten.start_up_date) >= ? ");
			sqlQuery.append(" and DATE(ten.start_up_date) <= ? ");
			sqlQuery.append(" and ten.crm_user_id = ? ");
			sqlQuery.append(" order by ten.start_up_date ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			statement.setString(1, fechaIni);
			statement.setString(2, fechaFin);
			statement.setInt(3, userId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				date = resultSet.getDate(1);
				companyName=resultSet.getString(2);
				businessLine = resultSet.getString(3);
				brand = resultSet.getString(4);
				comments = resultSet.getString(5);
				deadline = resultSet.getDate(6);
				
				tender = new TenderLogDTO(date, companyName, businessLine, brand, comments, deadline);
				
				arrTender.add(tender);
			}
			
		}catch(Exception exception){
			exception.printStackTrace();
		}finally{
			try{
				resultSet.close();
				statement.close();
				connection.close();
			}catch(Exception closeException){
				closeException.printStackTrace();
			}
		}
		
		return arrTender;
	}

}
