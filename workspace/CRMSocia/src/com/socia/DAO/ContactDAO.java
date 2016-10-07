package com.socia.DAO;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.socia.conexion.Conexion;

public class ContactDAO {
	
	public String getContactsByClient(int clientId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select contact.* ");
			sqlQuery.append(" from crm_contact contact ");
			sqlQuery.append(" join crm_mvs_contact mvs on contact.crm_contact_id = mvs.crm_contact_id ");
			sqlQuery.append(" join crm_client client on mvs.crm_client_id = client.crm_client_id ");
			sqlQuery.append(" where contact.status = 'A' ");
			sqlQuery.append(" and client.crm_client_id = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, clientId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				System.out.println(resultSet.getString(1));
				System.out.println(resultSet.getString(2));
				System.out.println(resultSet.getString(3));
				System.out.println(resultSet.getString(4));
				System.out.println(resultSet.getString(5));
				//System.out.println(resultSet.getString(6)); //status
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
		
		return "";
	}
	
	public static void main(String[] args){
		ContactDAO contact = new ContactDAO();
		contact.getContactsByClient(1);
		
	}

}
