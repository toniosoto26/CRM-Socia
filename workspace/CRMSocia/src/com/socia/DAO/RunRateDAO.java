package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.socia.DTO.BlDetailsDTO;
import com.socia.DTO.BusinessLineDTO;
import com.socia.DTO.DateDTO;
import com.socia.DTO.IndicatorDTO;
import com.socia.DTO.IndicatorDetailDTO;
import com.socia.DTO.RunRateDTO;
import com.socia.DTO.RunRateDetailDTO;
import com.socia.DTO.RunRateTypeDTO;
import com.socia.conexion.Conexion;

public class RunRateDAO {
	
	public ArrayList<RunRateDTO> getRunRates(ArrayList<RunRateTypeDTO> arrRunRateType, int clientId){
		RunRateDTO				runRate			=	null;
		RunRateTypeDTO			runRateType		=	null;
		RunRateDetailDTO		runRateDetail	=	null;
		ArrayList<RunRateDTO>	arrRunRate		= 	new ArrayList<RunRateDTO>();
		
		for(int i = 0; i < arrRunRateType.size(); i++){
			runRateType = arrRunRateType.get(i);
			
			runRateDetail = getRunRateDetail(clientId, runRateType.getRunRateTypeId());
			runRate = new RunRateDTO(runRateType.getName(), runRateDetail);
			
			arrRunRate.add(runRate);
		}
		
		return arrRunRate;
	}
	
	private RunRateDetailDTO getRunRateDetail(int clientId, int runRateTypeId){
		Conexion			sociaDB			=	null;
		Connection			connection		=	null;
		PreparedStatement	statement		=	null;
		ResultSet			resultSet		=	null;
		StringBuilder		sqlQuery		=	null;
		
		/** Run rate detail objects*/
		RunRateDetailDTO	runRateDetail	=	new RunRateDetailDTO();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" SELECT rr.* ");
			sqlQuery.append(" FROM crm_run_rate rr ");
			sqlQuery.append(" JOIN crm_diagnosis d on rr.crm_diagnosis_id = d.crm_diagnosis_id ");
			sqlQuery.append(" WHERE rr.crm_client_id = ? ");
			sqlQuery.append(" AND rr.crm_run_rate_type_id = ? ");
			sqlQuery.append(" ORDER BY d.date_updated ASC ");
			sqlQuery.append(" LIMIT 1 ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, clientId);
			statement.setInt(2, runRateTypeId);
			
			resultSet	=	statement.executeQuery();
			
			if(resultSet.next()){
				runRateDetail.setRunRateId(resultSet.getInt("crm_run_rate_id"));
				runRateDetail.setDiagnosisId(resultSet.getInt("crm_diagnosis_id"));
				runRateDetail.setClientId(clientId);
				runRateDetail.setRunRateTypeId(runRateTypeId);
				runRateDetail.setModelId(resultSet.getInt("crm_model_id"));
				runRateDetail.setBrandId(resultSet.getInt("crm_brand_id"));
				runRateDetail.setQty(resultSet.getInt("qty"));
				runRateDetail.setFrequency(resultSet.getString("frequency"));
				runRateDetail.setOther(resultSet.getString("other"));
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
		
		return runRateDetail;
	}
	
}
