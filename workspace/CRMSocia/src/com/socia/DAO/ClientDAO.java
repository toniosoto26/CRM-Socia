package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.CallDTO;
import com.socia.DTO.ClientDTO;
import com.socia.conexion.Conexion;

public class ClientDAO {
	
	public ArrayList<ClientDTO> getClients(int userId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Client objects*/
		ClientDTO				client		=	null;
		int						clientId	=	0;
		String 					companyName	=	"";
		int 					bdmId		=	0;
		String					clientType	=	"";
		ArrayList<ClientDTO>	clientArr	= 	new ArrayList<ClientDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_client ");
			sqlQuery.append(" where status = 'A' ");
			sqlQuery.append(" and crm_user_id = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, userId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				clientId = resultSet.getInt(1);
				companyName = resultSet.getString(2);
				//status
				bdmId = resultSet.getInt(4);
				//date_created
				clientType = resultSet.getString(6);
				
				client = new ClientDTO(clientId, companyName, bdmId, clientType);
				clientArr.add(client);
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
		
		return clientArr;
	}
	
	public ClientDTO getClientById(int clientId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Client objects*/
		ClientDTO				client		=	null;
		String 					companyName	=	"";
		String					clientType	=	"";
		int 					bdmId		=	0;
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_client ");
			sqlQuery.append(" where status = 'A' ");
			sqlQuery.append(" and crm_client_id = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, clientId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				clientId = resultSet.getInt(1);
				companyName = resultSet.getString(2);
				//status
				bdmId = resultSet.getInt(4);
				//date_created
				clientType = resultSet.getString(6);
				
				client = new ClientDTO(clientId, companyName, bdmId, clientType);
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
		
		return client;
	}
	
	
	public ArrayList<StringBuilder> insertNewClient(ClientDTO clients, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_client (crm_client_id, company_name, crm_bdm_id, status, crm_user_id)");
		sqlQuery.append(" VALUES ("+clients.getClientId());
		sqlQuery.append(",'"+clients.getCompanyName()+"'");
		sqlQuery.append(","+clients.getBdmId());
		sqlQuery.append(",'A'");
		sqlQuery.append(","+clients.getUserId()+")");
		
		queries.add(sqlQuery);
    
        return queries;
    }
	
	public ArrayList<StringBuilder> insertClientContact(int client_id,int contact_id, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_client_contact (crm_client_id, crm_contact_id)");
		sqlQuery.append(" VALUES ("+client_id);
		sqlQuery.append(","+contact_id+")");
		
		queries.add(sqlQuery);
    
        return queries;
    }

	
	public static void main(String[] args){
		ClientDAO contact = new ClientDAO();
		System.out.println(contact.getClients(2).toString());	
	}


}
