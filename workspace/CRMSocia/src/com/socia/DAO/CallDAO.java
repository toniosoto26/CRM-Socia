package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;
import com.socia.DTO.AddressDTO;
import com.socia.DTO.CallDTO;
import com.socia.conexion.Conexion;



public class CallDAO {
	
	public  CallDAO(){
	}
	
	public ArrayList<StringBuilder> insertNewCall(CallDTO calls, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_call (crm_call_id, comments, crm_client_id, crm_user_id, crm_contact_id,date_call,status,letter)");
		sqlQuery.append(" VALUES ("+calls.getId_call());
		sqlQuery.append(",'"+calls.getComments()+"'");
		sqlQuery.append(","+calls.getCrm_client_id());
		sqlQuery.append(","+calls.getCrm_user_id());
		sqlQuery.append(","+calls.getCrm_contact_id());
		sqlQuery.append(",Now(),"+calls.getStatus());
		sqlQuery.append(","+calls.getLetter()+")");
		
		queries.add(sqlQuery);
    
        return queries;
    }

	
	 public boolean insertCall(String us) throws SQLException{
		 	Conexion lobjConexion   = null;
	        Connection   lcnnConexion  = null;
	        PreparedStatement lobjPrepared = null;
	        String lstrConsulta="";

	        try{

	                try{
	                    lobjConexion   = new Conexion();
	                    lcnnConexion  = lobjConexion.getConnection1();
	                    lcnnConexion.setAutoCommit(false);
	                    

	                    lstrConsulta   = "INSERT INTO crm_call (crm_call_id, comments, crm_client_id, crm_user_id, crm_contact_id) VALUES (?,?,?,?,?)";

	                    lobjPrepared   = lcnnConexion.prepareStatement(lstrConsulta);


	                    lobjPrepared.setInt(1,1);
	                    lobjPrepared.setString(2,"prueba");
	                    lobjPrepared.setInt(3,1);
	                    lobjPrepared.setInt(4,1);
	                    lobjPrepared.setInt(5,1);

	                    lobjPrepared.execute();
	                    lobjPrepared.close();

	                    lcnnConexion.commit();
	                    System.out.println("insertado correctamente");

	                }catch(Exception e){
	                	lcnnConexion.rollback();
	                	lcnnConexion.close();
	                    throw new SQLException(e.getMessage());
	                }
	            
	        }catch(Exception e){
	            throw new SQLException(e.getMessage());
	        }
	    
	        return true;
	    }
	 
	 public int getCountCallClient(int clientId){
			Conexion			sociaDB		=	null;
			Connection			connection	=	null;
			PreparedStatement	statement	=	null;
			ResultSet			resultSet	=	null;
			StringBuilder		sqlQuery	=	null;
			
			int countCall=0;

			
			try{
				sqlQuery	=	new	StringBuilder();
				sqlQuery.append(" select count(crm_client_id) from crm_call where crm_client_id=?");

				sociaDB		=	new	Conexion();
				connection	=	sociaDB.getConnection1();
				statement	=	connection.prepareStatement(sqlQuery.toString());
				statement.setInt(1, clientId);
				
				resultSet	=	statement.executeQuery();
				
				if(resultSet.next()){
					countCall = resultSet.getInt(1);
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
			
			return countCall;
		}
	 
	 

		public static void main(String args[]){
			new CallDAO();
		}
	
	
	
}
