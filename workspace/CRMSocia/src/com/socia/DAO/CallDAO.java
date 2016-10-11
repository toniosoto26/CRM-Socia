package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;
import com.socia.DTO.CallDTO;
import com.socia.conexion.Conexion;



public class CallDAO {
	
	public  CallDAO(){
		try{
			this.insertCall("");
		}catch(Exception a ){
			 System.out.println("error al insertar registro");
		}
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

		public static void main(String args[]){
			new CallDAO();
		}
	
	
	
}
