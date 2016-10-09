package com.socia.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.ContactDAO;
import com.socia.DTO.ContactDTO;

/**
 * Servlet implementation class ControllerTemp
 */
@WebServlet("/ControllerTemp")
public class ControllerTemp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerTemp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession				session		=	request.getSession();
		int						option		=	Integer.parseInt(request.getParameter("option"));
		int						clientId	= 	0;
		ContactDAO				objContact 	= 	new ContactDAO();
		String					url			=	"";
		
		if(option == 2){
			clientId = Integer.parseInt(request.getParameter("clientId"));
			
			ArrayList<ContactDTO>	arrContact	= new ArrayList<ContactDTO>();
			arrContact = objContact.getContactsByClient(clientId);
			
			session.removeAttribute("arrContact");
			session.setAttribute("arrContact", arrContact);
			
			url = "utilsTemp/contactInfo.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
