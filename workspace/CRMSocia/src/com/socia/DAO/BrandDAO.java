package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.BrandDTO;
import com.socia.conexion.Conexion;

public class BrandDAO {
	
	public ArrayList<BrandDTO> getBrandsByBL(int businessLineId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Brand objects*/
		BrandDTO			brand			=	null;
		int					brandId			=	0;
		String 				name			=	"";
		ArrayList<BrandDTO>	arrBrand		= 	new ArrayList<BrandDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_brand ");
			sqlQuery.append(" WHERE crm_business_line_id = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, businessLineId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				brandId = resultSet.getInt("crm_brand_id");
				businessLineId = resultSet.getInt("crm_business_line_id");
				name = resultSet.getString("description");
				
				brand = new BrandDTO(brandId, businessLineId, name);
				
				arrBrand.add(brand);
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
		
		return arrBrand;
	}

}
