package com.socia.DAO;

import java.sql.Connection;
import java.sql.CallableStatement;

import com.socia.conexion.Conexion;

public class ConsecutiveDAO {

	public int getConsecutive(String concept){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		CallableStatement	statement	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Consecutive objects*/
		int						consecutive		=	0;
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" { call getConsecutive(?,?) } ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareCall(sqlQuery.toString());
			statement.setString(1, concept);
	        statement.registerOutParameter(2, java.sql.Types.INTEGER);
			
			statement.execute();
			
			consecutive = statement.getInt(2);
			
		}catch(Exception exception){
			exception.printStackTrace();
		}finally{
			try{
				statement.close();
				connection.close();
			}catch(Exception closeException){
				closeException.printStackTrace();
			}
		}
		
		return consecutive;
	}
	
	public static void main(String[] args){
		ConsecutiveDAO contact = new ConsecutiveDAO();
		System.out.println(contact.getConsecutive("clients"));	
	}
	
}
