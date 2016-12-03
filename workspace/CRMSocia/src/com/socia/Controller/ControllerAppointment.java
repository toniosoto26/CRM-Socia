package com.socia.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.AppointmentDAO;
import com.socia.DAO.ConsecutiveDAO;
import com.socia.DAO.ContactDAO;
import com.socia.DAO.TransactionDAO;
import com.socia.DTO.AppointmentDTO;
import com.socia.DTO.ClientDTO;
import com.socia.DTO.ContactDTO;
import com.socia.DTO.LoginDTO;
 
/**
 * Servlet implementation class ControllerAppointment
 */
@WebServlet("/ControllerAppointment")
public class ControllerAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesar(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesar(request,response);
	}

	public void  procesar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession	session	=	request.getSession();
		
		int		opc	=	Integer.parseInt(request.getParameter("opc"));
		String	url	=	"";
		TransactionDAO					transaction			= new TransactionDAO();
		boolean		stat	=	false;
		try{
			switch (opc){
				case 1:
					AppointmentDAO 			appoint	=	new	AppointmentDAO();
					List<AppointmentDTO>	arrBDM	=	appoint.getBdm();
					session.removeAttribute("arrDBM");
					session.setAttribute("arrBDM", arrBDM);
					url	=	"/views/appointments/responses/getComboBDM.jsp";
					break;
				case 2:
					int					clientId	=	Integer.parseInt(request.getParameter("contactId"));
					List<ContactDTO>	arrContact	=	new ContactDAO().getContactsByClient(clientId);
					session.removeAttribute("contactos");
					session.setAttribute("contactos", arrContact);
					url	=	"/views/appointments/responses/getContacts.jsp";
					break;
				case 3:
					int		rz		=	Integer.parseInt(request.getParameter("rz"));
					int		contId	=	Integer.parseInt(request.getParameter("contact"));
					int		phone	=	Integer.parseInt(request.getParameter("phoneI"));
					int		bdmI	=	Integer.parseInt(request.getParameter("bdmI"));
					int		userId	=	((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId();
					String	days	=	request.getParameter("days");
					String	hrs		=	request.getParameter("hrs");
					String	email	=	request.getParameter("emailI");
					String	nameI	=	request.getParameter("nameI");
					boolean	statIn	=	false;
					
									
					AppointmentDTO	c	=	new AppointmentDTO();
					int		conse	=	new ConsecutiveDAO().getConsecutive("appointment");
					c.setCrmAppointmentId(conse);
					c.setDate(days+" "+hrs);
					c.setCrmClientId(rz);
					c.setCrmUserId(userId);
					c.setCrmContactId(contId);
					c.setcrmBdmId(bdmI);

					ArrayList<StringBuilder>	arrQuerys	=	new	ArrayList<StringBuilder>();
					arrQuerys	=	new AppointmentDAO().insertAppointment(c, arrQuerys);
					try
					{
						statIn	=	true;
						transaction.openConnection();
						transaction.insertAll(arrQuerys);
						transaction.commit();
						stat=true;
					}catch(Exception exception){
						statIn	=	false;
						stat= false;
						transaction.rollback();
						exception.printStackTrace();
					}finally{
						transaction.closeConnection();
					} 
					
					session.removeAttribute("nombre");
					session.setAttribute("nombre", nameI);
					session.removeAttribute("stat");
					session.setAttribute("stat", stat);
					url	=	"/views/appointments/responses/confirm.jsp";
					break;
				case 4:
					int		rzM		=	Integer.parseInt(request.getParameter("rz"));
					int		contIdM	=	Integer.parseInt(request.getParameter("contact"));
					String 	phoneM	=	request.getParameter("phone");
					String	emailM	=	request.getParameter("email");
					System.out.println("ENTRA A MODIFICAR CONTACTO");
					
					ContactDTO	contact	=	new	ContactDTO();
					contact.setContactId(contIdM);
					contact.setEmail(emailM);
					contact.setPhone(phoneM);
					
					ArrayList<StringBuilder> arrUpd	=	new	ArrayList<StringBuilder>();
					arrUpd	=	new	AppointmentDAO().updateContactAppointment(contact, arrUpd);
					try
					{
						statIn	=	true;
						transaction.openConnection();
						transaction.insertAll(arrUpd);
						transaction.commit();
						stat=true;
					}catch(Exception exception){
						statIn	=	false;
						stat= false;
						transaction.rollback();
						exception.printStackTrace();
					}finally{
						transaction.closeConnection();
					} 
					session.removeAttribute("stat");
					session.setAttribute("stat", stat);
					url	=	"/views/appointments/responses/modifiedContact.jsp";
					break;
					
				case 5:
					int		rzV		=	Integer.parseInt(request.getParameter("rz"));
					int		contIdV	=	Integer.parseInt(request.getParameter("contact"));
					String	daysV	=	request.getParameter("days");
					String	hrsV	=	request.getParameter("hrs");
					
					AppointmentDTO	appointV	=	new AppointmentDTO();
					appointV.setCrmClientId(rzV);
					appointV.setCrmContactId(contIdV);
					
					List<String>	arrInfoContact	=	new	AppointmentDAO().reviewAppointment(appointV, daysV);
					System.out.println(arrInfoContact.size());
					boolean	isTrue	=	false;
					if(arrInfoContact.size() > 0)
						isTrue	=	true;
					System.out.println(isTrue);
					session.removeAttribute("exists");
					session.setAttribute("exists", isTrue);
					session.removeAttribute("arrInfoC");
					session.setAttribute("arrInfoC",arrInfoContact );
					
					url	=	"/views/appointments/responses/validateAppointment.jsp";
					
					break;
				
				case 6:
					List<AppointmentDTO>	arrAppointments	=	new AppointmentDAO().getAppointments();
					
					for(int j=0; j<arrAppointments.size(); j++)
						System.out.println(arrAppointments.get(j).toString());
					
					
					session.removeAttribute("calendarAppointment");
					session.setAttribute("calendarAppointment", arrAppointments);
					url	=	"/views/appointments/responses/getAppointment.jsp";
					break;
					
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);	
	}
	
}
