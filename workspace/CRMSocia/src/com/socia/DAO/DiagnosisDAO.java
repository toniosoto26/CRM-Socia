package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.socia.DTO.DiagnosisDTO;
import com.socia.DTO.DiagnosisRequirement;

public class DiagnosisDAO {
	
	public DiagnosisDAO(){
		//copiaArchivo("","");
	}

	
	public List<DiagnosisDTO> getLastUpdate(int	clientId, Connection con){
		
		List<DiagnosisDTO>	lst	=	new	ArrayList<DiagnosisDTO>();
		
		PreparedStatement	ps	=	null;
		ResultSet			rs	=	null;
		
		StringBuilder		sql		=	new	StringBuilder();
		
		DiagnosisDTO		diag	=	null;
		
		try{
			
			sql.delete(0, sql.length());
			sql.append(" select 	d.date_updated ");
			sql.append(" ,u.first_name+' '+u.last_name nombre ");
			sql.append(" ,c.client_type ");
			sql.append(" from	crm_diagnosis d ");
			sql.append(" ,crm_user u ");
			sql.append(" ,crm_client c ");
			sql.append(" where	d.crm_client_id = ? ");
			sql.append(" and		c.crm_client_id = d.crm_client_id ");
			sql.append(" and		c.crm_user_id = d.crm_user_id ");
			sql.append(" and		u.crm_user_id	= c.crm_user_id ");
			
			ps	=	con.prepareStatement(sql.toString());
			ps.setInt(1, clientId);
			
			rs	=	ps.executeQuery();
			
			if(rs.next()){
				diag	=	new	DiagnosisDTO();
				diag.setDateUpdate(rs.getString("date_updated"));
				diag.setName(rs.getString("nombre"));
				if("P".equals(rs.getString("client_type")))
					diag.setClientType("Prospecto");
				else
					diag.setClientType("Cliente");
				lst.add(diag);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				ps.close();
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}		
		return lst;
	}
	
	
	public ArrayList<StringBuilder> insertFiles(DiagnosisRequirement diagnosis, ArrayList<StringBuilder> queries){
		StringBuilder		sqlQuery	=	null;
		
    	sqlQuery	=	new	StringBuilder();
		sqlQuery.append(" INSERT INTO crm_reg_req (client_id, id_requirement, path, load_date, id_user,status) ");
		sqlQuery.append(" VALUES ("+diagnosis.getClient_id());
		sqlQuery.append(","+diagnosis.getId_requirement());
		sqlQuery.append(",'"+diagnosis.getPath()+"'");
		sqlQuery.append(",DATE_SUB(NOW(), INTERVAL 7 HOUR)");
		sqlQuery.append(","+diagnosis.getId_user());
		sqlQuery.append(",'"+diagnosis.getStatus()+"')");
		
		queries.add(sqlQuery);
        return queries;
    }
	
	public int getIdRequirement(String requirement){
		int req=0;
		if(requirement.trim().equals("acta")){
			req=1;
		}
		else if(requirement.trim().equals("rfc")){
			req=2;
		}
		else if(requirement.trim().equals("r1")){
			req=3;
		}
		else if(requirement.trim().equals("domicilio")){
			req=4;
		}
		else if(requirement.trim().equals("EdoFinanciero")){
			req=5;
		}
		else if(requirement.trim().equals("formatoEspecial")){
			req=6;
		}
		else if(requirement.trim().equals("IdLegal")){
			req=7;
		}
		else if(requirement.trim().equals("cuenta")){
			req=8;
		}
		else{
			req=0;
		}
		
		return req;
	}
	 
	 public static void main(String args[]){
		 new DiagnosisDAO();
	 }
	
	
}
