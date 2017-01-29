package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.socia.DTO.AppointmentDTO;
import com.socia.DTO.AppointmentLogDTO;
import com.socia.DTO.CallDTO;
import com.socia.DTO.CallLogDTO;
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
			sql.append(" join crm_user_userrole uur on user.crm_user_id = uur.crm_user_id ");
			sql.append(" join crm_user_role role on uur.crm_user_role_id = role.crm_user_role_id ");
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
	
	
	public ArrayList<StringBuilder> insertAppointment(AppointmentDTO appoint,int addressId, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_appointment(crm_appointment_id,date,crm_client_id,crm_user_id,crm_contact_id,crm_bdm_id, crm_address_id, subject )");
		sqlQuery.append(" VALUES ("+appoint.getCrmAppointmentId());
		sqlQuery.append(",'"+appoint.getDate()+"'");
		sqlQuery.append(","+appoint.getCrmClientId());
		sqlQuery.append(","+appoint.getCrmUserId());
		sqlQuery.append(","+appoint.getCrmContactId());
		sqlQuery.append(", "+appoint.getcrmBdmId());
		sqlQuery.append(", "+addressId);
		sqlQuery.append(", '"+appoint.getComments()+"')");
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
		AppointmentDTO			appointment	= 	null;
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
				
				appointment = new AppointmentDTO();
				
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
	
	public ArrayList<AppointmentLogDTO> getAppointmentLog(String clientType, String fechaIni,String fechaFin,int userId){
		Conexion			sociaDB		=	null;
		Connection			connection	=	null;
		PreparedStatement	statement	=	null;
		ResultSet			resultSet	=	null;
		StringBuilder		sqlQuery	=	null;
		
		/** Appointment objects*/
		String				 			companyName		= "";
		String						 	contactName		= "";
		String	 						position		= "";
		Date							date			= null;
		String							subject			= "";
		String							bdmName			= "";
		AppointmentLogDTO				appointment		=	null;
		ArrayList<AppointmentLogDTO>	arrAppointment	= 	new ArrayList<AppointmentLogDTO>();
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select cli.company_name,cont.first_name, cont.last_name, position, apo.date,  ");
			sqlQuery.append(" apo.subject, usr.first_name, usr.last_name ");
			sqlQuery.append(" from crm_contact cont , crm_position pos, crm_appointment apo, crm_client cli, crm_user usr ");
			sqlQuery.append(" where apo.crm_client_id=cli.crm_client_id ");
			sqlQuery.append(" and apo.crm_contact_id=cont.crm_contact_id ");
			sqlQuery.append(" and apo.crm_bdm_id=usr.crm_user_id ");
			sqlQuery.append(" and cont.id_position=pos.id_position ");
			sqlQuery.append(" and DATE(apo.date) >= ? ");
			sqlQuery.append(" and DATE(apo.date) <= ? ");
			sqlQuery.append(" and apo.crm_user_id = ? ");
			sqlQuery.append(clientType.equals("")?"":" and cli.client_type = ? ");
			sqlQuery.append(" order by apo.date ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
			System.out.println(userId);
			
			statement.setString(1, fechaIni);
			statement.setString(2, fechaFin);
			statement.setInt(3, userId);
			if(!clientType.equals(""))
				statement.setString(4, clientType);
			
			resultSet	=	statement.executeQuery();
			
			while(resultSet.next()){
				companyName=resultSet.getString(1);
				contactName = resultSet.getString(2)+" "+resultSet.getString(3);
				position = resultSet.getString(4);
				date = resultSet.getDate(5);
				subject = resultSet.getString(6);
				bdmName = resultSet.getString(7)+" "+resultSet.getString(8);
				
				appointment = new AppointmentLogDTO(companyName, contactName, position, date, subject, bdmName);
				arrAppointment.add(appointment);
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
		
		return arrAppointment;
	}
	
}
