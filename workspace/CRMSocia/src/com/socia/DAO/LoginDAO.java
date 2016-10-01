package com.socia.DAO;

import com.socia.DTO.LoginDTO;
import com.socia.conexion.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	public boolean validateUser(String userLogin, String passwdLogin){
		Conexion			c		=	null;
		Connection			con		=	null;
		PreparedStatement	ps		=	null;
		ResultSet			rs		=	null;
		StringBuilder		sql		=	null;
		String				user	=	"";
		String				passwd	=	"";
		boolean				isTrue	=	false;
		
		try{
			sql	=	new	StringBuilder();
			sql.append(" select * ");
			sql.append(" from crm_users ");
			sql.append(" where user = ?");
			sql.append(" and password = ? ");
			
			c	=	new	Conexion();
			con	=	c.getConnection1();
			ps	=	con.prepareStatement(sql.toString());
			ps.setString(1, userLogin);
			ps.setString(2, passwdLogin);
			
			rs	=	ps.executeQuery();
			
			if(rs.next()){
				isTrue	=	true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				ps.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return isTrue;
	}
}
