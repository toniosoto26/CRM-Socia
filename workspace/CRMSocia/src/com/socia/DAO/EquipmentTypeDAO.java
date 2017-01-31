package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.EquipmentTypeDTO;
import com.socia.conexion.Conexion;

public class EquipmentTypeDAO {
	
	public ArrayList<EquipmentTypeDTO> getEquipmentTypeByBL(int businessLineId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Equipment type objects*/
		EquipmentTypeDTO			equipmentType	=	null;
		int							equipmentTypeId	=	0;
		String 						name			=	"";
		ArrayList<EquipmentTypeDTO>	arrEquipmentType= 	new ArrayList<EquipmentTypeDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select * ");
			sqlQuery.append(" from crm_equipment_type ");
			sqlQuery.append(" WHERE crm_business_line_id = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, businessLineId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				equipmentTypeId = resultSet.getInt("crm_equipment_type_id");
				businessLineId = resultSet.getInt("crm_business_line_id");
				name = resultSet.getString("description");
				
				equipmentType = new EquipmentTypeDTO(equipmentTypeId, businessLineId, name);
				
				arrEquipmentType.add(equipmentType);
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
		
		return arrEquipmentType;
	}

}
