package com.socia.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.CallDAO;
import com.socia.DAO.ClientDAO;
import com.socia.DAO.ConsecutiveDAO;
import com.socia.DAO.ContactDAO;
import com.socia.DAO.TransactionDAO;
import com.socia.DTO.CallDTO;
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
		int option=Integer.parseInt(request.getParameter("option"));
		String					url			=	"";	
		int						clientId	= 	0;
		int						contactId	= 	0;
		
		///////**********  DAO ***************
		
		ClientDAO objClient = new ClientDAO();
		ContactDAO objContact = new ContactDAO();
		ConsecutiveDAO	objConsecutive=	new ConsecutiveDAO();
		CallDAO objCall = new CallDAO();
		
		///////**********  DTO ****************
		ContactDTO	infoContact	= new ContactDTO();
		CallDTO  infoCall = null;
		ClientDTO infoClient = null;
		
		///////********** Transaction **************
		TransactionDAO					transaction			= new TransactionDAO();
		ArrayList<StringBuilder>		queries				= new ArrayList<StringBuilder>();
		
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
			
			url = "utils/selectContact.jsp";
		}

		if(option == 3){
			contactId = Integer.parseInt(request.getParameter("contactId"));
			infoContact = objContact.getContactsById(contactId);
			
			session.removeAttribute("infoContact");
			session.setAttribute("infoContact", infoContact);
			
			url = "utils/contactInfo.jsp";
		}
		
		//registro de llamadas 
		if(option == 4){
			int variable=1;
			String companyName="";
			String contact ="";
			String emailContact="";
			String telContact="";
			String observations="";
			int id_client=0;
			int id_contact=0;
			int consecutiveCall=0;
			variable = Integer.parseInt(request.getParameter("variable"));
			companyName=request.getParameter("selectClient");
			contact =request.getParameter("companyContact");
			emailContact=request.getParameter("companyEmail");
			telContact=request.getParameter("companyPhone");
			observations=request.getParameter("observation");
			consecutiveCall=objConsecutive.getConsecutive("calls");
			
			
			if(variable==0){
				id_client=Integer.parseInt(request.getParameter("clientId"));
				id_contact=Integer.parseInt(request.getParameter("contactId"));
				//no se crea nuevo cliente
				//inserto llamada
				infoCall = new CallDTO(consecutiveCall, observations, id_client, 1, id_contact);
				queries=objCall.insertNewCall(infoCall, queries);
				
				//queries=objClient.insertClientContact(id_client,id_contact,queries);
				
			}
			else{
				//se crea un nuevo cliente
				int consecutiveClient=objConsecutive.getConsecutive("clients");
				int consecutiveContact=objConsecutive.getConsecutive("contacts");
				//inserto cliente 
				infoClient = new ClientDTO(consecutiveClient, companyName, 1);
				queries=objClient.insertNewClient(infoClient, queries);
				//inserto contacto 
				infoContact = new ContactDTO(consecutiveContact, contact, "lastName", telContact, emailContact);
				queries=objContact.insertNewContact(infoContact, queries);
				//inserto cliente-contacto
				queries=objClient.insertClientContact(consecutiveClient, consecutiveContact, queries);
				//inserto llamada
				infoCall = new CallDTO(consecutiveCall, observations, consecutiveClient, 1, consecutiveContact);
				queries=objCall.insertNewCall(infoCall, queries);
			}
			
			boolean stat=false;
			try
			{
				transaction.openConnection();
				transaction.insertAll(queries);
				transaction.commit();
				stat=true;
			}catch(Exception exception){
				stat= false;
				transaction.rollback();
				exception.printStackTrace();
			}finally{
				transaction.closeConnection();
			}

			session.removeAttribute("insertCall");
			session.setAttribute("insertCall", stat);
			
			url = "views/validateInsertCall.jsp";
		}
		
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
