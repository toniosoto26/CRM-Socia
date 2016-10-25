package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.socia.DTO.AppointmentDTO;
import com.socia.conexion.Conexion;

public class AppointmentDAO {

	
	public AppointmentDAO(){
		
	}
	
	public List<AppointmentDTO>	getBdm(){
		Connection				con			=	null;
		PreparedStatement		ps			=	null;
		ResultSet				rs			=	null;
		AppointmentDTO			ap			=	null;
		List<AppointmentDTO>	arrApoint	=	new	ArrayList<AppointmentDTO>();
		StringBuilder			sql			=	new	StringBuilder();
		Conexion				conexion	=	null;
		
		try{
			sql.delete(0, sql.length());
			sql.append(" SELECT user.*  ");
			sql.append(" FROM crm_user user ");
			sql.append(" join crm_mvs_user mvs on user.crm_user_id = mvs.crm_user_id ");
			sql.append(" join crm_user_role role on mvs.crm_user_role_id = role.crm_user_role_id ");
			sql.append(" WHERE role.crm_user_role_id = ?");
			
			conexion	=	new Conexion();
			con			=	conexion.getConnection1();
			ps			=	con.prepareStatement(sql.toString());
			ps.setInt(1, 1);
			rs			=	ps.executeQuery();
			
			while(rs.next()){
				ap	=	new AppointmentDTO();
				ap.setCrmUserId(Integer.parseInt(rs.getString("crm_user_id")));
				ap.setFirstName(rs.getString("first_name"));
				ap.setLastName(rs.getString("last_name"));
				ap.setEmail(rs.getString("email"));
				
				arrApoint.add(ap);
				
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ps.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}

		return arrApoint;
	}
}
