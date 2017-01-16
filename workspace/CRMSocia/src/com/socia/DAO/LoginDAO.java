package com.socia.DAO;

import com.socia.DTO.LoginDTO;
import com.socia.conexion.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	public LoginDTO validateUser(String userLogin, String passwdLogin){
		Conexion			c			=	null;
		Connection			con			=	null;
		PreparedStatement	ps			=	null;
		ResultSet			rs			=	null;
		StringBuilder		sql			=	null;
		String				user		=	"";
		String				passwd		=	"";
		boolean				isTrue		=	false;
		LoginDTO			objLogin	=	null;
		
		try{
			sql	=	new	StringBuilder();
			sql.append(" select u.*, uur.crm_user_role_id ");
			sql.append(" from crm_user u, crm_user_userrole uur  ");
			sql.append(" where u.user = ?");
			sql.append(" and u.password = ? ");
			sql.append(" and u.crm_user_id = uur.crm_user_id ");
			
			c	=	new	Conexion();
			con	=	c.getConnection1();
			ps	=	con.prepareStatement(sql.toString());
			ps.setString(1, userLogin);
			ps.setString(2, passwdLogin);
			
			rs	=	ps.executeQuery();
			
			if(rs.next()){
				objLogin	=	new LoginDTO();
				objLogin.setCrmUserId(rs.getInt(1));
				objLogin.setUser(rs.getString(2));
				objLogin.setPassword(rs.getString(3));
				objLogin.setFirstName(rs.getString(4));
				objLogin.setLastName(rs.getString(5));
				objLogin.setEmail(rs.getString(6));
				objLogin.setDateCreated(rs.getString(7));
				objLogin.setStatus(rs.getString(8));
				objLogin.setType(rs.getString(9));
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
		
		return objLogin;
	}
}
