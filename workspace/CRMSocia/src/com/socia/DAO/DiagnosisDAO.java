package com.socia.DAO;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.socia.DTO.DiagnosisDTO;

public class DiagnosisDAO {
	
	public DiagnosisDAO(){
		//copiaArchivo("","");
	}

	
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
	
	
	 public boolean copiaArchivo(String lstrRutaOrigen,String lstrRutaDestino){
	     System.out.println("Entre al copiado");  
		 try {
	    	  // lstrRutaOrigen="\\C:\\Users\\Vidal\\Desktop\\evidencias dici\\aviso a proveedores NA.pdf";
	    	   //lstrRutaDestino="\\C:\\Users\\Vidal\\Desktop\\Docs\\1234\\prueba.pdf";
	    	   
	    	   
                File origen = new File(lstrRutaOrigen);
                File destino = new File(lstrRutaDestino);
                InputStream in = new FileInputStream(origen);
                OutputStream out = new FileOutputStream(destino);

                byte[] buf = new byte[1024];
                int len;

                while ((len = in.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }

                in.close();

                out.close();


	         } 
	         catch (IOException ioe){
	            ioe.printStackTrace();
	            return false;
	         }
	       return true;
	    }
	 
	 public static void main(String args[]){
		 new DiagnosisDAO();
	 }
	
	
}
