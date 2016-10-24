package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.ClientDTO;
import com.socia.conexion.Conexion;

public class ClientDAO {
	
	public ArrayList<ClientDTO> getClients(){
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
		ArrayList<ClientDTO>	clientArr	= 	new ArrayList<ClientDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_client ");
			sqlQuery.append(" where status = 'A' ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				clientId = resultSet.getInt(1);
				companyName = resultSet.getString(2);
				//status
				bdmId = resultSet.getInt(4);
				
				client = new ClientDTO(clientId, companyName, bdmId);
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
				
				client = new ClientDTO(clientId, companyName, bdmId);
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
	
	public static void main(String[] args){
		ClientDAO contact = new ClientDAO();
		System.out.println(contact.getClients().toString());	
	}


}
