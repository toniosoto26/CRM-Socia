package com.socia.DAO;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import com.socia.DTO.ContactDTO;
import com.socia.DTO.DivisionDTO;
import com.socia.DTO.PositionDTO;
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
		int						divisionId	=	0;
		int						positionId	=	0;
		String 					firstName	=	"";
		String 					lastName	=	"";
		String 					phone		=	"";
		String 					email		=	"";
		String 					division	=	"";
		String 					position	=	"";
		ArrayList<ContactDTO>	contactArr	= 	new ArrayList<ContactDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select contact.crm_contact_id, contact.first_name,contact.last_name,contact.phone, ");
			sqlQuery.append(" contact.email,contact.id_position,contact.company_division_id, ");
			sqlQuery.append(" division.name,position.position   ");
			sqlQuery.append(" from crm_contact contact join crm_mvs_contact mvs on contact.crm_contact_id = mvs.crm_contact_id ");
			sqlQuery.append(" join crm_client client on mvs.crm_client_id = client.crm_client_id  ");
			sqlQuery.append(" join  crm_position position on contact.id_position=position.id_position ");
			sqlQuery.append(" join  crm_company_division division on contact.company_division_id=division.company_division_id ");
			sqlQuery.append(" where contact.status = 'A' ");
			//sqlQuery.append(" and client.crm_client_id = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			//statement.setInt(1, clientId);
			
			resultSet	=	statement.executeQuery();
			System.out.println("cliente :"+clientId);
			while(resultSet.next()){
				contactId = resultSet.getInt(1);
				firstName = resultSet.getString(2);
				lastName = resultSet.getString(3);
				phone = resultSet.getString(4);
				email = resultSet.getString(5);
				positionId = resultSet.getInt(6);
				divisionId = resultSet.getInt(7);
				division = resultSet.getString(8);
				position = resultSet.getString(9);
				
				
				contact = new ContactDTO(contactId, firstName, lastName, phone, email,divisionId,division,positionId,position);
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
	
	public ContactDTO getContactsById(int contactId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Contact objects*/
		ContactDTO				contact		=	null;
		String 					firstName	=	"";
		String 					lastName	=	"";
		String 					phone		=	"";
		String 					email		=	"";
		int 					company_division_id;
		String 					division		=	"";
		int 					id_position;
		String 					position		=	"";


		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select c.crm_contact_id,c.first_name,c.last_name,c.email,c.phone,d.name,p.position,  ");
			sqlQuery.append(" d.company_division_id, p.id_position");
			sqlQuery.append(" from crm_contact c, crm_position p, crm_company_division d  ");
			sqlQuery.append(" where c.company_division_id=d.company_division_id ");
			sqlQuery.append(" and c.id_position=p.id_position and c.crm_contact_id =?");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, contactId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				contactId = resultSet.getInt(1);
				firstName = resultSet.getString(2);
				lastName = resultSet.getString(3);
				email = resultSet.getString(4);
				phone = resultSet.getString(5);
				division = resultSet.getString(6);
				position = resultSet.getString(7);
				company_division_id = resultSet.getInt(8);
				id_position =resultSet.getInt(9);
				
				contact = new ContactDTO(contactId, firstName, lastName, phone, email,company_division_id,division,id_position,position);
				
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
		
		return contact;
	}
	

	public ArrayList<StringBuilder> insertNewContact(ContactDTO contacts, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_contact (crm_contact_id, first_name,last_name,phone,email,status,date_created,id_position,company_division_id)");
		sqlQuery.append(" VALUES ("+contacts.getContactId());
		sqlQuery.append(",'"+contacts.getFirstName()+"'");
		sqlQuery.append(",'"+contacts.getLastName()+"'");
		sqlQuery.append(",'"+contacts.getPhone()+"'");
		sqlQuery.append(",'"+contacts.getEmail()+"'");
		sqlQuery.append(",'A'");
		sqlQuery.append(", Now(),"+contacts.getId_position());
		sqlQuery.append(","+contacts.getCompany_division_id()+")");
		
		
		queries.add(sqlQuery);
    
        return queries;
    }
	
	
	public static void main(String[] args){
		ContactDAO contact = new ContactDAO();
		System.out.println(contact.getContactsByClient(1).toString());	
	}

}
