package com.socia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.socia.DTO.DiagnosisDTO;

public class DiagnosisDAO {

	
	public List<DiagnosisDTO> getLastUpdate(int	clientId, Connection con){
		
		List<DiagnosisDTO>	lst	=	new	ArrayList<DiagnosisDTO>();
		
		PreparedStatement	ps	=	null;
		ResultSet			rs	=	null;
		
		String				lastUpd	=	"";
		String				name	=	"";
		String				clientT	=	"";
		
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
}
