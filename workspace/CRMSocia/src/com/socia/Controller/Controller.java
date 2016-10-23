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
import com.socia.DAO.ConsecutiveDAO;
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
		ConsecutiveDAO					objConsecutive		=	new ConsecutiveDAO();
		int option=Integer.parseInt(request.getParameter("option"));
		String					url			=	"";	
		int						clientId	= 	0;
		int						contactId	= 	0;
		
		
		
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
			
			ContactDTO	infoContact	= new ContactDTO();
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
			variable = Integer.parseInt(request.getParameter("variable"));
			companyName=request.getParameter("selectClient");
			contact =request.getParameter("companyContact");
			emailContact=request.getParameter("companyEmail");
			telContact=request.getParameter("companyPhone");
			observations=request.getParameter("observation");
			
			
			if(variable==0){
				id_client=Integer.parseInt(request.getParameter("clientId"));
				id_contact=Integer.parseInt(request.getParameter("contactId"));
				System.out.println("consecutivoLLamanada "+objConsecutive.getConsecutive("calls"));
				//no se crea nuevo cliente
				System.out.println("existente "+id_client+id_contact+observations);
			}
			else{
				//se crea un nuevo cliente
				System.out.println("nuevo"+companyName+contact+emailContact+telContact+observations);
				System.out.println("consecutivoLLamanada "+objConsecutive.getConsecutive("calls"));
				System.out.println("consecutivo cliente "+objConsecutive.getConsecutive("clients"));
				System.out.println("consecutivo contacto "+objConsecutive.getConsecutive("contacts"));
				
			}
			//ContactDTO	infoContact	= new ContactDTO();
			//infoContact = objContact.getContactsById(contactId);
			
			session.removeAttribute("insertCall");
			session.setAttribute("insertCall", true);
			
			url = "views/validateInsertCall.jsp";
		}
		
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
