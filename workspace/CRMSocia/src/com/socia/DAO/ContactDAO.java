package com.socia.DAO;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.socia.DTO.ContactDTO;
import com.socia.conexion.Conexion;

public class ContactDAO {
	
	public ArrayList<ContactDTO> getContactsByClient(int clientId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Contact objects*/
		ContactDTO				contact		=	null;
		int						contactId	=	0;
		String 					firstName	=	"";
		String 					lastName	=	"";
		String 					phone		=	"";
		String 					email		=	"";
		ArrayList<ContactDTO>	contactArr	= 	new ArrayList<ContactDTO>();
		
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
				contactId = resultSet.getInt(1);
				firstName = resultSet.getString(2);
				lastName = resultSet.getString(3);
				phone = resultSet.getString(4);
				email = resultSet.getString(5);
				
				contact = new ContactDTO(contactId, firstName, lastName, phone, email);
				contactArr.add(contact);
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
		
		return contactArr;
	}
	
	public static void main(String[] args){
		ContactDAO contact = new ContactDAO();
		System.out.println(contact.getContactsByClient(1).toString());	
	}

}
