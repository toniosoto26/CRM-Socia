package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.socia.DTO.AddressDTO;
import com.socia.conexion.Conexion;

public class AddressDAO {

	public ArrayList<AddressDTO> getAddressByClient(int clientId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Address objects*/
		AddressDTO				address		=	null;
		int 					addressId	= 	0;
		String 					street		= 	"";
		String 					extNum		=	"";
		String 					intNum		=	"";
		String					suburb		=	"";
		String 					city		=	"";
		String 					state		=	"";
		String 					country		=	"";
		String 					zipCode		=	"";
		ArrayList<AddressDTO>	addressArr	= 	new ArrayList<AddressDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select address.* ");
			sqlQuery.append(" from crm_address address ");
			sqlQuery.append(" join crm_mvs_address mvs on address.crm_address_id = mvs.crm_address_id ");
			sqlQuery.append(" join crm_client client on mvs.crm_client_id = client.crm_client_id ");
			sqlQuery.append(" where address.status = 'A' ");
			sqlQuery.append(" and client.crm_client_id = ? ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			statement.setInt(1, clientId);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				addressId = resultSet.getInt(1);
				street = resultSet.getString(2);
				extNum = resultSet.getString(3);
				intNum = resultSet.getString(4);
				suburb = resultSet.getString(5);
				city = resultSet.getString(6);
				state = resultSet.getString(7);
				country = resultSet.getString(8);
				zipCode = resultSet.getString(9);
				
				address = new AddressDTO(addressId, street, extNum, intNum, suburb, city, state, country, zipCode);
				addressArr.add(address);
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
		
		return addressArr;
	}
	
	public static void main(String[] args){
		AddressDAO contact = new AddressDAO();
		System.out.println(contact.getAddressByClient(1).toString());	
	}
	
}
