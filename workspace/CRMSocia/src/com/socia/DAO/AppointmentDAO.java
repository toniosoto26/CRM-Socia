package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.socia.DTO.AppointmentDTO;
import com.socia.DTO.AppointmentLogDTO;
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
		int						appointmentId=  0;
		
		try{
			query	=	new	StringBuilder();
			query.append(" SELECT client.company_name, appointment.date, contact.first_name, contact.last_name, appointment.crm_appointment_id ");
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
				appointmentId=	rs.getInt("crm_appointment_id");
				
				appointment = new AppointmentDTO();
				
				appointment.setCompanyName(companyName);
				appointment.setDate(dAppoint.replace(" ", "T"));
				appointment.setFirstName(fName);
				appointment.setLastName(lName);
				appointment.setCrmAppointmentId(appointmentId);
				
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
		String							strDate			= "";
		String							strTime			= "";
		Date							date			= null;
		String							subject			= "";
		String							bdmName			= "";
		Date							dateCreated		= null;
		AppointmentLogDTO				appointment		=	null;
		ArrayList<AppointmentLogDTO>	arrAppointment	= 	new ArrayList<AppointmentLogDTO>();

		DateFormat 						format 			= new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		try{
			sqlQuery	=	new	StringBuilder();
			sqlQuery.append(" select cli.company_name,cont.first_name, cont.last_name, position, DATE(apo.date),  ");
			sqlQuery.append(" TIME(apo.date), apo.subject, usr.first_name, usr.last_name, apo.date_created ");
			sqlQuery.append(" from crm_contact cont , crm_position pos, crm_appointment apo, crm_client cli, crm_user usr ");
			sqlQuery.append(" where apo.crm_client_id=cli.crm_client_id ");
			sqlQuery.append(" and apo.crm_contact_id=cont.crm_contact_id ");
			sqlQuery.append(" and apo.crm_bdm_id=usr.crm_user_id ");
			sqlQuery.append(" and cont.id_position=pos.id_position ");
			sqlQuery.append(" and DATE(apo.date_created) >= ? ");
			sqlQuery.append(" and DATE(apo.date_created) <= ? ");
			sqlQuery.append(" and apo.crm_user_id = ? ");
			sqlQuery.append(clientType.equals("")?"":" and cli.client_type = ? ");
			sqlQuery.append(" order by apo.date_created desc ");
			
			sociaDB		=	new	Conexion();
			connection	=	sociaDB.getConnection1();
			statement	=	connection.prepareStatement(sqlQuery.toString());
			
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
				strDate = resultSet.getString(5);
				strTime = resultSet.getString(6);
				
				date = format.parse(strDate+" "+strTime);
				
				subject = resultSet.getString(7);
				bdmName = resultSet.getString(8)+" "+resultSet.getString(9);
				
				dateCreated = resultSet.getDate("date_created");
				
				appointment = new AppointmentLogDTO(companyName, contactName, position, date, subject, bdmName, dateCreated);
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
	
	public AppointmentDTO getAppointmentById(int crmAppointmentId){
		AppointmentDTO			appointment	= 	null;
		Connection				con			=	null;
		PreparedStatement		ps			=	null;
		ResultSet				rs			=	null;
		Conexion				conexion	=	null;
		StringBuilder			query		=	null;

		Date					date		=	null;
		String					strDate		=	"";
		String					companyName	=	"";
		String					fName		=	"";
		String					lName		=	"";
		String					bdmName		=	"";
		String					addressDesc =	"";
		String					comments	=	"";

		DateFormat 				format 		= new SimpleDateFormat("dd 'de' MMMM 'de' yyyy 'a las' HH:mm 'hrs'");
		
		try{
			query	=	new	StringBuilder();
			query.append(" SELECT a.date, client.company_name,  contact.first_name, contact.last_name, ");
			query.append(" user.first_name bdm_fname, user.last_name bdm_lname, address.street, ");
			query.append(" address.ext_num, address.int_num,address.suburb, address.city, address.state, ");
			query.append(" address.country, a.subject ");
			query.append(" FROM crm_appointment a ");
			query.append(" JOIN crm_client client ON a.crm_client_id = client.crm_client_id ");
			query.append(" JOIN crm_contact contact ON a.crm_contact_id = contact.crm_contact_id ");
			query.append(" JOIN crm_address address ON a.crm_address_id = address.crm_address_id ");
			query.append(" JOIN crm_user user ON a.crm_bdm_id = user.crm_user_id ");
			query.append(" WHERE a.crm_appointment_id = ? ");
			
			conexion	=	new	Conexion();
			con			=	conexion.getConnection1();
			ps			=	con.prepareStatement(query.toString());
			
			ps.setInt(1, crmAppointmentId);
			
			rs	=	ps.executeQuery();
			
			while(rs.next()){
				date		=	rs.getDate("date");
				strDate		=	format.format(date);
				companyName	=	rs.getString("company_name");
				fName		=	rs.getString("first_name");
				lName		=	rs.getString("last_name");
				bdmName		=	rs.getString("bdm_fname")+" "+rs.getString("bdm_lname");
				addressDesc	=	rs.getString("street")+" No. "+rs.getInt("ext_num")+
				(rs.getString("int_num")!=null?" Int. "+rs.getInt("int_num"):"")+", "+rs.getString("suburb")+", "
				+rs.getString("city")+", "+rs.getString("state")+", "+rs.getString("country");
				comments	=	rs.getString("subject");
				
				appointment = new AppointmentDTO();
				
				appointment.setDate(strDate);
				appointment.setCompanyName(companyName);
				appointment.setFirstName(fName);
				appointment.setLastName(lName);
				appointment.setBdmName(bdmName);
				appointment.setAddressDescription(addressDesc);
				appointment.setComments(comments);
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
		return appointment;
	}
	
	public String sendMailAppointment(AppointmentDTO appointment, int crmUserId){
		
		/**Conexiones**/
		Connection			con			=	null;
		ResultSet			rs			=	null;
		PreparedStatement	ps			=	null;
		Conexion			c			=	new	Conexion();
		
		
		/**Variables**/
		String	rz			=	"";
		String	nameCon		=	"";
		String	addressCon	=	"";
		String	phoneCon	=	"";
		String	emailCon	=	"";
		String	bdm			= 	"";
		String	emailBdm	=	"";
		
		
		StringBuilder	sql	=	new	StringBuilder();
		
		sql.append("");
		try{
			
			sql.delete(0, sql.length());
			sql.append(" select c.company_name as razon ");
			sql.append(" ,CONCAT(ccon.first_name,' ',ccon.last_name) as nombre ");
			sql.append(" ,CONCAT(ca.street,', Num ext: ',ca.ext_num) as direcc ");
			sql.append(" ,ccon.phone as phoneContac ");
			sql.append(" ,ccon.email as emailContac ");
			sql.append(" ,(select CONCAT(cu.first_name,'',cu.last_name)   ");
			sql.append(" 		from crm_user cu ");
			sql.append(" 		where crm_user_id = ? ) as BDM ");
			sql.append(" ,(select cu.email  ");
			sql.append(" 		from crm_user cu ");
			sql.append(" 		where crm_user_id = ? ) as emailDBM ");
			sql.append(" from	crm_client c ");
			sql.append(" join	crm_client_contact ccc on ccc.crm_client_id = c.crm_client_id ");
			sql.append(" join	crm_contact ccon	on	ccon.crm_contact_id = ccc.crm_contact_id ");
			sql.append(" join 	crm_client_address cca on cca.crm_client_id = c.crm_client_id ");
			sql.append(" join	crm_address	ca	on	cca.crm_address_id = ca.crm_address_id ");
			sql.append(" where 	c.crm_client_id = ? ");
			
			con	=	c.getConnection1();
			ps	=	con.prepareStatement(sql.toString());
			ps.setInt(1, appointment.getCrmUserId());
			ps.setInt(2, appointment.getCrmUserId());
			ps.setInt(3, appointment.getCrmClientId());
			
			rs	=	ps.executeQuery();
			
			sql.delete(0, sql.length());
			
			if(rs.next()){
				rz			=	rs.getString("razon").trim();
				nameCon		=	rs.getString("nombre").trim();
				addressCon	=	rs.getString("direcc").trim();
				phoneCon	=	rs.getString("phoneContac").trim();
				emailCon	=	rs.getString("emailContac").trim();
				bdm			= 	rs.getString("BDM").trim();
				emailBdm	=	rs.getString("emailDBM").trim();
				
				sql.delete(0, sql.length());
				sql.append("<!DOCTYPE html>");
				sql.append("<html>");
				sql.append("	<head>");
				sql.append("	</head>");
				sql.append("	<body>");
				sql.append("		<table border='0' cellpadding='0' cellspacing='0' width='100%'>");
				sql.append("		    <tbody><tr>");
				sql.append("		        <td bgcolor='#ffffff' align='center'>");
				sql.append("		            <table border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width: 800px;' class='wrapper'>");
				sql.append("		                <tbody><tr>	");
				sql.append("		                    <td valign='top' style='padding: 15px 0;' class='logo'>");
				sql.append("		                        <a href='http://gruposocia.com' target='_blank'>");
				sql.append("		                            <img alt='Logo' src='http://gruposocia.com/wp-content/uploads/2016/06/grupo-socia-logo-jp-hz-01-1.png' width='250' height='60' style='display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;' border='0'>");
				sql.append("		                        </a>");
				sql.append("		                    </td>");
				sql.append("		                    <td align='right'>");
				sql.append("		                    	<p style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>Referencia: </p>");
				sql.append("		                    	<p style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>25 de febrero de 2017   </p>");
				sql.append("		                    </td>");
				sql.append("		                </tr>	");
				sql.append("		            </tbody></table>");
				sql.append("		        </td>");
				sql.append("		    </tr>");
				sql.append("		    <tr>");
				sql.append("		        <td bgcolor='#ffffff' align='center' style='padding: 15px;'>");
				sql.append("		            <table border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width: 800px;' class='responsive-table'>");
				sql.append("		            	<tbody><tr>");
				sql.append("		            	<td>");
				sql.append("				            <table border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width: 100%;' class='responsive-table'>");
				sql.append("				                <tbody><tr>");
				sql.append("				                    <td>");
				sql.append("				                        <table cellspacing='0' cellpadding='0' border='0' width='100%'>");
				sql.append("				                            <tbody><tr>");
				sql.append("				                                <td valign='top' class='mobile-wrapper'>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='37%' style='width: 37%;' align='left'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'><b>Razón Social</b></td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='57%' style='width: 57%;' align='right'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;' id='previewCompanyName'>"+rz+"</td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                </td>");
				sql.append("				                </tr>");
				sql.append("				                <tr>");
				sql.append("				                    <td>");
				sql.append("				                        <table cellspacing='0' cellpadding='0' border='0' width='100%'>");
				sql.append("				                            <tbody><tr>");
				sql.append("				                                <td valign='top' style='padding: 0;' class='mobile-wrapper'>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='37%' style='width: 37%;' align='left'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'><b>Contacto</b></td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='57%' style='width: 57%;' align='right'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>"+nameCon+"</td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                </td>");
				sql.append("				                            </tr>");
				sql.append("				                        </tbody></table>");
				sql.append("				                    </td>");
				sql.append("				                </tr>");
				sql.append("				                <tr>");
				sql.append("				                    <td>");
				sql.append("				                        <table cellspacing='0' cellpadding='0' border='0' width='100%'>");
				sql.append("				                            <tbody><tr>");
				sql.append("				                                <td valign='top' style='padding: 0;' class='mobile-wrapper'>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='37%' style='width: 37%;' align='left'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'><b>Dirección</b></td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='57%' style='width: 57%;' align='right'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;' id='previewCompanyAddress'>"+addressCon+"</td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                </td>");
				sql.append("				                            </tr>");
				sql.append("				                        </tbody></table>");
				sql.append("				                    </td>");
				sql.append("				                </tr>");
				sql.append("				                <tr>");
				sql.append("				                    <td>");
				sql.append("				                        <table cellspacing='0' cellpadding='0' border='0' width='100%'>");
				sql.append("				                            <tbody><tr>");
				sql.append("				                                <td valign='top' style='padding: 0;' class='mobile-wrapper'>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='37%' style='width: 37%;' align='left'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'><b>Teléfono</b></td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='57%' style='width: 57%;' align='right'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>"+phoneCon+"</td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                </td>");
				sql.append("				                            </tr>");
				sql.append("				                        </tbody></table>");
				sql.append("				                    </td>");
				sql.append("				                </tr>");
				sql.append("				                <tr>");
				sql.append("				                    <td style='border-bottom: border-top: 1px solid #eaeaea;'>");
				sql.append("				                        <table cellspacing='0' cellpadding='0' border='0' width='100%'>");
				sql.append("				                            <tbody><tr>");
				sql.append("				                                <td valign='top' style='padding: 0;' class='mobile-wrapper'>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='37%' style='width: 37%;' align='left'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'><b>email</b></td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='57%' style='width: 57%;' align='right'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>"+emailCon+"</td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                </td>");
				sql.append("				                            </tr>");
				sql.append("				                        </tbody></table>");
				sql.append("				                    </td>");
				sql.append("				                </tr>");
				sql.append("				            </tbody></table>");
				sql.append("			            </td>");
				sql.append("			            <td width='10%' style='max-width: 10%;'></td>");
				sql.append("			            <td>");
				sql.append("				            <table border='0' cellpadding='0' cellspacing='0' width='100%' style='max-width: 100%;' class='responsive-table'>");
				sql.append("				                <tbody><tr>");
				sql.append("				                    <td>");
				sql.append("				                        <table cellspacing='0' cellpadding='0' border='0' width='100%'>");
				sql.append("				                            <tbody><tr>");
				sql.append("				                                <td valign='top' class='mobile-wrapper'>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='27%' style='width: 27%;' align='left'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'><b>BDM</b></td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='67%' style='width: 67%;' align='right'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;' id='previewCompanyName'>"+bdm+"</td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                </td>");
				sql.append("				                            </tr>");
				sql.append("				                        </tbody></table>");
				sql.append("				                    </td>");
				sql.append("				                </tr>");
				sql.append("				                <tr>");
				sql.append("				                    <td>");
				sql.append("				                        <table cellspacing='0' cellpadding='0' border='0' width='100%'>");
				sql.append("				                            <tbody><tr>");
				sql.append("				                                <td valign='top' style='padding: 0;' class='mobile-wrapper'>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='27%' style='width: 27%;' align='left'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'><b>Email</b></td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='67%' style='width: 67%;' align='right'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;' id='previewCompanyAddress'>"+emailBdm+"</td>	");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                </td>");
				sql.append("				                            </tr>");
				sql.append("				                        </tbody></table>");
				sql.append("				                    </td>");
				sql.append("				                </tr>");
				sql.append("				                <tr>");
				sql.append("				                    <td>");
				sql.append("				                        <table cellspacing='0' cellpadding='0' border='0' width='100%'>");
				sql.append("				                            <tbody><tr>");
				sql.append("				                                <td valign='top' style='padding: 0;' class='mobile-wrapper'>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='27%' style='width: 27%;' align='left'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'><b>Fecha:</b></td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                    <table cellpadding='0' cellspacing='0' border='0' width='67%' style='width: 67%;' align='right'>");
				sql.append("				                                        <tbody><tr>");
				sql.append("				                                            <td style='padding: 0 0 10px 0;'>");
				sql.append("				                                                <table cellpadding='0' cellspacing='0' border='0' width='100%'>");
				sql.append("				                                                    <tbody><tr>");
				sql.append("				                                                        <td align='left' style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>.....</td>");
				sql.append("				                                                    </tr>");
				sql.append("				                                                </tbody></table>");
				sql.append("				                                            </td>");
				sql.append("				                                        </tr>");
				sql.append("				                                    </tbody></table>");
				sql.append("				                                </td>");
				sql.append("				                            </tr>");
				sql.append("				                        </tbody></table>");
				sql.append("				                    </td>");
				sql.append("				                </tr>");
				sql.append("				            </tbody></table>");
				sql.append("			            </td>");
				sql.append("			            </tr>");
				sql.append("		            </tbody></table>");
				sql.append("		        </td>");
				sql.append("		    </tr>");
				sql.append("		    <tr>");
				sql.append("		        <td bgcolor='#ffffff' align='center' style='padding: 20px 0px;'>");
				sql.append("		            <table width='100%' border='0' cellspacing='0' cellpadding='0' align='center' style='max-width: 800px;' class='responsive-table'>");
				sql.append("		                <tbody><tr>");
				sql.append("		                    <td align='center' style='font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color:#666666;'>");
				sql.append("		                        Av. Constituyentes 653, 16 de Septiembre, Miguel Hidalgo, D.F.");
				sql.append("		                        <br>");
				sql.append("		                        Tel. 67216096");
				sql.append("		                    </td>");
				sql.append("		                </tr>");
				sql.append("		            </tbody></table>");
				sql.append("		        </td>");
				sql.append("		    </tr>");
				sql.append("		</tbody></table>");
				sql.append("	</body>");
				sql.append("</html>	");
				
				
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(ps != null) ps.close();
				if(rs != null) rs.close();
				if(con != null) con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return sql.toString();
	}
	
	
	public String[] getCorreo(int userId){
		String correo="";
		
		/**Conexiones**/
		Connection			con	=	null;
		PreparedStatement	ps	=	null;
		ResultSet			rs	=	null;
		Conexion			c	=	new	Conexion();
		
		StringBuilder	sql	=	new	StringBuilder();
		String[]		to	=	new	String[2];
		
		try{
			
			sql.delete(0, sql.length());
			sql.append(" select email ");
			sql.append(" from crm_user ");
			sql.append(" where crm_user_id = ? ");
			
			con	=	c.getConnection1();
			ps	=	con.prepareStatement(sql.toString());
			ps.setInt(1, userId);
			
			rs	=	ps.executeQuery();
			int x	=	0;
			
			while(rs.next()){
				correo	=	rs.getString("email");
				if(x<2){
					to[x] = correo;
				}
				x ++;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(ps != null) ps.close();
				if(rs != null) rs.close();
				if(con != null) con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}	
		to[0] = "rosa.mendiola.i@gmail.com";
		to[1] = "jossoto14@gmail.com";
		return to;
	}
}


