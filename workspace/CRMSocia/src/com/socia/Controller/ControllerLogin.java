package com.socia.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.LoginDAO;
import com.socia.DTO.LoginDTO;

/**
 * Servlet implementation class ControllerLogin
 */
@WebServlet("/ControllerLogin")
public class ControllerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession	sessionT	=	request.getSession();
		String		urlT		=	"/index.jsp";
		if(request.getParameter("cerrarSesion").equals("T")){
			sessionT.removeAttribute("sessionLogin");
		}
		request.getRequestDispatcher(urlT).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession	session	=	request.getSession();
		String		user	=	request.getParameter("user");
		String		pass	=	request.getParameter("passwd");
		String		url		=	"/views/validateUser.jsp";
		
		try{
			LoginDAO	loginDao	=	new	LoginDAO();
			LoginDTO	loginDto	=	loginDao.validateUser(user, pass);

			if(loginDto != null){
				
				session.removeAttribute("user");
				session.setAttribute("user", user);
				
				session.removeAttribute("sessionLogin");
				session.setAttribute("sessionLogin", loginDto);
			}else{
				
				session.removeAttribute("sessionLogin");
				session.setAttribute("sessionLogin", loginDto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
	}

}
