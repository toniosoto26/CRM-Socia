package com.socia.conexion;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class Conexion {

	private	String	user;
	private	String	pass;
	private	String	db;
	
	public Conexion(){
		this.user	=	"crmsocia_admin";
		this.pass	=	"CRMconnectiSoci@";
		this.db		=	"crmsocia_socia";
	}

	public Connection getConnection1()throws Exception, ClassNotFoundException{
		Connection	con	=	null;
		String		url	=	"jdbc:mysql://localhost:3306/crmsocia_socia";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con	=	DriverManager.getConnection(url, user, pass);
			System.out.println("Conexion Existosa");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("driver no encontrado");
		}
		return con;
	}
	
	public static void main(String [] args){
		try{
			Conexion	c	=	new	Conexion();
			Connection	con 	=	c.getConnection1();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
