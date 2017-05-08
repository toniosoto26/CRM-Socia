package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.socia.DTO.CallDTO;
import com.socia.DTO.CallLogDTO;
import com.socia.conexion.Conexion;



public class CallDAO {
	
	public  CallDAO(){
	}
	
	public ArrayList<StringBuilder> insertNewCall(CallDTO calls, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_call (crm_call_id, comments, crm_client_id, crm_user_id, crm_contact_id,date_call,status,letter,competition)");
		sqlQuery.append(" VALUES ("+calls.getId_call());
		sqlQuery.append(",'"+calls.getComments()+"'");
		sqlQuery.append(","+calls.getCrm_client_id());
		sqlQuery.append(","+calls.getCrm_user_id());
		sqlQuery.append(","+calls.getCrm_contact_id());
		sqlQuery.append(",DATE_SUB(NOW(), INTERVAL 7 HOUR),"+calls.getStatus());
		sqlQuery.append(","+calls.getLetter());
		sqlQuery.append(","+calls.getCompetition()+")");
		
		queries.add(sqlQuery);
    
        return queries;
    }

	
	 public boolean insertCall(String us) throws SQLException{
		 	Conexion lobjConexion   = null;
	        Connection   lcnnConexion  = null;
	        PreparedStatement lobjPrepared = null;
	        String lstrConsulta="";

	        try{

	                try{
	                    lobjConexion   = new Conexion();
	                    lcnnConexion  = lobjConexion.getConnection1();
	                    lcnnConexion.setAutoCommit(false);
	                    

	                    lstrConsulta   = "INSERT INTO crm_call (crm_call_id, comments, crm_client_id, crm_user_id, crm_contact_id) VALUES (?,?,?,?,?)";

	                    lobjPrepared   = lcnnConexion.prepareStatement(lstrConsulta);


	                    lobjPrepared.setInt(1,1);
	                    lobjPrepared.setString(2,"prueba");
	                    lobjPrepared.setInt(3,1);
	                    lobjPrepared.setInt(4,1);
	                    lobjPrepared.setInt(5,1);

	                    lobjPrepared.execute();
	                    lobjPrepared.close();

	                    lcnnConexion.commit();
	                    System.out.println("insertado correctamente");

	                }catch(Exception e){
	                	lcnnConexion.rollback();
	                	lcnnConexion.close();
	                    throw new SQLException(e.getMessage());
	                }
	            
	        }catch(Exception e){
	            throw new SQLException(e.getMessage());
	        }
	    
	        return true;
	    }
	 
