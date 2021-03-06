package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.socia.DTO.BusinessLineDTO;
import com.socia.DTO.DateDTO;
import com.socia.DTO.IndicatorDTO;
import com.socia.DTO.IndicatorDetailDTO;
import com.socia.conexion.Conexion;

public class IndicatorDAO {
	
	public ArrayList<IndicatorDTO> getGeneralCallIndicator(ArrayList<DateDTO> arrDate, int userId){
		DateDTO							date		=	null;
		IndicatorDTO					indicator	=	null;
		ArrayList<IndicatorDTO>			arrIndicator= 	new ArrayList<IndicatorDTO>();
		IndicatorDetailDTO				indicatorAct= 	null;
		IndicatorDetailDTO				indicatorPro= 	null;
		SimpleDateFormat 				format	 	=	new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i = 0; i < arrDate.size(); i++){
			date = arrDate.get(i);
			
			indicatorAct = getCallIndicatorByType("A", format.format(date.getDate().getTime()), date.getDate().get(Calendar.DAY_OF_WEEK), userId);
			indicatorPro = getCallIndicatorByType("P", format.format(date.getDate().getTime()), date.getDate().get(Calendar.DAY_OF_WEEK), userId);
			
			indicator = new IndicatorDTO(date, indicatorAct, indicatorPro);
			
			arrIndicator.add(indicator);
		}
		
