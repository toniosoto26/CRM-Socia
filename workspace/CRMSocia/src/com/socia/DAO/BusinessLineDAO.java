package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.BusinessLineDTO;
import com.socia.conexion.Conexion;

public class BusinessLineDAO {

	public ArrayList<BusinessLineDTO> getBusinessLines(){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Business lines objects*/
		BusinessLineDTO				businessLine	=	null;
		int							businessLineId	=	0;
		String 						name			=	"";
		ArrayList<BusinessLineDTO>	arrBusinessLine	= 	new ArrayList<BusinessLineDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_business_line ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				businessLineId = resultSet.getInt(1);
				name = resultSet.getString(2);
				
				businessLine = new BusinessLineDTO(businessLineId, name);
				arrBusinessLine.add(businessLine);
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
		
		return arrBusinessLine;
	}
	
}