	 public int getCountCallClient(int clientId){
			Conexion			sociaDB		=	null;
			Connection			connection	=	null;
			PreparedStatement	statement	=	null;
			ResultSet			resultSet	=	null;
			StringBuilder		sqlQuery	=	null;
			
			int countCall=0;

			
			try{
				sqlQuery	=	new	StringBuilder();
				sqlQuery.append(" select count(crm_client_id) from crm_call where crm_client_id=?");

				sociaDB		=	new	Conexion();
				connection	=	sociaDB.getConnection1();
				statement	=	connection.prepareStatement(sqlQuery.toString());
				statement.setInt(1, clientId);
				
				resultSet	=	statement.executeQuery();
				
				if(resultSet.next()){
					countCall = resultSet.getInt(1);
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
			
			return countCall;
		}
	 
	 	
	 public ArrayList<CallLogDTO> getCallLog(String clientType, String fechaIni,String fechaFin,int crm_user_id){
			Conexion			sociaDB		=	null;
			Connection			connection	=	null;
			PreparedStatement	statement	=	null;
			ResultSet			resultSet	=	null;
			StringBuilder		sqlQuery	=	null;
			
			/** call objects*/
			CallLogDTO			lobjCallLog		=	null;
			ArrayList<CallLogDTO>	arrCallLog	= 	new ArrayList<CallLogDTO>();
			
			try{
				sqlQuery	=	new	StringBuilder();
				sqlQuery.append(" select cal.crm_user_id,usr.first_name,usr.last_name,cal.date_call,cal.status,cli.company_name, ");
				sqlQuery.append(" cont.email,cont.phone,cont.first_name, cont.last_name,position,comments, letter, competition ");
				sqlQuery.append(" from crm_contact cont , crm_position pos, crm_call cal,crm_client cli,crm_user usr ");
				sqlQuery.append(" where cal.crm_client_id=cli.crm_client_id and cal.crm_contact_id=cont.crm_contact_id and  ");
				sqlQuery.append(" cal.crm_user_id=usr.crm_user_id and cont.id_position=pos.id_position ");
				sqlQuery.append(" and DATE(cal.date_call) >= ? ");
				sqlQuery.append(" and DATE(cal.date_call) <= ? ");
				sqlQuery.append(clientType.equals("")?"":" and cli.client_type = ? ");
				sqlQuery.append(" order by cal.date_call asc");
				
				//sqlQuery.append(" and client.crm_client_id = ? ");
				
				sociaDB		=	new	Conexion();
				connection	=	sociaDB.getConnection1();
				statement	=	connection.prepareStatement(sqlQuery.toString());
				
				//statement.setInt(1, clientId);
				statement.setString(1, fechaIni);
				statement.setString(2, fechaFin);
				if(!clientType.equals(""))	
					statement.setString(3, clientType);
					
				
				Date date_call;
				String crm_user_name;
				//String crm_user_last_name;
				String client_name;
				String phone;
				String mail;
				String contact_name;
				//String contact_last_name;
				String  position;
				String comments;
				int letter;
				int competition;
				int  status;
				String semaforo="";
				String 		[]tel ;
				
				resultSet	=	statement.executeQuery();
				
				while(resultSet.next()){
					crm_user_id=resultSet.getInt(1);
					crm_user_name = resultSet.getString(2);
					//crm_user_last_name = resultSet.getString(3);
					date_call = resultSet.getDate(4);
					status = resultSet.getInt(5);
					client_name = resultSet.getString(6);
					mail = resultSet.getString(7);
					phone = resultSet.getString(8);
					contact_name = resultSet.getString(9);
					//contact_last_name = resultSet.getString(10);
					position = resultSet.getString(11);
					comments = resultSet.getString(12);
					letter = resultSet.getInt(13);
					competition = resultSet.getInt(14);
					
					tel=phone.split("ext.");
					
					if(tel.length==1){
						phone=tel[0].toString();
						
					}
					else{
						phone=tel[0].toString()+" Ext."+tel[1].toString();
						
					}

					
					if(status==1){
						semaforo="opcion 1 ";
					}
					else if(status==2){
						semaforo="opcion semaforo 2 ";
					}
					else{
						semaforo="opcion semaforo 3 ";
					}
					
					System.out.println("");
					
					lobjCallLog = new CallLogDTO(date_call, crm_user_id, crm_user_name,client_name, mail, phone, contact_name,position, comments, letter, competition, semaforo);
					arrCallLog.add(lobjCallLog);
					System.out.println(lobjCallLog.toString());
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
			
			return arrCallLog;
		}
	 
	 
		public StringBuilder generateMailPresentation(){
			StringBuilder		sqlQuery	=	null;
	    	sqlQuery	=	new	StringBuilder();
	    	
	    	sqlQuery.append("<!DOCTYPE>");
	    	  sqlQuery.append("<html>");
	    		sqlQuery.append("<head>");
	    		sqlQuery.append("</head>");
	    		sqlQuery.append("<body>");
	    		 	sqlQuery.append("<table border='0' cellpadding='0' cellspacing='0' width='100%'>");
			 			sqlQuery.append("<tr>");
			 				sqlQuery.append("<td bgcolor='#ffffff' align='center'>");
								sqlQuery.append("<a href='http://gruposocia.com' target='_blank'>");
									sqlQuery.append("<img alt='Logo' src='http://gruposocia.com/wp-content/uploads/2016/06/grupo-socia-logo-jp-hz-01-1.png' width='250' height='60' style='display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;' border='0'>");
								sqlQuery.append("</a>");		           
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Buen día");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Le saludo y al mismo tiempo aprovecho para  acompañar presentación de nuestro portafolio de productos y servicios que ponemos a su consideración. A la vez, me permito referir diferenciadores que nos han posicionado en el mercado corporativo:");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("<ul>");
									sqlQuery.append("<li>Ahorros</li>");
									sqlQuery.append("<li>Servicio</li>");
									sqlQuery.append("<li>Atención personalizada de ejecutivo de servicio</li>");
									sqlQuery.append("<li>Soporte  para desarrollo de proyectos BDM</li>");
									sqlQuery.append("<li>Soluciones innovadoras a su medida</li>");
									sqlQuery.append("<li>Entrega a nivel nacional sin costo extra</li>");
									sqlQuery.append("<li>Stock de equipos</li>");
									sqlQuery.append("<li>Precios competitivos  en refacciones, consumibles, cómputo y sistemas de impresión administrada</li>");
									sqlQuery.append("<li>Servicio y gestión de  garantías</li>");
									sqlQuery.append("<li>Renta o Compra (segmento cómputo, servidores, redes de comunicación  y servicios de impresión administrada)</li>");
								sqlQuery.append("</ul>");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Le  ofrezco brindar servicio de cotizaciones con la asignación de un Ejecutivo para cubrir sus necesidades  día a día en cualquier tema relacionado con nuestro portafolio de productos y servicios de Grupo Socia.");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("También le pido de la manera más atenta nos pueda atender en una cita para realizar una presentación mas formal.");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Quedo pendiente de sus comentarios para atender lo antes posible");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Saludos cordiales y en espera e tus comentarios");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
					sqlQuery.append("</table>");
	    		sqlQuery.append("</body>");
	    	  sqlQuery.append("</html>");
	    	
	    	
	    	return sqlQuery;
		}
		
		public StringBuilder generateMailLetter(){
			StringBuilder		sqlQuery	=	null;
	    	sqlQuery	=	new	StringBuilder();
	    	
	    	sqlQuery.append("<!DOCTYPE>");
	    	  sqlQuery.append("<html>");
	    		sqlQuery.append("<head>");
	    		sqlQuery.append("</head>");
	    		sqlQuery.append("<body>");
	    		 	sqlQuery.append("<table border='0' cellpadding='0' cellspacing='0' width='100%'>");
			 			sqlQuery.append("<tr>");
			 				sqlQuery.append("<td bgcolor='#ffffff' align='center'>");
								sqlQuery.append("<a href='http://gruposocia.com' target='_blank'>");
									sqlQuery.append("<img alt='Logo' src='http://gruposocia.com/wp-content/uploads/2016/06/grupo-socia-logo-jp-hz-01-1.png' width='250' height='60' style='display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;' border='0'>");
								sqlQuery.append("</a>");		           
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Buen día");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Le saludo y al mismo tiempo aprovecho para  acompañar presentación de nuestro portafolio de productos y servicios que ponemos a su consideración. A la vez, me permito referir diferenciadores que nos han posicionado en el mercado corporativo:");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("<ul>");
									sqlQuery.append("<li>Ahorros</li>");
									sqlQuery.append("<li>Servicio</li>");
									sqlQuery.append("<li>Atención personalizada de ejecutivo de servicio</li>");
									sqlQuery.append("<li>Soporte  para desarrollo de proyectos BDM</li>");
									sqlQuery.append("<li>Soluciones innovadoras a su medida</li>");
									sqlQuery.append("<li>Entrega a nivel nacional sin costo extra</li>");
									sqlQuery.append("<li>Stock de equipos</li>");
									sqlQuery.append("<li>Precios competitivos  en refacciones, consumibles, cómputo y sistemas de impresión administrada</li>");
									sqlQuery.append("<li>Servicio y gestión de  garantías</li>");
									sqlQuery.append("<li>Renta o Compra (segmento cómputo, servidores, redes de comunicación  y servicios de impresión administrada)</li>");
								sqlQuery.append("</ul>");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Le  ofrezco brindar servicio de cotizaciones con la asignación de un Ejecutivo para cubrir sus necesidades  día a día en cualquier tema relacionado con nuestro portafolio de productos y servicios de Grupo Socia.");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("También le pido de la manera más atenta nos pueda atender en una cita para realizar una presentación mas formal.");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Quedo pendiente de sus comentarios para atender lo antes posible");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
						sqlQuery.append("<tr><td>&nbsp;</td></tr>");
						sqlQuery.append("<tr>");
							sqlQuery.append("<td style='font-family: Arial, sans-serif; color: #333333; font-size: 12px;'>");
								sqlQuery.append("Saludos cordiales y en espera e tus comentarios");
							sqlQuery.append("</td>");
						sqlQuery.append("</tr>");
					sqlQuery.append("</table>");
	    		sqlQuery.append("</body>");
	    	  sqlQuery.append("</html>");
	    	
	    	
	    	return sqlQuery;
		}
	 

		public static void main(String args[]){
			new CallDAO();
		}
}
