package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	
	public ArrayList<ClientDTO> getClientsDiag(String typeD){
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
			sqlQuery.append(" and client_type = ? ");
			//sqlQuery.append(" and crm_user_id = ? ");
		 
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setString(1, typeD);
			//statement.setInt(2, userId);
			
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
	
	public	List<ClientDTO>	getClientDetails(int clientId, Connection con){
		
		List<ClientDTO>	lst	=	new	ArrayList<ClientDTO>();
		
		PreparedStatement	ps	=	null;
		ResultSet			rs	=	null;
		
		StringBuilder		sql	=	new	StringBuilder();
		
		ClientDTO			cl	=	null;
		
		try{
			
			sql.delete(0, sql.length());
			sql.append(" select	c.company_name ");
			sql.append(" ,CONCAT(c.street,' ',c.ext_num)direc");
			sql.append(" ,IFNULL(c.phone,'Sin registro') phone");
			sql.append(" ,IFNULL(c.business_turn, 'Sin registro') business_turn");
			sql.append(" ,IFNULL(c.employees,0 ) employees");
			sql.append(" ,IFNULL(c.annual_sales,0.00) annual_sales");
			sql.append(" ,IFNULL(c.website,'Sin registro') website ");
			sql.append(" from crm_client c ");
			sql.append(" where c.crm_client_id = ? ");
			

			ps	=	con.prepareStatement(sql.toString());
			ps.setInt(1, clientId);
			
			rs	=	ps.executeQuery();
			
			if(rs.next()){
				cl	=	new ClientDTO();
				
				cl.setClientId(clientId);
				cl.setCompanyName(rs.getString("company_name"));
				cl.setStreet(rs.getString("direc"));
				cl.setPhone(rs.getString("phone"));
				cl.setBussinesTurn(rs.getString("business_turn"));
				cl.setEmployees(rs.getInt("employees"));
				cl.setAnnualSales(rs.getDouble("annual_sales"));
				cl.setWebSite(rs.getString("website"));
				
				lst.add(cl);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return	lst;
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
