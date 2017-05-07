package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.BlDetailsDTO;
import com.socia.conexion.Conexion;

public class BlDetailsDAO {
	public ArrayList<StringBuilder> insertQuotationDetails(ArrayList<BlDetailsDTO> blDetail, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
		for(int index=0; index < blDetail.size(); index++)
		{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" INSERT INTO crm_bl_details (crm_daignosis_id, crm_client_id, crm_business_line_id, currentBrand, ");
										 sqlQuery.append("equipmentBrand, equipmentType, equipmentQty, unitPrice, currentVendor, ");
										 sqlQuery.append("serviceContract, specialConfig, requirementsNeeded, demo, sales, ");
										 sqlQuery.append("executive, gainFactor, decisionMaker, position, phone, email, ");
										 sqlQuery.append("requirements, nextStep, commercialProposal) ");

			sqlQuery.append(" VALUES ("+blDetail.get(index).getDiagnosisId());
			sqlQuery.append(","+ blDetail.get(index).getClientId());
			sqlQuery.append(","+ blDetail.get(index).getBusinessLineId());
			sqlQuery.append(","+ blDetail.get(index).getCurrentBrand());
			sqlQuery.append(", '"+blDetail.get(index).getEquipmentBrand()+"'");
			sqlQuery.append(","+ blDetail.get(index).getEquipmentType());
			sqlQuery.append(","+ blDetail.get(index).getEquipmentQty());
			sqlQuery.append(","+ blDetail.get(index).getUnitPrice());
			sqlQuery.append(",'"+blDetail.get(index).getCurrentVendor()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getServiceContract()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getSpecialConfig()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getRequirementsNeeded()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getDemo()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getSales()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getExecutive()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getGainFactor()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getDecisionMaker()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getPosition()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getPhone()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getEmail()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getRequirements()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getNextStep()+"'");
			sqlQuery.append(",'"+blDetail.get(index).getCommercialProposal()+"')");
											
			queries.add(sqlQuery);
		}
    
        return queries;
    }
	
	public BlDetailsDTO getBusinessLineDetails(int clientId, int businessLineId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Equipment type objects*/
		BlDetailsDTO		businessLineDetails	=	new BlDetailsDTO();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" SELECT bl.* ");
			sqlQuery.append(" FROM crm_bl_details bl ");
			sqlQuery.append(" JOIN crm_diagnosis d on bl.crm_diagnosis_id = d.crm_diagnosis_id ");
			sqlQuery.append(" WHERE bl.crm_client_id = ? ");
			sqlQuery.append(" AND d.crm_business_line_id = ? ");
			sqlQuery.append(" ORDER BY d.date_updated ASC ");
			sqlQuery.append(" LIMIT 1 ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, clientId);
			statement.setInt(2, businessLineId);
			
			resultSet	=	statement.executeQuery();
			
			if(resultSet.next()){
				businessLineDetails.setDiagnosisId(resultSet.getInt("crm_diagnosis_id"));
				businessLineDetails.setCurrentBrand(resultSet.getInt("currentBrand"));
				businessLineDetails.setEquipmentBrand(resultSet.getString("equipmentBrand"));
				businessLineDetails.setEquipmentType(resultSet.getInt("equipmentType"));
				businessLineDetails.setEquipmentQty(resultSet.getInt("equipmentQty"));
				businessLineDetails.setUnitPrice(resultSet.getDouble("unitPrice"));
				businessLineDetails.setCurrentVendor(resultSet.getString("currentVendor"));
				businessLineDetails.setServiceContract(resultSet.getString("serviceContract"));
				businessLineDetails.setSpecialConfig(resultSet.getString("specialConfig"));
				businessLineDetails.setDeliverBy(resultSet.getString("deliverBy"));
				businessLineDetails.setLease(resultSet.getString("lease"));
				businessLineDetails.setNextTender(resultSet.getString("nextTender"));
				businessLineDetails.setRequirementsNeeded(resultSet.getString("requirementsNeeded"));
				businessLineDetails.setDemo(resultSet.getString("demo"));
				businessLineDetails.setSales(resultSet.getString("sales"));
				businessLineDetails.setExecutive(resultSet.getString("executive"));
				businessLineDetails.setGainFactor(resultSet.getString("gainFactor"));
				businessLineDetails.setDecisionMaker(resultSet.getString("decisionMaker"));
				businessLineDetails.setPosition(resultSet.getString("position"));
				businessLineDetails.setPhone(resultSet.getString("phone"));
				businessLineDetails.setEmail(resultSet.getString("email"));
				businessLineDetails.setRequirements(resultSet.getString("requirements"));
				businessLineDetails.setNextStep(resultSet.getString("nextStep"));
				businessLineDetails.setCommercialProposal(resultSet.getString("commercialProposal"));
			}
			businessLineDetails.setClientId(clientId);
			businessLineDetails.setBusinessLineId(businessLineId);
			
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
		
		return businessLineDetails;
	}

}
