package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.RunRateTypeDTO;
import com.socia.conexion.Conexion;

public class RunRateTypeDAO {

	public ArrayList<RunRateTypeDTO> getRunRateTypes(){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/**  Run rate type objects*/
		RunRateTypeDTO				runRateType		=	null;
		int							runRateTypeId	=	0;
		String 						name			=	"";
		ArrayList<RunRateTypeDTO>	arrRunRateType	= 	new ArrayList<RunRateTypeDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_run_rate_type ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				runRateTypeId = resultSet.getInt("crm_run_rate_type_id");
				name = resultSet.getString("name");
				
				runRateType = new RunRateTypeDTO(runRateTypeId, name);
				arrRunRateType.add(runRateType);
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
		
		return arrRunRateType;
	}
	
}