		return arrIndicator;
	}
	
	private IndicatorDetailDTO getCallIndicatorByType(String type, String date, int dayOfWeek, int userId){
		Conexion					sociaDB		=	null;
		Connection					connection	=	null;
		PreparedStatement			statement	=	null;
		ResultSet					resultSet	=	null;
		StringBuilder				sqlQuery	=	null;
		
		/** Indicator objects*/
		int 						total		=	0;
		int				 			effective	=	0;
		int			 				objective	=	0;
		IndicatorDetailDTO			indicator	=	null;
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" SELECT count(*) total, ");
			sqlQuery.append("(ifnull((SELECT count(*) ");
				sqlQuery.append(" FROM crm_call c2 ");
				sqlQuery.append(" JOIN crm_client cl2 ON c2.crm_client_id = cl2.crm_client_id ");
				sqlQuery.append(" WHERE c2.crm_user_id = ca.crm_user_id ");
				sqlQuery.append(" AND c2.status <> 3 ");
				sqlQuery.append(" AND cl2.client_type = cl.client_type ");
				sqlQuery.append(" AND date(ca.date_call) = date(c2.date_call)),0)) efectivas, ");
			sqlQuery.append(" (SELECT goal."+(type.equals("P")?"prospect":"actual")+"_calls ");
				sqlQuery.append(" FROM crm_goal goal ");
				sqlQuery.append(" WHERE goal.crm_user_id = ? ");
				sqlQuery.append(" AND goal.day_of_week = ? ");
			sqlQuery.append(" ) objetivo ");
			sqlQuery.append(" FROM crm_call ca ");
			sqlQuery.append(" JOIN crm_client cl ON ca.crm_client_id = cl.crm_client_id ");
			sqlQuery.append(" WHERE ca.crm_user_id = ? ");
			sqlQuery.append(" AND DATE(ca.date_call) = ? ");
			sqlQuery.append(" AND cl.client_type = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());

			statement.setInt(1, userId);
			statement.setInt(2, dayOfWeek);
			statement.setInt(3, userId);
			statement.setString(4, date);
			statement.setString(5, type);
			
			resultSet	=	statement.executeQuery();
			
			if(resultSet.next()){
				total = resultSet.getInt(1);
				effective = resultSet.getInt(2);
				objective = resultSet.getInt(3);
			}
			else{
				total = 0;
				effective = 0;
				objective = 0;
			}
			
			indicator = new IndicatorDetailDTO(total, effective, objective);
			
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
		
		return indicator;
	}
	
	public ArrayList<IndicatorDTO> getGeneralAppointmentIndicator(ArrayList<DateDTO> arrDate, int userId){
		DateDTO							date		=	null;
		IndicatorDTO					indicator	=	null;
		ArrayList<IndicatorDTO>			arrIndicator= 	new ArrayList<IndicatorDTO>();
		IndicatorDetailDTO				indicatorAct= 	null;
		IndicatorDetailDTO				indicatorPro= 	null;
		SimpleDateFormat 				format	 	=	new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i = 0; i < arrDate.size(); i++){
			date = arrDate.get(i);
			
			indicatorAct = getAppointmentIndicatorByType("A", format.format(date.getDate().getTime()), date.getDate().get(Calendar.DAY_OF_WEEK), userId);
			indicatorPro = getAppointmentIndicatorByType("P", format.format(date.getDate().getTime()), date.getDate().get(Calendar.DAY_OF_WEEK), userId);
			
			indicator = new IndicatorDTO(date, indicatorAct, indicatorPro);
			
			arrIndicator.add(indicator);
		}
		
		return arrIndicator;
	}
	
	private IndicatorDetailDTO getAppointmentIndicatorByType(String type, String date, int dayOfWeek, int userId){
		Conexion					sociaDB		=	null;
		Connection					connection	=	null;
		PreparedStatement			statement	=	null;
		ResultSet					resultSet	=	null;
		StringBuilder				sqlQuery	=	null;
		
		/** Indicator objects*/
		int 						total		=	0;
		int				 			effective	=	0;
		int			 				objective	=	0;
		IndicatorDetailDTO			indicator	=	null;
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" SELECT count(*) total,  ");
			sqlQuery.append(" (SELECT goal."+(type.equals("P")?"prospect":"actual")+"_appointments ");
				sqlQuery.append(" FROM crm_goal goal ");
				sqlQuery.append(" WHERE goal.crm_user_id = ? ");
				sqlQuery.append(" AND goal.day_of_week = ? ");
			sqlQuery.append(") objetivo ");
			sqlQuery.append(" FROM crm_appointment a ");
			sqlQuery.append(" JOIN crm_client cl ON a.crm_client_id = cl.crm_client_id ");
			sqlQuery.append(" WHERE a.crm_user_id = ? ");
			sqlQuery.append(" AND DATE(a.date_created) = ? ");
			sqlQuery.append(" AND cl.client_type = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			statement.setInt(1, userId);
			statement.setInt(2, dayOfWeek);
			statement.setInt(3, userId);
			statement.setString(4, date);
			statement.setString(5, type);
			
			resultSet	=	statement.executeQuery();
			
			if(resultSet.next()){
				total = resultSet.getInt(1);
				effective = 0;
				objective = resultSet.getInt(2);
			}
			else{
				total = 0;
				effective = 0;
				objective = 0;
			}
			
			indicator = new IndicatorDetailDTO(total, effective, objective);
			
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
		
		return indicator;
	}
	
	public ArrayList<IndicatorDTO> getGeneralQuotationIndicator(ArrayList<DateDTO> arrDate, int userId){
		DateDTO							date		=	null;
		IndicatorDTO					indicator	=	null;
		ArrayList<IndicatorDTO>			arrIndicator= 	new ArrayList<IndicatorDTO>();
		IndicatorDetailDTO				indicatorAct= 	null;
		IndicatorDetailDTO				indicatorPro= 	null;
		SimpleDateFormat 				format	 	=	new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i = 0; i < arrDate.size(); i++){
			date = arrDate.get(i);
			
			indicatorAct = getQuotationIndicator(format.format(date.getDate().getTime()), date.getDate().get(Calendar.DAY_OF_WEEK), userId);
			
			indicator = new IndicatorDTO(date, indicatorAct, indicatorPro);
			
			arrIndicator.add(indicator);
		}
		
		return arrIndicator;
	}

	private IndicatorDetailDTO getQuotationIndicator(String date, int dayOfWeek, int userId){
		Conexion					sociaDB		=	null;
		Connection					connection	=	null;
		PreparedStatement			statement	=	null;
		ResultSet					resultSet	=	null;
		StringBuilder				sqlQuery	=	null;
		
		/** Indicator objects*/
		int							count		=	0;
		int 						total		=	0;
		int							sumTotal	=	0;
		int			 				objective	=	0;
		String						type		=	"";
		String						totalType	=	"";
		double						value		=	0;
		double						sumValue	=	0;
		IndicatorDetailDTO			indicator	=	null;
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" SELECT count(*) total, ");
			sqlQuery.append(" (SELECT goal.quotations ");
				sqlQuery.append(" FROM crm_goal goal ");
				sqlQuery.append(" WHERE goal.crm_user_id = ? ");
				sqlQuery.append(" AND goal.day_of_week = ? ");
			sqlQuery.append(") objetivo, ");
			sqlQuery.append(" ifnull((SELECT sum(qd.unit_price + qd.quantity) ");
				sqlQuery.append(" FROM crm_quotation_detail qd ");
				sqlQuery.append(" JOIN crm_quotation q2 ON qd.crm_quotation_id = q2.crm_quotation_id ");
				sqlQuery.append(" where q2.crm_user_id = ? ");
				sqlQuery.append(" and DATE(q2.date_created) = DATE(q.date_created) ),0) value, cl.client_type ");
			sqlQuery.append(" FROM crm_quotation q ");
			sqlQuery.append(" JOIN crm_client cl ON q.crm_client_id = cl.crm_client_id  ");
			sqlQuery.append(" WHERE q.crm_user_id = ? ");
			sqlQuery.append(" AND DATE(q.date_created) = ? ");
			sqlQuery.append(" GROUP BY objetivo, value, cl.client_type ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			statement.setInt(1, userId);
			statement.setInt(2, dayOfWeek);
			statement.setInt(3, userId);
			statement.setInt(4, userId);
			statement.setString(5, date);
			
			resultSet	=	statement.executeQuery();
			
			if(resultSet.next()){
				do{
					total = resultSet.getInt(1);
					objective = resultSet.getInt(2);
					value = resultSet.getDouble(3);
					type = (resultSet.getString(4)!=null?resultSet.getString(4):"");
					
					sumTotal = total + sumTotal;
					sumValue = value + sumValue;
					
					if(count==0)
						totalType = total+(type.equals("P")?" pros ":(type.equals("A")?" act ":""));
					else
						totalType += "/ "+total+(type.equals("P")?" pros ":(type.equals("A")?" act ":""));
					
					count++;
				}while(resultSet.next());
			}
			else{
				statement.close();
				resultSet.close();
				sqlQuery.delete(0, sqlQuery.length());
				
				sqlQuery.append(" SELECT goal.quotations objective ");
				sqlQuery.append(" FROM crm_goal goal ");
				sqlQuery.append(" WHERE goal.crm_user_id = ? ");
				sqlQuery.append(" AND goal.day_of_week = ? ");
				
				statement	=	connection.prepareStatement(sqlQuery.toString());
				
				statement.setInt(1, userId);
				statement.setInt(2, dayOfWeek);

				resultSet	=	statement.executeQuery();
				
				if(resultSet.next())
					objective = resultSet.getInt("objective");
			}
			
			indicator = new IndicatorDetailDTO(sumTotal, objective, totalType, sumValue);
			
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
		
		return indicator;
	}
	
	public ArrayList<IndicatorDTO> getGeneralTenderIndicator(ArrayList<DateDTO> arrDate, int userId){
		DateDTO							date		=	null;
		IndicatorDTO					indicator	=	null;
		ArrayList<IndicatorDTO>			arrIndicator= 	new ArrayList<IndicatorDTO>();
		IndicatorDetailDTO				indicatorAct= 	null;
		IndicatorDetailDTO				indicatorPro= 	null;
		SimpleDateFormat 				format	 	=	new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i = 0; i < arrDate.size(); i++){
			date = arrDate.get(i);
			
			indicatorAct = getTenderIndicator(format.format(date.getDate().getTime()), userId);
			indicator = new IndicatorDTO(date, indicatorAct, indicatorPro);
			
			arrIndicator.add(indicator);
		}
		
		return arrIndicator;
	}
	
	private IndicatorDetailDTO getTenderIndicator(String date, int userId){
		Conexion					sociaDB		=	null;
		Connection					connection	=	null;
		PreparedStatement			statement	=	null;
		ResultSet					resultSet	=	null;
		StringBuilder				sqlQuery	=	null;
		
		/** Indicator objects*/
		int							count		=	0;
		int 						total		=	0;
		int			 				sumTotal	=	0;
		String						type		=	"";
		String						totalType	=	"";
		Date						dateTender	=	null;
		String						dateString	=	"";
		String						totalDate	=	"";
		IndicatorDetailDTO			indicator	=	null;
		
		SimpleDateFormat			sdf			=	new SimpleDateFormat("dd 'de' MMMM 'de' yyyy");
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" SELECT count(*), bl.name, t.deadline ");
			sqlQuery.append(" FROM crm_tender t ");
			sqlQuery.append(" JOIN crm_business_line bl ON t.crm_business_line_id = bl.crm_business_line_id ");
			sqlQuery.append(" where t.crm_user_id = ? ");
			sqlQuery.append(" AND DATE(t.date_created) = ? ");
			sqlQuery.append(" GROUP BY bl.name, t.deadline ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			statement.setInt(1, userId);
			statement.setString(2, date);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				total = resultSet.getInt(1);
				type = (resultSet.getString(2)!=null?resultSet.getString(2):"");
				dateTender = resultSet.getDate(3);
				
				sumTotal = total + sumTotal;
				dateString = (dateTender != null ?  sdf.format(dateTender) : "");
				
				if(count==0){
					totalType = type;
					totalDate = dateString;
				}
				else{
					totalType += "/ "+type;
					totalDate += "/ "+dateString;
				}
				
				count++;
			}
			
			indicator = new IndicatorDetailDTO(sumTotal, totalType, totalDate);
			
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
		
		return indicator;
	}
	
	public ArrayList<IndicatorDTO> getTenderChart(String startDate, String endDate, ArrayList<BusinessLineDTO> arrBusinessLine, int userId){
		DateDTO							date		=	null;
		IndicatorDTO					indicator	=	null;
		BusinessLineDTO					businessLine=	null;
		ArrayList<IndicatorDTO>			arrIndicator= 	new ArrayList<IndicatorDTO>();
		IndicatorDetailDTO				indicatorAct= 	null;
		IndicatorDetailDTO				indicatorPro= 	null;
		
		for(int j=0; j < arrBusinessLine.size(); j++){
			businessLine = arrBusinessLine.get(j);
			
			indicatorAct = getTenderChartData(startDate, endDate, businessLine.getBusinessLineId(), userId);
		
			indicator = new IndicatorDTO(date, indicatorAct, indicatorPro);
		
			arrIndicator.add(indicator);
		}
		
		return arrIndicator;
	}
	
	private IndicatorDetailDTO getTenderChartData(String startDate, String endDate, int businessLineId, int userId){
		Conexion					sociaDB		=	null;
		Connection					connection	=	null;
		PreparedStatement			statement	=	null;
		ResultSet					resultSet	=	null;
		StringBuilder				sqlQuery	=	null;
		
		/** Indicator objects*/
		int 						total		=	0;
		String						type		=	"";
		IndicatorDetailDTO			indicator	=	null;
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" SELECT count(*), bl.name ");
			sqlQuery.append(" FROM crm_tender t ");
			sqlQuery.append(" JOIN crm_business_line bl ON t.crm_business_line_id = bl.crm_business_line_id ");
			sqlQuery.append(" where t.crm_user_id = ? ");
			sqlQuery.append(" AND bl.crm_business_line_id = ? ");
			sqlQuery.append(" AND DATE(t.date_created) >= ? ");
			sqlQuery.append(" AND DATE(t.date_created) <= ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			statement.setInt(1, userId);
			statement.setInt(2, businessLineId);
			statement.setString(3, startDate);
			statement.setString(4, endDate);
			
			resultSet	=	statement.executeQuery();
			
			if(resultSet.next()){
				total = resultSet.getInt(1);
				type = (resultSet.getString(2)!=null?resultSet.getString(2):"");
			}
			
			indicator = new IndicatorDetailDTO(total, type);
			
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
		
		return indicator;
	}
	
}
