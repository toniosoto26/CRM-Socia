package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.socia.DTO.AppointmentDTO;
import com.socia.DTO.CallDTO;
import com.socia.DTO.ContactDTO;
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
	
	public	ArrayList<StringBuilder> updateContactAppointment(ContactDTO contact, ArrayList<StringBuilder> queries){
		StringBuilder	updQuery	=	null;
		
		updQuery	=	new	StringBuilder();
		updQuery.append(" Update crm_contact ");
		updQuery.append(" set phone = ");
		updQuery.append(contact.getPhone());
		updQuery.append(", email = '");
		updQuery.append(contact.getEmail());
		updQuery.append("' ");
		updQuery.append(" where crm_contact_id = ");
		updQuery.append(contact.getContactId() );
		updQuery.append(" and status = 'A' ");
		
		queries.add(updQuery);
		
		return queries;
	}
	
	public List<String>	reviewAppointment(AppointmentDTO appoint, String dia){
		List<String>			contactAppo	=	new	ArrayList<String>();
		Connection				con			=	null;
		PreparedStatement		ps			=	null;
		ResultSet				rs			=	null;
		Conexion				conexion	=	null;
		StringBuilder			query		=	null;
		String					fName		=	"";
		String					lName		=	"";
		String					dAppoint	=	"";
		
		try{
			query	=	new	StringBuilder();
			query.append(" select	c.first_name ");
			query.append(" ,c.last_name ");
			query.append(" ,a.date	");
			query.append(" from crm_appointment a	");
			query.append(" join crm_contact c on c.crm_contact_id = a.crm_contact_id ");
			query.append(" where crm_client_id = ?");
			query.append(" and a.crm_contact_id = ?	");
			query.append(" and date >= ? ");
			query.append(" and date <= ? ");
			
			conexion	=	new	Conexion();
			con			=	conexion.getConnection1();
			ps			=	con.prepareStatement(query.toString());
			ps.setInt(1, appoint.getCrmClientId());
			ps.setInt(2,appoint.getCrmContactId());
			ps.setString(3, dia+" 00:00");
			ps.setString(4, dia+" 23:59");
			
			/*System.out.println(query.toString());
			System.out.println("1 "+ appoint.getCrmClientId());
			System.out.println("2 "+ appoint.getCrmContactId());
			System.out.println("3 "+ dia+" 00:00");
			System.out.println("4 "+ dia+" 23:59");*/
			rs	=	ps.executeQuery();
			
			while(rs.next()){
				fName		=	rs.getString(1);
				lName		=	rs.getString(2);
				dAppoint	=	rs.getString(3);
				
				contactAppo.add(fName+" "+lName+" en la fecha "+dAppoint);
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
		return contactAppo;
	}

	public List<AppointmentDTO>	getAppointments(){
		List<AppointmentDTO>	arrAppo		=	new	ArrayList<AppointmentDTO>();
		AppointmentDTO			appointment	= 	new AppointmentDTO();
		Connection				con			=	null;
		PreparedStatement		ps			=	null;
		ResultSet				rs			=	null;
		Conexion				conexion	=	null;
		StringBuilder			query		=	null;
		String					companyName	=	"";
		String					fName		=	"";
		String					lName		=	"";
		String					dAppoint	=	"";
		
		try{
			query	=	new	StringBuilder();
			query.append(" SELECT client.company_name, appointment.date, contact.first_name, contact.last_name ");
			query.append(" FROM crm_appointment appointment, crm_client client, crm_contact contact ");
			query.append(" where appointment.crm_client_id = client.crm_client_id ");
			query.append(" and appointment.crm_contact_id = contact.crm_contact_id ");
			
			conexion	=	new	Conexion();
			con			=	conexion.getConnection1();
			ps			=	con.prepareStatement(query.toString());
			
			
			rs	=	ps.executeQuery();
			
			while(rs.next()){
				companyName	=	rs.getString(1);
				dAppoint	=	rs.getString(2);
				fName		=	rs.getString(3);
				lName		=	rs.getString(4);
				
				appointment.setCompanyName(companyName);
				appointment.setDate(dAppoint.replace(" ", "T"));
				appointment.setFirstName(fName);
				appointment.setLastName(lName);
				
				arrAppo.add(appointment);
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
		return arrAppo;
	}
}
