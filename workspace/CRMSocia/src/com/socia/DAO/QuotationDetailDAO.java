package com.socia.DAO;

import java.util.ArrayList;

import com.socia.DTO.QuotationDetailDTO;

public class QuotationDetailDAO {

	public ArrayList<StringBuilder> insertQuotationDetails(ArrayList<QuotationDetailDTO> quotationDetail, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
		for(int index=0; index < quotationDetail.size(); index++)
		{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" INSERT INTO crm_quotation_detail (crm_quotation_id, crm_item_id, warranty, unit_price, ");
										 sqlQuery.append("margin, quantity, estimatedShipping) ");

			sqlQuery.append(" VALUES ("+quotationDetail.get(index).getQuotationId());
			sqlQuery.append(", '"+quotationDetail.get(index).getItemId()+"'");
			sqlQuery.append(",'"+quotationDetail.get(index).getWarranty()+"'");
			sqlQuery.append(","+ quotationDetail.get(index).getUnitPrice());
			sqlQuery.append(","+ quotationDetail.get(index).getMargin());
			sqlQuery.append(","+quotationDetail.get(index).getQuantity());
			sqlQuery.append(",'"+quotationDetail.get(index).getEstimatedShipping()+"')");
											
			queries.add(sqlQuery);
		}
    
        return queries;
    }
}
