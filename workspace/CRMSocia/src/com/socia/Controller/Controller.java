package com.socia.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.ClientDAO;
import com.socia.DAO.ContactDAO;
import com.socia.DTO.ClientDTO;
import com.socia.DTO.ContactDTO;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
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
		HttpSession	session	=	request.getSession();
		ClientDAO objClient = new ClientDAO();
		ContactDAO				objContact 	= 	new ContactDAO();
		int option=Integer.parseInt(request.getParameter("option"));
		String					url			=	"";	
		int						clientId	= 	0;
		
		
		
		if(option == 1){
			url		=	"/utils/selectClient.jsp";
			ArrayList<ClientDTO> arrClient = new ArrayList<ClientDTO>(); 
			arrClient=objClient.getClients();
			
			session.removeAttribute("arrClient");
			session.setAttribute("arrClient", arrClient);
		}
		
		
		if(option == 2){
			clientId = Integer.parseInt(request.getParameter("clientId"));
			
			ArrayList<ContactDTO>	arrContact	= new ArrayList<ContactDTO>();
			arrContact = objContact.getContactsByClient(clientId);
			
			session.removeAttribute("arrContact");
			session.setAttribute("arrContact", arrContact);
			
			url = "utils/contactInfo.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
