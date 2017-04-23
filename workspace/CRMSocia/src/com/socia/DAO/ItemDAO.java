package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.ItemDTO;
import com.socia.conexion.Conexion;

public class ItemDAO {
	
	public ArrayList<ItemDTO> getItems(){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Item objects*/
		ItemDTO				item		=	null;
		String				itemId		=	"";
		String 				description	=	"";
		String	 			unit		=	"";
		String		 		currency	=	"";
		double 				tax			=	0;
		double	 			lastPrice	=	0;
		ArrayList<ItemDTO>	arrItem		= 	new ArrayList<ItemDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_item ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				itemId = resultSet.getString(1);
				description = (resultSet.getString(2)!= null ? resultSet.getString(2) : "")+(resultSet.getString(3)!= null ? resultSet.getString(3) : "");
				unit = resultSet.getString(4);
				currency = resultSet.getString(5);
				tax = resultSet.getDouble(6);
				lastPrice = resultSet.getDouble(7);
				
				item = new ItemDTO(itemId, description, unit, currency, tax, lastPrice);
				arrItem.add(item);
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
		
		return arrItem;
	}
	
	public ItemDTO getItemById(String itemId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Contact objects*/
		ItemDTO	item		=	null;
		String 	description	=	"";
		String 	unit		=	"";
		String 	currency	=	"";
		double 	tax			=	0;
		double 	lastPrice	=	0;

		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select item.* ");
			sqlQuery.append(" from crm_item item ");
			sqlQuery.append(" where  item.crm_item_id = ?");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setString(1, itemId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				description = (resultSet.getString(2)!= null ? resultSet.getString(2) : "")+(resultSet.getString(3)!= null ? resultSet.getString(3) : "");
				unit = resultSet.getString(4);
				currency = resultSet.getString(5);
				tax = resultSet.getDouble(6);
				lastPrice = resultSet.getDouble(7);
				
				item = new ItemDTO(itemId, description, unit, currency, tax, lastPrice);
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
		
		return item;
	}


	public ArrayList<StringBuilder> insertNewItem(ItemDTO item, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_item (crm_item_id, description_1, description_2, unit, currency, tax, last_price)");
		sqlQuery.append(" VALUES ('"+item.getItemId()+"'");
		sqlQuery.append(",'"+(item.getDescription().length() >= 255 ? item.getDescription().substring(0,254) : item.getDescription())+"'");
		sqlQuery.append(",'"+(item.getDescription().length() >= 255 ? item.getDescription().substring(255,item.getDescription().length()) : "")+"'");
		sqlQuery.append(",'"+item.getUnit()+"'");
		sqlQuery.append(",'"+item.getCurrency()+"'");
		sqlQuery.append(","+item.getTax());
		sqlQuery.append(","+item.getLastPrice()+")");
		
		queries.add(sqlQuery);
    
        return queries;
    }
	
}
