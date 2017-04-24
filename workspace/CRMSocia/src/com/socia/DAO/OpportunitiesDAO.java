package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.socia.DTO.OpportunitiesDTO;
import com.socia.conexion.Conexion;

public class OpportunitiesDAO {
	
	public OpportunitiesDTO getOpportunities(int clientId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Equipment type objects*/
		OpportunitiesDTO	opportunities	=	new OpportunitiesDTO();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" SELECT o.* ");
			sqlQuery.append(" FROM crm_opportunities o ");
			sqlQuery.append(" JOIN crm_diagnosis d on o.crm_diagnosis_id = d.crm_diagnosis_id ");
			sqlQuery.append(" WHERE o.crm_client_id = ? ");
			sqlQuery.append(" ORDER BY d.date_updated ASC ");
			sqlQuery.append(" LIMIT 1 ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, clientId);
			
			resultSet	=	statement.executeQuery();
			
			if(resultSet.next()){
				opportunities.setDiagnosisId(resultSet.getInt("crm_diagnosis_id"));
				opportunities.setClientId(clientId);
				opportunities.setComments(resultSet.getString("comments"));
				opportunities.setNextStep(resultSet.getString("next_step"));
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
		
		return opportunities;
	}

}
