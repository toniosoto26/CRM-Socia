package com.socia.DAO;

import java.util.ArrayList;

import com.socia.DTO.QuotationDTO;

public class QuotationDAO {
	
	public ArrayList<StringBuilder> insertQuotation(QuotationDTO quotation, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_quotation (crm_quotation_id, crm_address_id, crm_contact_id, ");
									 sqlQuery.append("currency, exchange_rate, crm_user_id) ");
		sqlQuery.append(" VALUES ("+quotation.getQuotationId());
		sqlQuery.append(","+quotation.getAddressId());
		sqlQuery.append(","+quotation.getContactId());
		sqlQuery.append(",'"+quotation.getCurrency()+"'");
		sqlQuery.append(","+quotation.getExchangeRate());
		sqlQuery.append(","+quotation.getUserId()+")");
		
		queries.add(sqlQuery);
    
        return queries;
    }
	
}
