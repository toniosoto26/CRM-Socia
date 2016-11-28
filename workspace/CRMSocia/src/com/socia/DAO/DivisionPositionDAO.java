package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.DivisionDTO;
import com.socia.DTO.PositionDTO;
import com.socia.conexion.Conexion;

public class DivisionPositionDAO {

	public ArrayList<DivisionDTO> getDivisions(){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		DivisionDTO lobDivision= new DivisionDTO();
		ArrayList<DivisionDTO>	arrDivisions		=new ArrayList<DivisionDTO>();
		int 					company_division_id	=0;
		String 					name	=	"";

		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_company_division ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());

			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				company_division_id = resultSet.getInt(1);
				name = resultSet.getString(2);
				
				lobDivision = new DivisionDTO(company_division_id, name);
				arrDivisions.add(lobDivision);
				
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
		
		return arrDivisions;
	}
	
	
	
	public ArrayList<PositionDTO> getPositions(){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		PositionDTO lobPositions= new PositionDTO();
		ArrayList<PositionDTO>	arrPositions		=new ArrayList<PositionDTO>();
		int 					id_position	=0;
		String 					position	=	"";

		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_position ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());

			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				id_position = resultSet.getInt(1);
				position = resultSet.getString(2);
				
				lobPositions = new PositionDTO(id_position, position);
				arrPositions.add(lobPositions);
				
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
		
		return arrPositions;
	}
	
	
	
	
}
