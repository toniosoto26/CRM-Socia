package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.socia.DTO.AppointmentDTO;
import com.socia.DTO.CallDTO;
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
	
	
	public int	getConse(){
		StringBuilder			sql			=	new StringBuilder();
		int 					x			=	0;
		Connection				con			=	null;
		PreparedStatement		ps			=	null;
		ResultSet				rs			=	null;
		Conexion				conexion	=	null;
		try{
			sql.delete(0, sql.length());
			sql.append("SELECT crm_appointment_id ");
			sql.append(" FROM crm_appointment ");
			sql.append(" ORDER BY 1 DESC LIMIT 1 ");
			
			conexion	=	new Conexion();
			con			=	conexion.getConnection1();
			ps			=	con.prepareStatement(sql.toString());
			rs			=	ps.executeQuery();
			
			if(rs.next())
				x = rs.getInt(1);
			
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
		
		return x;
	}
	
	
	public ArrayList<StringBuilder> insertAppointment(AppointmentDTO appoint, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_appointment(crm_appointment_id,date,crm_client_id,crm_user_id,crm_contact_id,crm_bdm_id )");
		sqlQuery.append(" VALUES ("+appoint.getCrmAppointmentId());
		sqlQuery.append(",'"+appoint.getDate()+"'");
		sqlQuery.append(","+appoint.getCrmClientId());
		sqlQuery.append(","+appoint.getCrmUserId());
		sqlQuery.append(","+appoint.getCrmContactId());
		sqlQuery.append(", "+appoint.getcrmBdmId()+" )");
		// INSERT INTO crm_appointment VALUES (2,'2016-10-11 05:25',2,2,0)
		queries.add(sqlQuery);
    
        return queries;
    }
}
