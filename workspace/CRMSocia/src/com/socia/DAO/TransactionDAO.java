package com.socia.DAO;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;

import com.socia.conexion.Conexion;

public class TransactionDAO {

	private Conexion 	sociaDB;
	private Connection	connection;
	
	public void openConnection() throws Exception{
		this.sociaDB	=	new	Conexion();
		this.connection	=	this.sociaDB.getConnection1();
		this.connection.setAutoCommit(false);
	}
	
	public void insertAll(ArrayList<StringBuilder> queries) throws Exception{
		Statement	statement	=	this.connection.createStatement();
		
		for(int index=0; index < queries.size(); index++){
			System.out.println(queries.get(index).toString());
			statement.execute(queries.get(index).toString());
		}

	}
	
	public void commit() throws Exception{
		this.connection.commit();
	}
	
	public void rollback(){
		try{
			this.connection.rollback();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void closeConnection(){
		try{
			this.connection.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
