package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.Vendor;
import com.socia.conexion.Conexion;

public class VendorDAO {

	public ArrayList<Vendor> obtenerProveedores(){
		/** Cambiar conexión*/
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		/** Cambiar conexión*/
		
		Vendor				vendor		=	null;
		String				vendorNum	=	"";
		String 				name		=	"";
		
		ArrayList<Vendor>	arrVendor	= 	new ArrayList<Vendor>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select vendor_num, name ");
			sqlQuery.append(" from vendor ");
			sqlQuery.append(" where stat = 'P' ");
			
			/** Cambiar conexión*/
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			/** Cambiar conexión*/
			
			statement	=	connection.prepareStatement(sqlQuery.toString());
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				vendorNum = resultSet.getString("vendor_num");
				name = resultSet.getString("name");
				
				vendor = new Vendor(vendorNum, name);
				arrVendor.add(vendor);
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
		
		return arrVendor;
	}
	
}
