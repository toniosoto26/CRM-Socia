package com.socia.DAO;

import java.util.ArrayList;

import com.socia.DTO.BlDetailsDTO;

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

}
