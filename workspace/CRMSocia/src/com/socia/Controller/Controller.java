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
import com.socia.DAO.DivisionPositionDAO;
import com.socia.DAO.MailDAO;
import com.socia.DAO.TransactionDAO;
import com.socia.DTO.CallDTO;
import com.socia.DTO.CallLogDTO;
import com.socia.DTO.ClientDTO;
import com.socia.DTO.ContactDTO;
import com.socia.DTO.DivisionDTO;
import com.socia.DTO.LoginDTO;
import com.socia.DTO.PositionDTO;

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
		String					view		=	"";
		String[]	to= {"rmmi_ros@hotmail.com", "jossoto14@gmail.com", "vidal.sistemas@hotmail.com"};
		//String[]	to= {"vidal.sistemas@hotmail.com"};
		
		///////**********  DAO ***************
		
		ClientDAO objClient = new ClientDAO();
		ContactDAO objContact = new ContactDAO();
		DivisionPositionDAO objDivPos =new  DivisionPositionDAO();
		ConsecutiveDAO	objConsecutive=	new ConsecutiveDAO();
		CallDAO objCall = new CallDAO();
		MailDAO		objMail	=	new MailDAO();
		
		///////**********  DTO ****************
		ContactDTO	infoContact	= new ContactDTO();
		CallDTO  infoCall = null;
		ClientDTO infoClient = null;
		
		///////********** Transaction **************
		TransactionDAO					transaction			= new TransactionDAO();
		ArrayList<StringBuilder>		queries				= new ArrayList<StringBuilder>();
		
		if(option == 1){
			view = request.getParameter("view");
			
			url		=	"/utils/selectClient.jsp";
			ArrayList<ClientDTO> arrClient = new ArrayList<ClientDTO>(); 
			arrClient=objClient.getClients(((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
			
			session.removeAttribute("arrClient");
			session.setAttribute("arrClient", arrClient);

			session.removeAttribute("view");
			session.setAttribute("view", (view.trim().equals("call")?true:false));
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
			
			String companyName="";
			String contact ="";
			String emailContact="";
			String telContact="";
			String telExt="";
			String lastName="";
			String observations="";
			int id_client=0;
			int id_contact=0;
			int consecutiveCall=0;
			int addClient=0;
			int addContact=0;
			int statusCall=0;
			int letter=0;
			int competition=0;
			int division=0;
			int position=0;
			int newClientType;
			companyName=request.getParameter("selectClient");
			System.out.println("companyName "+companyName);
			contact =request.getParameter("selectContact");
			System.out.println("contact "+contact);
			lastName =request.getParameter("lastName");
			System.out.println("lastName "+lastName);
			emailContact=request.getParameter("companyEmail");
			System.out.println("emailContact "+emailContact);
			telContact=request.getParameter("companyPhone");
			telExt=request.getParameter("ext");
			telContact=telContact+"ext."+telExt;
			System.out.println("telContact "+telContact);
			observations=request.getParameter("observation");
			System.out.println("observations "+observations);
			consecutiveCall=objConsecutive.getConsecutive("calls");
			System.out.println("consecuito "+consecutiveCall);
			addClient=Integer.parseInt(request.getParameter("AddClient"));
			System.out.println("addclient "+addClient);
			addContact=Integer.parseInt(request.getParameter("AddContact"));
			System.out.println("addContact "+addContact);
			statusCall=Integer.parseInt(request.getParameter("estadoLlamada"));
			System.out.println("statusCall "+statusCall);
			letter=Integer.parseInt(request.getParameter("carta"));
			System.out.println("carta "+letter);
			competition=Integer.parseInt(request.getParameter("concurso"));
			System.out.println("carta "+competition);
			
			if(request.getParameter("idDivision")!= null)
				division=Integer.parseInt(request.getParameter("idDivision"));
			if(request.getParameter("idPosition")!= null)
				position=Integer.parseInt(request.getParameter("idPosition"));
			int consecutiveClient=0;
			int consecutiveContact=0;
			
			System.out.println("Inicia a construir Insertos");
			if(addClient == 1){
				consecutiveClient=objConsecutive.getConsecutive("clients");
				infoClient = new ClientDTO(consecutiveClient, companyName, 2, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
				queries=objClient.insertNewClient(infoClient, queries);
				System.out.println("agrega cliente");
				
			}
			if(addContact == 1){
				consecutiveContact=objConsecutive.getConsecutive("contacts");
				infoContact = new ContactDTO(consecutiveContact, contact, lastName, telContact, emailContact,division,"division",position,"position",telExt);
				queries=objContact.insertNewContact(infoContact, queries);
				System.out.println("agrega contacto");
			}
				//inserto cliente-contacto
			if(addClient==0){
				id_client=Integer.parseInt(request.getParameter("clientId"));
				consecutiveClient=id_client;
				
				infoClient = objClient.getClientById(id_client);
			}
			if(addContact==0){
				id_contact=Integer.parseInt(request.getParameter("contactId"));
				consecutiveContact=id_contact;
			}
				System.out.println("va insertar Cliente contacto");
			if(addClient==1 || addContact==1){
				queries=objClient.insertClientContact(consecutiveClient, consecutiveContact, queries);
				System.out.println("inserto cliente contacto");
			}

			/** Client type */
			newClientType = Integer.parseInt(request.getParameter("clientType"));
			if(newClientType==1 && infoClient.getClientType().equals("P"))
				queries = objClient.updateClientType(infoClient.getClientId(), "A", queries);
			
			//inserto llamada
			System.out.println("va insertar llamada");
			infoCall = new CallDTO(consecutiveCall, observations, consecutiveClient, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId(), consecutiveContact,statusCall,letter,competition);
			queries=objCall.insertNewCall(infoCall, queries);
			System.out.println("inserto llamda llamada");
			
			System.out.println("termina a construir Insertos");
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
		
		if(option == 5){

			ArrayList<DivisionDTO>	arrDivision	= new ArrayList<DivisionDTO>();
			arrDivision = objDivPos.getDivisions();
			
			session.removeAttribute("arrDivision");
			session.setAttribute("arrDivision", arrDivision);
			
			url = "utils/selectDivision.jsp";
		}
		
		if(option == 6){
			
			ArrayList<PositionDTO>	arrPosition	= new ArrayList<PositionDTO>();
			arrPosition = objDivPos.getPositions();
			
			session.removeAttribute("arrPosition");
			session.setAttribute("arrPosition", arrPosition);
			
			url = "utils/selectPosition.jsp";
		}
		if(option == 7){
			clientId = Integer.parseInt(request.getParameter("clientId"));
			
			int countCallClient=0;
			countCallClient = objCall.getCountCallClient(clientId);
			
			session.removeAttribute("countCallClient");
			session.setAttribute("countCallClient", countCallClient);
			
			url = "utils/countCalls.jsp";
		}
		if(option == 8){
			String clientType=(request.getParameter("clientType")==null?"":request.getParameter("clientType"));
			String fechaIni=request.getParameter("fechaIni");
			String fechaFin=request.getParameter("fechaFin");
			
			System.out.println("type: "+clientType);
			
			ArrayList <CallLogDTO> arrDatos= new  ArrayList<CallLogDTO>();
			try{
			arrDatos=objCall.getCallLog(clientType, fechaIni, fechaFin, 1);
			
			}catch(Exception e ){
				e.printStackTrace();
			}
			
			session.removeAttribute("datos");
			if(arrDatos.size()>0){
				session.setAttribute("datos", arrDatos);
			}
			else{
				session.setAttribute("datos", null);
			}
			
			url = "/views/calls/callDetail.jsp";
		}
		//correo  de carta 
		if(option == 9){
			boolean sendMail=true;
			StringBuilder body;
			String[] cc	= {""};
			cc[0] =  ((LoginDTO)session.getAttribute("sessionLogin")).getEmail();
			
			body = objCall.generateMailLetter();
			try{
				objMail.sendFromGMailAttachment("rosa.mendiola.i", "swaqloi8t5o9nh.,", to, cc, "Envio de Carta - Grupo Socia ", body.toString(),"C:\\Users\\Vidal\\Documents\\DoocumentsMail\\Carta Corporativa GRUPO SOCIA.pdf","Carta Corporativa GRUPO SOCIA.pdf");
			}
			catch(Exception e ){
				sendMail= false;
				e.printStackTrace();
			}
			session.removeAttribute("sendMailCalls");
			session.setAttribute("sendMailCalls", sendMail);
			
			url = "views/calls/responses/sendMailCalls.jsp";
		}
		
		
		//correo  de envio de presentacion 
		if(option == 10){
			boolean sendMail=true;
			StringBuilder body;
			String[] cc	= {""};
			cc[0] =  ((LoginDTO)session.getAttribute("sessionLogin")).getEmail();
			
			body = objCall.generateMailPresentation();
			try{
				objMail.sendFromGMailAttachment("rosa.mendiola.i", "swaqloi8t5o9nh.,", to, cc, "Envio de Presentación - Grupo Socia", body.toString(),"C:\\Users\\Vidal\\Documents\\DoocumentsMail\\Presentacion Corporativa GRUPO SOCIA.pdf","Presentacion Corporativa GRUPO SOCIA.pdf");
			}
			catch(Exception e ){
				sendMail= false;
				e.printStackTrace();
			}
			session.removeAttribute("sendMailCalls");
			session.setAttribute("sendMailCalls", sendMail);
			
			url = "views/calls/responses/sendMailCalls.jsp";
		}

		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
