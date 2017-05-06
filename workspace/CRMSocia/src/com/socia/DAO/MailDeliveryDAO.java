package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.socia.DTO.MailDeliveryDTO;
import com.socia.conexion.Conexion;

public class MailDeliveryDAO {
	
	public MailDeliveryDTO getMailById(int mailDeliveryId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Mail objects*/
		String				email		=	"";
		String 				password	=	"";
		MailDeliveryDTO		mail		=	null;
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_mail_delivery ");
			sqlQuery.append(" WHERE crm_mail_delivery_id = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, mailDeliveryId);
			
			resultSet	=	statement.executeQuery();
			
			if(resultSet.next()){
				email = resultSet.getString("email");
				password = resultSet.getString("password");
				
				mail = new MailDeliveryDTO(mailDeliveryId, email, password);
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
		
		return mail;
	}

}
